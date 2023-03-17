//
//  EpisodesPage.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/8/23.
//

import SwiftUI

enum FetchError: Error {
    case failedContact
    case statusCode
    case decodeFailed
    
    var description: String {
        switch self {
        case .failedContact:
            return "Problem with API request, unable to retrieve data"
        case .statusCode:
            return "Status code for response was not 200"
        case .decodeFailed:
            return "Failed to decode JSON response"
        }
        
    }
}

struct EpisodesPage: View {
    
    var apiKey: String
    var apiUrl: URL = URL(string: "https://api.simplecast.com/analytics/episodes?podcast=cdeac5f4-4d81-4626-9b04-03170af3ecf8")!
    
//    @State var total: Int = 0
    @State var fullObject: EpisodesData? = nil
    @State private var errorShowing: Bool = false
    @State private var errorMessage: String = ""
    
    
    func fetchEpisodesData() async throws {
        var urlRequest = URLRequest(url: apiUrl)
        urlRequest.setValue( "Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        guard let (data, response) = try? await URLSession.shared.data(for: urlRequest) else {
            throw FetchError.failedContact
        }
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw FetchError.statusCode
        }
        guard let decodedResponse = try? JSONDecoder().decode(EpisodesData.self, from: data) else {
            throw FetchError.decodeFailed
        }
        
//        total = decodedResponse.count
        fullObject = decodedResponse
    }
    
    var body: some View {
//        Text("I am the Episodes Page!")
        ScrollView {
            LazyVStack {
                ForEach(fullObject?.collection ?? []) { episode in
        //            Text("Episode #\(episode.number ) --> Downloads: \(episode.downloads.total )")
                    EpisodeListIndexItem(title: episode.title, episodeNumber: episode.number, downloads: episode.downloads.total)
                }
            }
        }
        .task {
            do {
                try await fetchEpisodesData()
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

//struct EpisodesPage_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodesPage()
//    }
//}
