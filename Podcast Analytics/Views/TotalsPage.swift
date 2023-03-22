//
//  TotalsPage.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/2/23.
//

import SwiftUI

struct TotalsPage: View {
    
    @State private var errorShowing: Bool = false
    @State private var errorMessage: String = ""
    
    @EnvironmentObject private var vm: GeneralPodcastViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack (alignment: .leading){
                    Spacer()
                    ForEach(vm.generalPodcastData?.collection ?? []) { pod in
                        NavigationLink {
                            VStack {
                                Spacer()
                                Text("This will be the all the episodes for \(pod.title)")
                                Spacer()
                            }
                        } label: {
                            PodcastIndexItem(imageUrl: pod.imageURL, title: pod.title)
                        }
                    }
                    Spacer()
                    Text("You have \(vm.generalPodcastData?.count ?? 0) podcasts")
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                }.navigationTitle("Podcasts")
                    
            }
            .task {
                do {
                    if vm.generalPodcastData == nil { try await vm.loadPodcastData() }
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
        }.padding()
    }
}

//struct TotalsPage_Previews: PreviewProvider {
//    static var previews: some View {
//        TotalsPage()
//    }
//}
