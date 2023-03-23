//
//  SinglePodcastAnalytics.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/22/23.
//

import SwiftUI

struct SinglePodcastAnalytics: View {
    
    @State var podId: String
    var apiKey: String = Bundle.main.infoDictionary?["API_KEY"] as! String
    @State var interval: String = "month"
    @State var errorShowing: Bool = false
    @State var errorMessage: String = ""
    @State var listensData: Listen? = nil
    @State var count = 0
    
    var body: some View {
        if listensData == nil {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.theme.accent))
                .task {
                    do {
                        if listensData == nil {
                            try await fetchPodcastListeners()
                        }
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
            VStack {
                Spacer()
                Text("Total listeners: \(listensData?.total ?? 0)")
                Spacer()
            }
        }
    }
    
    func fetchPodcastListeners() async throws {
        var urlRequest = URLRequest(url: URL(string: "https://api.simplecast.com/analytics/podcasts/listeners?podcast=\(podId)")!)
        urlRequest.setValue( "Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        guard let (data, response) = try? await URLSession.shared.data(for: urlRequest) else {
            throw FetchError.failedContact
        }
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw FetchError.statusCode
        }
        let decoder = JSONDecoder()
        guard let decodedResponse = try? decoder.decode(Listen.self, from: data) else {
            throw FetchError.decodeFailed
        }
        listensData = decodedResponse
    }
}

//struct SinglePodcastAnalytics_Previews: PreviewProvider {
//    static var previews: some View {
//        SinglePodcastAnalytics()
//    }
//}
