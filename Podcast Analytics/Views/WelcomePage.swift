//
//  WelcomePage.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/2/23.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        ZStack {
            Color(.systemYellow)
            VStack {
                Text("Hello, Connor and Kirk!")
                    .foregroundColor(.white)
                    .dynamicTypeSize(.xLarge)
                Text("Welcome to your Corner")
                    .foregroundColor(.white)
                    .dynamicTypeSize(.xLarge)
                
                Button {
                    print("button pressed")
                } label: {
                    Text("See Analytics ->")
                        .foregroundColor(.white)
                        .dynamicTypeSize(.xxxLarge)
                        .font(.headline)
                        .padding(.all, 20.0)
                        .border(.white)
                        .buttonBorderShape(.roundedRectangle)
                }
                

            }
            .padding()
        }
        
    }
}

//struct WelcomePage_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomePage()
//    }
//}
