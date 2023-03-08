//
//  NavBar.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/2/23.
//

import SwiftUI

enum Pages: Int {
    case overall = 0
    case episodes = 1
    case profile = 2
}
struct NavBar: View {
    @Binding var selectedPage: Pages
    var body: some View {
        HStack (alignment: .bottom) {
            Button {
                print("overall")
                selectedPage = .overall
            } label: {
                GeometryReader { geo in
                    
                    ZStack {
                        if selectedPage == .overall {
                            Rectangle()
                                .frame(width: geo.size.width, height: geo.size.height/6)
                                .foregroundColor(.blue)
                            Text("left")
                                .foregroundColor(.white)
                        } else {
                            Rectangle()
                                .frame(width: geo.size.width, height: geo.size.height/6)
                                .foregroundColor(.white)
                            Text("left")
                                .foregroundColor(.blue)
                        }
                        
                    }
                }
            }
            Button {
                print("episodes")
                selectedPage = .episodes
            } label: {
                GeometryReader { geo in
                    
                    ZStack {
                        if selectedPage == .episodes {
                            Rectangle()
                                .frame(width: geo.size.width, height: geo.size.height/6)
                                .foregroundColor(.blue)
                            Text("episodes")
                                .foregroundColor(.white)
                        } else {
                            Rectangle()
                                .frame(width: geo.size.width, height: geo.size.height/6)
                                .foregroundColor(.white)
                            Text("episodes")
                                .foregroundColor(.blue)
                        }                    }
                }
            }
            Button {
                print("profile")
                selectedPage = .profile
            } label: {
                GeometryReader { geo in
                    
                    ZStack {
                        if selectedPage == .profile {
                            Rectangle()
                                .frame(width: geo.size.width, height: geo.size.height/6)
                                .foregroundColor(.blue)
                            Text("profile")
                                .foregroundColor(.white)
                        } else {
                            Rectangle()
                                .frame(width: geo.size.width, height: geo.size.height/6)
                                .foregroundColor(.white)
                            Text("profile")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
        }
    }
}

//struct NavBar_Previews: PreviewProvider {
//    static var previews: some View {
//        NavBar()
//    }
//}
