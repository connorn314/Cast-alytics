//
//  NavBarButton.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/8/23.
//

import SwiftUI

struct NavBarButton: View {

    var isActive: Bool
    var buttonImage: String
    var focusImage: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.theme.background
                VStack {
                    ZStack (alignment: .center) {
                        if buttonImage == "plus" {
                            Circle()
                                .frame(width: 60, height: 60)
                                .foregroundColor(Color.theme.accent)
                        }
                        Image(systemName: isActive ? focusImage : buttonImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(buttonImage == "plus" ? Color.theme.background : Color.theme.accent)
                    }
//                    Text(buttonText)
//                        .font(.caption)
//                        .fontWeight(.semibold)
                    Spacer()
                }.padding()
                .foregroundColor(Color.theme.accent)
            }
        }.ignoresSafeArea()
    }
}

//struct NavBarButton_Previews: PreviewProvider {
//    static var previews: some View {
//        NavBarButton()
//    }
//}
