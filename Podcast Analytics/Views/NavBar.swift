//
//  NavBar.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/2/23.
//

import SwiftUI

struct NavBar: View {
    var body: some View {
//        ZStack {
            
            
        HStack {
            Text("Left")
            Text("Middle")
            Text("Right")
        }
        
        NavigationStack {
            List {
                    NavigationLink("Mint", value: Color.mint)
                    NavigationLink("Pink", value: Color.pink)
                    NavigationLink("Teal", value: Color.teal)
                }
//                .navigationDestination(for: Color.self) { color in
//                    ColorDetail(color: color)
//                }
                .navigationTitle("Colors")
        }
//        }
    }
}

//struct NavBar_Previews: PreviewProvider {
//    static var previews: some View {
//        NavBar()
//    }
//}
