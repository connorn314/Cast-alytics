//
//  GeneralPodcastAndPermissions.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/22/23.
//

import Foundation

@MainActor
class GeneralPodcastViewModel: ObservableObject {
    @Published var generalPodcastData: GeneralPodcastData? = nil
    
    private var apiUrl: URL = URL(string: "https://api.simplecast.com/podcasts")!
    
    private var apiKey: String = Bundle.main.infoDictionary?["API_KEY"] as! String
    
    func loadPodcastData() async throws {
        do {
            self.generalPodcastData = try await fetchAllPodcastData(apiUrl: apiUrl)
        } catch {
            throw error
        }
    }
    
    func getMorePodcastData() async throws  {
        guard let newUrl = generalPodcastData?.pages?.next?.href else { throw FetchError.invalidUrl }
        do {
            let responseObject = try await fetchAllPodcastData(apiUrl: URL(string: newUrl)!)
            generalPodcastData?.collection?.append(contentsOf: responseObject.collection ?? [])
            if let pages = responseObject.pages {
                generalPodcastData?.pages = pages
            }
        } catch {
            throw error
        }
        
    }
    
    func fetchAllPodcastData(apiUrl: URL) async throws -> GeneralPodcastData {
        var urlRequest = URLRequest(url: apiUrl)
        urlRequest.setValue( "Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        guard let (data, response) = try? await URLSession.shared.data(for: urlRequest) else {
            throw FetchError.failedContact
        }
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw FetchError.statusCode
        }
        let decoder = JSONDecoder()
        guard let decodedResponse = try? decoder.decode(GeneralPodcastData.self, from: data) else {
            throw FetchError.decodeFailed
        }
        return decodedResponse
    }
}
