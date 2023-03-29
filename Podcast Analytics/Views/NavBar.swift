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
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundColor(Color.theme.background)
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: 60)
                .shadow(color: .primary.opacity(0.25), radius: 4)
            HStack (alignment: .top, spacing: 0) {
                Button {
                    selectedPage = .overall
                } label: {
                    NavBarButton(isActive: (selectedPage == .overall), buttonImage: "house", focusImage: "house.fill") // house.fill
                }
                Button {
                    selectedPage = .episodes
                } label: {
                    NavBarButton(isActive: (selectedPage == .episodes), buttonImage: "chart.bar", focusImage: "chart.bar.fill") // chart.bar.fill
                }
                Button {
                    selectedPage = .addEpisode
                } label: {
                    NavBarButton(isActive: false, buttonImage: "", focusImage: "") // none
                }
                Button {
                    selectedPage = .episodes
                } label: {
                    NavBarButton(isActive: (selectedPage == .search), buttonImage: "magnifyingglass", focusImage: "magnifyingglass") // none
                }
                Button {
                    selectedPage = .profile
                } label: {
                    NavBarButton(isActive: (selectedPage == .profile), buttonImage: "person", focusImage: "person.fill") // person.fill
                }
            }.frame(maxWidth: .infinity, maxHeight: 60)
            Button {
                selectedPage = .addEpisode
            } label: {
                VStack {
                    ZStack (alignment: .center) {
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color.theme.accent)
                            .shadow(color: Color.primary.opacity(0.6), radius: 4)
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.theme.background)
                    }
                    Spacer()
                }.padding()
            }
        }.frame(maxWidth: .infinity, maxHeight: 60)
    }
}

//struct NavBar_Previews: PreviewProvider {
//    static var previews: some View {
//        NavBar()
//    }
//}
