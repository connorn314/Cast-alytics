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
                print("Overall")
                selectedPage = .overall
            } label: {
                NavBarButton(buttonText: "Overall", isActive: (selectedPage == .overall))
            }
            Button {
                print("episodes")
                selectedPage = .episodes
            } label: {
                NavBarButton(buttonText: "Episodes", isActive: (selectedPage == .episodes))
                    .overlay(Divider(), alignment: .leading)
                    .overlay(Divider(), alignment: .trailing)
            }
            Button {
                print("profile")
                selectedPage = .profile
            } label: {
                NavBarButton(buttonText: "Profile", isActive: (selectedPage == .profile))
            }
        }.frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.size.height/12)
        
    }
}

//struct NavBar_Previews: PreviewProvider {
//    static var previews: some View {
//        NavBar()
//    }
//}
