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
            
            
        HStack (alignment: .bottom) {
            Button {
                print("left")
            } label: {
                GeometryReader { geo in
                    
                    ZStack {
                        Rectangle()
                            .frame(width: geo.size.width, height: geo.size.height/6)
                            .foregroundColor(.blue)
                        Text("left")
                            .foregroundColor(.white)
                    }
                }
            }
            Button {
                print("middle")
            } label: {
                GeometryReader { geo in
                    
                    ZStack {
                        Rectangle()
                            .frame(width: geo.size.width, height: geo.size.height/6)
                            .foregroundColor(.blue)
                        Text("middle")
                            .foregroundColor(.white)
                    }
                }
            }
            Button {
                print("right")
            } label: {
                GeometryReader { geo in
                    
                    ZStack {
                        Rectangle()
                            .frame(width: geo.size.width, height: geo.size.height/6)
                            .foregroundColor(.blue)
                        Text("right")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

//struct NavBar_Previews: PreviewProvider {
//    static var previews: some View {
//        NavBar()
//    }
//}
