//
//  SingleEpisodeAnalytics.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/21/23.
//

import SwiftUI

struct SingleEpisodeAnalytics: View {
    
    let number: Int
    let href: String
    
    var body: some View {
        ZStack {
//            Color.theme.fun
            VStack {
                Spacer()
                Text("Episode: \(number)")
                Text("Special Analytics")
                Text(href)
                Spacer()
            }
        }
    }
}

//struct SingleEpisodeAnalytics_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleEpisodeAnalytics()
//    }
//}
