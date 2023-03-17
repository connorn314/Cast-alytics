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

    
    var body: some View {
        GeometryReader { geo in
            ScrollView (.vertical) {
                LazyVStack (spacing: 15) {
                    ForEach(0..<10) { _ in
                        EpisodeListIndexItem(title: "Connor and Kirk and Dehner", episodeNumber: 15, downloads: 85)
                    }
                }
            }
            .frame(height: geo.size.height)
        }
    }
}

//struct TotalsPage_Previews: PreviewProvider {
//    static var previews: some View {
//        TotalsPage()
//    }
//}
