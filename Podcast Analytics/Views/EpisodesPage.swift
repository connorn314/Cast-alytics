//
//  EpisodesPage.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/8/23.
//

import SwiftUI

struct EpisodesPage: View {
    
    @State private var errorShowing: Bool = false
    @State private var errorMessage: String = ""
    
    @EnvironmentObject private var vm: EpisodeDataViewModel
    
    var body: some View {
        if vm.episodesData == nil {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.theme.accent))
                .task {
                    do {
                        if vm.episodesData == nil { try await vm.loadEpisodeData() }
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
            LazyVStack(spacing: 40){
                ForEach(vm.episodesData?.collection ?? []) { episode in
                    NavigationLink {
                        SingleEpisodeAnalytics(number: episode.number, href: episode.href)
                    } label: {
                        EpisodeListIndexItem(title: episode.title,
                                             episodeNumber: episode.number,
                                             formattedDate: episode.formattedPublishDate,
                                             downloads: episode.downloads.total)
                    }
                }
                if vm.episodesData != nil {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.theme.accent))
                        .onAppear {
                            Task {
                                do {
                                    try await vm.getMoreEpisodes()
                                } catch {
                                    errorShowing.toggle()
                                    errorMessage = error.myErrorMessage()
                                }
                            }
                        }
                }
            
            }.padding()
        }
    }
}

//struct EpisodesPage_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodesPage()
//    }
//}
