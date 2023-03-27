//
//  ProfilePage.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/8/23.
//

import SwiftUI

struct ProfilePage: View {
    
    @EnvironmentObject private var vm: CurrentUserViewModel
    
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    @State private var errorShowing: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        NavigationView {
            if vm.userDetails == nil {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.theme.accent))
                    .task {
                        do {
                            if vm.userDetails == nil { try await vm.loadUserData() }
                        } catch {
                            errorShowing.toggle()
                            errorMessage = error.myErrorMessage()
                        }
                    }
                    .alert(isPresented: $errorShowing) {
                        Alert(
                            title: Text("Important message"),
                            message: Text(errorMessage),
                            dismissButton: .default(Text("Got it!"))
                        )
                    }
            } else {
                VStack {
                    Spacer()
                    ZStack(alignment: .center){
                        Circle()
                            .foregroundColor(Color.theme.secondBackground)
                            .frame(width: 220, height: 220)
                        AsyncImage(url: URL(string: vm.userDetails?.owner?.imageURL ?? "")) { Image in
                            Image.resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                                .fixedSize(horizontal: false, vertical: true)
                            
                        } placeholder: {
                            ZStack (alignment: .center) {
                                Circle()
                                    .foregroundColor(Color.theme.background)
                                    .frame(width: 200, height: 200)
                                    .opacity(0.8)
                                Image(systemName: "person")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(Color.theme.secondBackground)
                            }
                        }
                    }
                    ProfilePageRow(label: "NAME", textString: vm.userDetails?.owner?.name ?? "", rowHeight: minRowHeight)
                        .frame(height: minRowHeight * 1.25)
                        .padding()
                        .navigationTitle("Account")
                    ProfilePageRow(label: "EMAIL", textString: vm.userDetails?.owner?.email ?? "", rowHeight: minRowHeight)
                        .frame(height: minRowHeight * 1.25)
                        .padding()
                    Spacer()
                    
                }
            }
        }
    }
}

//struct ProfilePage_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfilePage()
//    }
//}
