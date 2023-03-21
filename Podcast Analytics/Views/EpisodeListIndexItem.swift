//
//  EpisodeListIndexItem.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/17/23.
//

import SwiftUI

struct EpisodeListIndexItem: View {

    @State var title: String
    @State var episodeNumber: Int
    @State var formattedDate: String
    @State var downloads: Int
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.theme.secondBackground)
                HStack (alignment: .top) {
                    VStack (alignment: .leading) {
                        Text("\(episodeNumber). \(title)")
                            .font(.headline)
                            .foregroundStyle(.primary)
                        Spacer()
                        Text("Date Published: \(formattedDate)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Spacer()
                    }.foregroundColor(Color.theme.accent)
                    
                    Spacer()
                    Text(String(downloads))
                        .font(.headline)
                }
                .padding()
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .frame(height: 100)
    }
}

//struct EpisodeListIndexItem_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeListIndexItem()
//    }
//}
