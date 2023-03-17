//
//  WelcomePage.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/2/23.
//

import SwiftUI

struct WelcomePage: View {
    @Binding var selectedPage: Pages
    @State var apiKey: String
    
    var body: some View {
        ZStack {
            Color.primary.ignoresSafeArea()
            Color(red: 235, green: 238, blue: 252)
            VStack {
                Spacer()
                Spacer()
                Text("Simplecast")
                    .foregroundColor(.primary)
                    .dynamicTypeSize(.xxxLarge)
                    .font(.largeTitle)
                Button {
                    selectedPage = .overall
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundColor(.primary)
                            .frame(maxWidth: 200, maxHeight: 80)
                        Text("See Analytics")
                            .foregroundColor(.white)
                            .dynamicTypeSize(.xxLarge)
                            .font(.headline)
                            .padding(.all, 20.0)
                    }
                }
                Spacer()
                Spacer()
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
