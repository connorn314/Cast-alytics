//
//  SinglePodcastAnalytics.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/22/23.
//

import SwiftUI

struct SinglePodcastAnalytics: View {
    
    var podId: String
    var podTitle: String
    var apiKey: String = Bundle.main.infoDictionary?["API_KEY"] as! String
    
    @EnvironmentObject private var vm: GeneralPodcastViewModel
    
    @State var interval: String = "week"
    @State var errorShowing: Bool = false
    @State var errorMessage: String = ""
    @State var currentTab = 12
    @State var graphData: [DownloadInterval] = []
    @State var animateChart: Bool = false
    
    @State var presentShowDescription = false
    
    var body: some View {
        if vm.analyticsCollectionDict?[podId]?.downloadsData == nil {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.theme.accent))
                .task {
                    do {
                        try await vm.loadPodcastDownloads(podId: podId, interval: interval)
//                        print("here: \(vm.analyticsCollectionDict?[podId]?.description ?? "didn't set")")
                    } catch {
                        print("now error throwing should toggle")
                        print("error: \(error.myErrorMessage())")
                        print("or: \(error.localizedDescription)")
                        errorShowing.toggle()
                        errorMessage = error.myErrorMessage()
                    }
                }
                .alert(isPresented: $errorShowing) {
                    Alert(
                        title: Text("Important message"),
                        message: Text(errorMessage),
                        dismissButton: .default(Text("Got it!"))
                    )
                }
        } else {
            ScrollView {
                LazyVStack (spacing: 20){
                    ChartAnalytics(isPodcastOrEpisode: true, currentTab: $currentTab, graphData: $graphData, animateChart: $animateChart, podTitle: podTitle, tags: [
                        0: ("YTD", 12),
                        1: ("1 Yr", 55),
                        2: ("Max", graphData.count)
                    ], calendarInterval: .weekOfYear, intervalDescription: "Weekly")
                        .task{ graphData = vm.analyticsCollectionDict?[podId]?.downloadsData?.byInterval ?? [] }
                    HStack (alignment: .center){
                        Text("Episodes")
                            .padding()
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Spacer()
                        Button {
                            presentShowDescription.toggle()
                        } label: {
                            ZStack (alignment: .center){
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color.theme.accent)
    //                                .shadow(color: .primary, radius: 2)
                                    .padding()
                                Text("Show Description")
                                    .foregroundColor(Color.theme.background)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                            }
                        }
                        .sheet(isPresented: $presentShowDescription) {
                            ShowDescription(podId: podId)
                        }
                    }.task {
                        do {
                            try await vm.loadPodcastDescription(podId: podId)
                        } catch {
                            errorShowing.toggle()
                            errorMessage = error.myErrorMessage()
                        }
                    }
                    EpisodesPage()
                }
            }
        }
    }
}

//struct SinglePodcastAnalytics_Previews: PreviewProvider {
//    static var previews: some View {
//        SinglePodcastAnalytics()
//    }
//}
