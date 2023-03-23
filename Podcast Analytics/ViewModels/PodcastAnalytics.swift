//
//  PodcastAnalytics.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/22/23.
//

import Foundation

//class PodcastAnalytics: ObservableObject {
//    @Published var podcastListens: PodcastListens? = nil
//    
//    private var apiUrlString: String = "https://api.simplecast.com/analytics/listeners"
//    private var apiKey: String = Bundle.main.infoDictionary?["API_KEY"] as! String
//    private var podcastId: String? = nil
//    
//    
//    func fetchPodcastListeners(interval: String, podId: String) async throws -> PodcastListens {
//        var urlRequest = URLRequest(url: URL(string: "\(apiUrlString)?podcast=\(podId)+interval=\(interval)")!)
//        urlRequest.setValue( "Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
//        
//        guard let (data, response) = try? await URLSession.shared.data(for: urlRequest) else {
//            throw FetchError.failedContact
//        }
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//            throw FetchError.statusCode
//        }
//        let decoder = JSONDecoder()
//        guard let decodedResponse = try? decoder.decode(PodcastListens.self, from: data) else {
//            throw FetchError.decodeFailed
//        }
//        return decodedResponse
//    }
//    
//}
