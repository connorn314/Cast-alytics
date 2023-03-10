//
//  TotalsPage.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/2/23.
//

import SwiftUI

struct TotalsPage: View {
    
    var apiKey: String
    var apiUrl: URL = URL(string: "https://api.simplecast.com/analytics/episodes?podcast=cdeac5f4-4d81-4626-9b04-03170af3ecf8")!
    
//    let urlRequest = URLRequest(url: apiUrl)
    
//    @State var total: Int
//    @State var fullObject: EpisodesData? = nil
    
//    func fetchEpisodesData() async {
//        var urlRequest = URLRequest(url: apiUrl)
//
//        urlRequest.setValue( "Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
//        let (data, response) = try! await URLSession.shared.data(for: urlRequest)
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
//        let decodedResponse = try? JSONDecoder().decode(EpisodesData.self, from: data)
//        total = decodedResponse?.count ?? 0
//        fullObject = decodedResponse!
//    }

    
    var body: some View {
        Text("Hello, World! I'm the Totals Page")
    }
}

//struct TotalsPage_Previews: PreviewProvider {
//    static var previews: some View {
//        TotalsPage()
//    }
//}
