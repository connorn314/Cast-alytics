//
//  WelcomePage.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/2/23.
//

import SwiftUI

struct WelcomePage: View {
    @State var welcomeShowing: Bool
    @State var selectedPage: Pages = .overall
    @State var apiKey: String = Bundle.main.infoDictionary?["API_KEY"] as! String
    
    var body: some View {
        NavigationView {
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
                    NavigationLink {
                       VStack {
                           switch selectedPage {
                           case .episodes:
                               EpisodesPage(apiKey: apiKey, total: 0)
                           case .profile:
                               ProfilePage()
                           default:
                               TotalsPage(apiKey: apiKey)
                           }
                           Spacer()
                           NavBar(selectedPage: $selectedPage)
                               .frame(maxHeight: .infinity, alignment: .bottom)
                       }
                       .padding(.horizontal)
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
//        if welcomeShowing {
            
//        }
        
    }
}

//struct WelcomePage_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomePage()
//    }
//}
