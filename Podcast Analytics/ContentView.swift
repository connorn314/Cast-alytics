//
//  ContentView.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var welcomeShowing: Bool = true
    
    var body: some View {
        WelcomePage(welcomeShowing: welcomeShowing)
         
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
