//
//  EpisodeDownloadAnalytics.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/21/23.
//

import Foundation

@MainActor
class EpisodeDataViewModel: ObservableObject {
    @Published var episodesData: DownloadsData? = nil
    
    private var apiUrl: URL = URL(string: "https://api.simplecast.com/analytics/episodes?podcast=cdeac5f4-4d81-4626-9b04-03170af3ecf8")!
    
    private var apiKey: String = Bundle.main.infoDictionary?["API_KEY"] as! String
    
    func loadEpisodeData() async throws {
        do {
            self.episodesData = try await fetchEpisodesData(url: apiUrl, apiKey: apiKey)
        } catch {
            throw error
        }
    }
    
    func getMoreEpisodes() async throws {
        do {
            let responseObject = try await fetchEpisodesData(url: URL(string: episodesData?.pages.next.href ?? "")!, apiKey: apiKey)
            episodesData?.collection.append(contentsOf: responseObject.collection)
            episodesData?.pages.next.href = responseObject.pages.next.href
        } catch {
            throw error
        }
        
    }
}
