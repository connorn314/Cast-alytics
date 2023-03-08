//
//  ContentView.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedPage: Pages = .overall
    var body: some View {
        
        VStack {
            //        WelcomePage()
            TotalsPage()
//            Spacer()
            NavBar(selectedPage: $selectedPage)
            
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
