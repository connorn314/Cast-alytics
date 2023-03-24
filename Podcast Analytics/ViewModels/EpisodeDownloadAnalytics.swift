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
    @Published var episodesAnalyticsDict: [String: EpisodeAnalytics]? = nil
    
    private var apiUrl: URL = URL(string: "https://api.simplecast.com/analytics/episodes?podcast=cdeac5f4-4d81-4626-9b04-03170af3ecf8")!
    
    private var apiKey: String = Bundle.main.infoDictionary?["API_KEY"] as! String
    
    func loadEpisodeData() async throws {
        do {
            self.episodesData = try await fetchEpisodesData(url: apiUrl, apiKey: apiKey)
            self.episodesAnalyticsDict = self.episodesData?.createAnalyticsDict()
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
    
    func fetchEpisodeDownloads(interval: String, episodeId: String) async throws -> DownloadsByInterval {
        var urlRequest = URLRequest(url: URL(string: "https://api.simplecast.com/analytics/downloads?episode=\(episodeId)&interval=\(interval)&limit=30")!)
        urlRequest.setValue( "Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        guard let (data, response) = try? await URLSession.shared.data(for: urlRequest) else {
            throw FetchError.failedContact
        }
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw FetchError.statusCode
        }
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let decodedResponse = try? decoder.decode(DownloadsByInterval.self, from: data) else {
            throw FetchError.decodeFailed
        }
        
        return decodedResponse
    }
}
