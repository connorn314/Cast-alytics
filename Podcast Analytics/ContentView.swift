//
//  ContentView.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 2/22/23.
//

import SwiftUI

enum Pages: Int {
    case welcome = 0
    case overall = 1
    case episodes = 2
    case addEpisode = 3
    case search = 4
    case profile = 5
}

struct ContentView: View {
    
    @State var apiKey: String = Bundle.main.infoDictionary?["API_KEY"] as! String
    @State var selectedPage: Pages = .welcome
    
    var body: some View {
        ZStack {
            if selectedPage == .welcome {
                WelcomePage(selectedPage: $selectedPage, apiKey: apiKey)
            } else {
               switch selectedPage {
               case .episodes:
                   AudienceAnalyticsPage()
               case .profile:
                   ProfilePage()
               case .addEpisode:
                   AddPodcastPage()
               case .search:
                   SearchPage()
               default:
                   TotalsPage()
               }
               NavBar(selectedPage: $selectedPage)
                   .frame(maxHeight: .infinity, alignment: .bottom)
                
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

//struct Previews_ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
//}
