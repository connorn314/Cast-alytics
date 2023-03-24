//
//  NavBarButton.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/8/23.
//

import SwiftUI

struct NavBarButton: View {
    
    var buttonText: String
    var isActive: Bool
    var buttonImage: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                isActive ? Color.theme.accent : Color.theme.background
                VStack {
                    Image(systemName: buttonImage)
                    Text(buttonText)
                        .font(.caption)
                        .fontWeight(.semibold)
                    Spacer()
                }.padding()
                .foregroundColor(isActive ? Color.theme.background : Color.theme.accent)
            }
        }.ignoresSafeArea()
    }
}

//struct NavBarButton_Previews: PreviewProvider {
//    static var previews: some View {
//        NavBarButton()
//    }
//}
