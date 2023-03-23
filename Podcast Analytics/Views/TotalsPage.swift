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
            if vm.generalPodcastData == nil {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.theme.accent))
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
            } else {
                ScrollView {
                    LazyVStack (alignment: .leading){
                        Spacer()
                        ForEach(vm.generalPodcastData?.collection ?? []) { pod in
                            NavigationLink {
                                SinglePodcastAnalytics(podId: pod.id)
                            } label: {
                                PodcastIndexItem(imageUrl: pod.imageURL, title: pod.title)
                            }
                        }
                    }
                    .padding()
                    .navigationTitle("Podcasts")
                }
            }
        }
    }
}

//struct TotalsPage_Previews: PreviewProvider {
//    static var previews: some View {
//        TotalsPage()
//    }
//}
