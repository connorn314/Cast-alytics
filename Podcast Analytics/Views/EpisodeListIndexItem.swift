//
//  EpisodeListIndexItem.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/17/23.
//

import SwiftUI

struct EpisodeListIndexItem: View {
//    @State private var id: String = "abc"
    @State var title: String
    @State var episodeNumber: Int
    @State var formattedDate: String
    @State var downloads: Int
//    @State private var publishedAt: String = "Tuesday"
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.blue.opacity(0.05)
                HStack (alignment: .top) {
                    VStack (alignment: .leading) {
                        Text("\(episodeNumber). \(title)")
                            .font(.headline)
                        Spacer()
                        Text("Date Published: \(formattedDate)")
                            .font(.subheadline)
                        Spacer()
                    }
                    
                    Spacer()
                    Text(String(downloads))
                        .font(.headline)
                }
                .padding()
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .frame(height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

//struct EpisodeListIndexItem_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeListIndexItem()
//    }
//}
