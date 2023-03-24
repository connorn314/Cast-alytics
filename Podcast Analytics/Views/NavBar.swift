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
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(Color.theme.background)
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: 40)
                .shadow(color: .primary.opacity(0.5), radius: 4)
            HStack (alignment: .top, spacing: 0) {
                Button {
                    selectedPage = .overall
                } label: {
                    NavBarButton(buttonText: "Home", isActive: (selectedPage == .overall), buttonImage: "house")
                }
                Button {
                    selectedPage = .episodes
                } label: {
                    NavBarButton(buttonText: "Analytics", isActive: (selectedPage == .episodes), buttonImage: "chart.bar")
                }
                Button {
                    selectedPage = .profile
                } label: {
                    NavBarButton(buttonText: "Profile", isActive: (selectedPage == .profile), buttonImage: "person")
                }
            }.frame(maxWidth: .infinity, maxHeight: 40)
        }.frame(maxWidth: .infinity, maxHeight: 40)
    }
}

//struct NavBar_Previews: PreviewProvider {
//    static var previews: some View {
//        NavBar()
//    }
//}
