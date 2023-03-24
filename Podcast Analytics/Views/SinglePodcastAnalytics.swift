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
    
    
    
    var body: some View {
        if vm.analyticsCollectionDict?[podId]?.downloadsData == nil {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.theme.accent))
                .task {
                    do {
                        try await vm.loadPodcastDownloads(podId: podId, interval: interval)
                    } catch {
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
                    HStack{
                        Text("Episodes")
                            .padding()
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Spacer()
                    }
                    EpisodesPage()
                }
            }
        }
    }
    
//    func fetchPodcastListeners() async throws {
//        var urlRequest = URLRequest(url: URL(string: "https://api.simplecast.com/analytics/podcasts/listeners?podcast=\(podId)")!)
//        urlRequest.setValue( "Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
//        
//        guard let (data, response) = try? await URLSession.shared.data(for: urlRequest) else {
//            throw FetchError.failedContact
//        }
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//            throw FetchError.statusCode
//        }
//        let decoder = JSONDecoder()
//        guard let decodedResponse = try? decoder.decode(Listen.self, from: data) else {
//            throw FetchError.decodeFailed
//        }
//        listensData = decodedResponse
//    }
}

//struct SinglePodcastAnalytics_Previews: PreviewProvider {
//    static var previews: some View {
//        SinglePodcastAnalytics()
//    }
//}
