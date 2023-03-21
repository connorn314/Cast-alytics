//
//  NavBar.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/2/23.
//

import SwiftUI

struct NavBar: View {
    @Binding var selectedPage: Pages
    
    var body: some View {
        HStack (alignment: .bottom, spacing: 0) {
            Button {
                selectedPage = .overall
            } label: {
                NavBarButton(buttonText: "Home", isActive: (selectedPage == .overall), buttonImage: "house")
            }
            Button {
                selectedPage = .episodes
            } label: {
                NavBarButton(buttonText: "Analytics", isActive: (selectedPage == .episodes), buttonImage: "chart.bar")
                    .overlay(Divider(), alignment: .leading)
                    .overlay(Divider(), alignment: .trailing)
            }
            Button {
                selectedPage = .profile
            } label: {
                NavBarButton(buttonText: "Profile", isActive: (selectedPage == .profile), buttonImage: "person")
            }
        }.frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.size.height/12)
        
    }
}

//struct NavBar_Previews: PreviewProvider {
//    static var previews: some View {
//        NavBar()
//    }
//}
