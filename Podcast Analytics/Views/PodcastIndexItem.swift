//
//  PodcastIndexItem.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/22/23.
//

import SwiftUI

struct PodcastIndexItem: View {
    
    @State var imageUrl: String?
    @State var title: String
    @State var description: String = "No description given."
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.theme.secondBackground)
                HStack (alignment: .center) {
                    AsyncImage(url: URL(string: imageUrl ?? "")) { Image in
                        Image.resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .fixedSize(horizontal: false, vertical: true)
                            
                    } placeholder: {
                        ZStack (alignment: .center) {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color.theme.background)
                                .frame(width: 100, height: 100)
                                .opacity(0.8)
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .foregroundColor(Color.theme.secondBackground)
                        }
                        
                    }
                    
                    Spacer()
                    Text(String(title))
                        .font(.title)
                        .frame(alignment: .leading)
                    Spacer()
                }
                .padding()
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .frame(height: 120)
    }
}

//struct PodcastIndexItem_Previews: PreviewProvider {
//    static var previews: some View {
//        PodcastIndexItem()
//    }
//}
