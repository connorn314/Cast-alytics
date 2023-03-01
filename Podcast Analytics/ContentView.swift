//
//  ContentView.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.2, green: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, blue: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
            VStack {
                Text("Hello, Connor and Kirk!")
                    .foregroundColor(.white)
                    .dynamicTypeSize(.xLarge)
                Text("Welcome to your Corner")
                    .foregroundColor(.white)
                    .dynamicTypeSize(.xLarge)
            }
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct Previews_ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
//}
