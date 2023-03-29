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
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(Color.theme.secondBackground)
                VStack () {
                    AsyncImage(url: URL(string: imageUrl ?? "")) { Image in
                        Image.resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width)
                            .clipShape(RoundedRectangle(cornerRadius: 2))
//                            .fixedSize(horizontal: false, vertical: true)
                            
                    } placeholder: {
                        ZStack (alignment: .center) {
                            RoundedRectangle(cornerRadius: 2)
                                .foregroundColor(Color.theme.background)
                                .frame(width: geo.size.width)
                                .opacity(0.8)
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .foregroundColor(Color.theme.secondBackground)
                        }
                        
                    }
                    
                    Text(String(title))
                        .font(.headline)
                        .frame(alignment: .leading)
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .frame(height: 210)
    }
}

//struct PodcastIndexItem_Previews: PreviewProvider {
//    static var previews: some View {
//        PodcastIndexItem()
//    }
//}
