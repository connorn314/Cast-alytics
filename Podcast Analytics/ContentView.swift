//
//  ContentView.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedPage: Pages = .overall
    @State var apiKey: String = Bundle.main.infoDictionary?["API_KEY"] as! String
    
    var body: some View {
        
        VStack {
            switch selectedPage {
            case .episodes:
                EpisodesPage(apiKey: apiKey, total: 0)
            case .profile:
                ProfilePage()
            default:
                TotalsPage(apiKey: apiKey)
            }
            Spacer()
            NavBar(selectedPage: $selectedPage)
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .padding(.horizontal)
//        .ignoresSafeArea(.all, edges: .bottom)

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
