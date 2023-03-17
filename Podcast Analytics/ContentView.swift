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
    case profile = 3
}

struct ContentView: View {
    @State var apiKey: String = Bundle.main.infoDictionary?["API_KEY"] as! String
    @State var selectedPage: Pages = .welcome
//    @State var welcomeShowing: Bool = true
    
    var body: some View {
//        WelcomePage(welcomeShowing: welcomeShowing)
        switch selectedPage {
        case .welcome:
            WelcomePage(selectedPage: $selectedPage, apiKey: apiKey)
        default:
            ZStack {
               switch selectedPage {
               case .episodes:
                   EpisodesPage(apiKey: apiKey)
               case .profile:
                   ProfilePage()
               default:
                   TotalsPage(apiKey: apiKey)
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
