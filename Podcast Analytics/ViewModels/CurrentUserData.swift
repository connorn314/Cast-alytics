//
//  CurrentUserData.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/27/23.
//

import Foundation

@MainActor
class CurrentUserViewModel: ObservableObject {
    @Published var userDetails: UserInfo? = nil
    
    private var apiKey: String = Bundle.main.infoDictionary?["API_KEY"] as! String
    
    func loadUserData() async throws {
        do {
            self.userDetails = try await fetchCurrentUserData(apiUrl: URL(string: "https://api.simplecast.com/current_user")!)
        } catch {
            throw error
        }
    }
    
    func fetchCurrentUserData(apiUrl: URL) async throws -> UserInfo {
        var urlRequest = URLRequest(url: apiUrl)
        urlRequest.setValue( "Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        guard let (data, response) = try? await URLSession.shared.data(for: urlRequest) else {
            throw FetchError.failedContact
        }
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw FetchError.statusCode
        }
        let decoder = JSONDecoder()
        guard let decodedResponse = try? decoder.decode(UserInfo.self, from: data) else {
            throw FetchError.decodeFailed
        }
        return decodedResponse
    }
}
