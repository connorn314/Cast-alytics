//
//  BasicFetch.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/17/23.
//

import Foundation

enum FetchError: Error {
    case failedContact
    case statusCode
    case decodeFailed
    case invalidUrl
    
    var description: String {
        switch self {
        case .failedContact:
            return "Problem with API request, unable to retrieve data"
        case .statusCode:
            return "Status code for response was not 200"
        case .decodeFailed:
            return "Failed to decode JSON response"
        case .invalidUrl:
            return "Url cannot be found or is invalid"
        }
        
    }
}

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
