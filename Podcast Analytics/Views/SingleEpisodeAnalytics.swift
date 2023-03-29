//
//  SingleEpisodeAnalytics.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/21/23.
//

import SwiftUI

struct SingleEpisodeAnalytics: View {
    
    var episodeId: String
    var episodeTitle: String
    let number: Int
    
    @EnvironmentObject private var vm: EpisodeDataViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var interval: String = "day"
    @State var errorShowing: Bool = false
    @State var errorMessage: String = ""
    @State var currentTab = 7
    @State var graphData: [DownloadInterval] = []
    @State var animateChart: Bool = false
    
    
    
    var body: some View {
        ScrollView {
            if vm.episodesAnalyticsDict?[episodeId]?.downloadsByInterval == nil {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.theme.accent))
                    .task {
                        do {
                            vm.episodesAnalyticsDict?[episodeId]?.downloadsByInterval = try await vm.fetchEpisodeDownloads(interval: interval, episodeId: episodeId)
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
                LazyVStack (spacing: 20){
                    ChartAnalytics(isPodcastOrEpisode: false, currentTab: $currentTab, graphData: $graphData, animateChart: $animateChart, podTitle: episodeTitle, tags: [
                        0: ("7 Day", 7),
                        1: ("14 Day", 14),
                        2: ("1 month", 31)
                    ], calendarInterval: .day, intervalDescription: "Daily")
                    .task{ graphData = vm.episodesAnalyticsDict?[episodeId]?.downloadsByInterval?.byInterval ?? [] }
                }
            }
        }.navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    BackButton(dismiss: self.dismiss)
                }
            }
    }
}

//struct SingleEpisodeAnalytics_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleEpisodeAnalytics()
//    }
//}
