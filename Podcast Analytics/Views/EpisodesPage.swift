//
//  EpisodesPage.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/8/23.
//

import SwiftUI



struct EpisodesPage: View {
    
    var apiKey: String
    var apiUrl: URL = URL(string: "https://api.simplecast.com/analytics/episodes?podcast=cdeac5f4-4d81-4626-9b04-03170af3ecf8")!
    
//    @State var total: Int = 0
    @State var fullObject: EpisodesData? = nil
    @State private var errorShowing: Bool = false
    @State private var errorMessage: String = ""
    @State var next: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(fullObject?.collection ?? []) { episode in
                        NavigationLink {
                            VStack {
                                Spacer()
                                Text("Episode: \(episode.number)")
                                Text("Special Analytics")
                                Spacer()
                            }
                        } label: {
                            EpisodeListIndexItem(title: episode.title,
                                                 episodeNumber: episode.number,
                                                 formattedDate: episode.formattedPublishDate,
                                                 downloads: episode.downloads.total)
                        }
                    }
                    if next != "" {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.theme.accent))
                            .onAppear {
                                Task {
                                    do {
                                        let responseObject = try await fetchEpisodesData(url: URL(string: next)!, apiKey: apiKey)
                                        fullObject?.collection.append(contentsOf: responseObject.collection)
                                        next = responseObject.pages.next.href
                                    } catch let myError as FetchError {
                                        errorShowing.toggle()
                                        errorMessage = myError.description
                                    } catch {
                                        errorShowing.toggle()
                                        errorMessage = error.localizedDescription
                                    }
                                }
                            }
                    }
                    
                }
                .navigationTitle("Episode Analytics")
//                .foregroundColor(.accentColor)
            }
            .task {
                do {
                    fullObject = try await fetchEpisodesData(url: apiUrl, apiKey: apiKey)
                    next = fullObject?.pages.next.href ?? "no next url found"
                    
                } catch let myError as FetchError {
                    errorShowing.toggle()
                    errorMessage = myError.description
                } catch {
                    errorShowing.toggle()
                    errorMessage = error.localizedDescription
                }
            }
            .alert(isPresented: $errorShowing) {
                Alert(
                    title: Text("Important message"),
                    message: Text(errorMessage),
                    dismissButton: .default(Text("Got it!"))
                )
            }
        }
    }
}

//struct EpisodesPage_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodesPage()
//    }
//}
