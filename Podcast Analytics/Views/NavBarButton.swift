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
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .foregroundColor(isActive ? .black : .white)
                Text(buttonText)
                    .font(.title2)
                    .foregroundColor(isActive ? .white : .black)
            }
        }
    }
}

//struct NavBarButton_Previews: PreviewProvider {
//    static var previews: some View {
//        NavBarButton()
//    }
//}
