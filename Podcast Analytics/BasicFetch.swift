//
//  BasicFetch.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/17/23.
//

import Foundation

func fetchEpisodesData(url: URL, apiKey: String) async throws -> EpisodesData {
    var urlRequest = URLRequest(url: url)
    urlRequest.setValue( "Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
    
    guard let (data, response) = try? await URLSession.shared.data(for: urlRequest) else {
        throw FetchError.failedContact
    }
    guard (response as? HTTPURLResponse)?.statusCode == 200 else {
        throw FetchError.statusCode
    }
    let decoder = JSONDecoder()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS-HH:mm"
    decoder.dateDecodingStrategy = .formatted(formatter)
    
    guard let decodedResponse = try? decoder.decode(EpisodesData.self, from: data) else {
        throw FetchError.decodeFailed
    }
    
//        total = decodedResponse.count
//        fullObject = decodedResponse
    return decodedResponse
}
