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
                Rectangle()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .foregroundColor(isActive ? Color.theme.accent : Color.theme.background)
                VStack {
                    Image(systemName: buttonImage)
                    Text(buttonText)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
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
