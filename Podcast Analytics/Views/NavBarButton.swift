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
                if isActive {
                    RoundedRectangle(cornerRadius: 20.0, style: .circular)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .foregroundColor(.blue)
                    Text(buttonText)
                        .font(.title2)
                        .foregroundColor(.white)
                } else {
                    RoundedRectangle(cornerRadius: 20.0, style: .circular)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .foregroundColor(.white)
                    Text(buttonText)
                        .font(.title2)
                        .foregroundColor(.blue)
                }
                
            }
        }
    }
}

//struct NavBarButton_Previews: PreviewProvider {
//    static var previews: some View {
//        NavBarButton()
//    }
//}
