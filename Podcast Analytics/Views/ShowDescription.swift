//
//  ShowDescription.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/27/23.
//

import SwiftUI

struct ShowDescription: View {
    @Environment(\.dismiss) var dismiss
    
    let podId: String
    @EnvironmentObject private var vm: GeneralPodcastViewModel
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Text("Dismiss")
                    }
                    
                }.padding()
                Spacer()
                Text("Description:")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.accent)
                    .padding()
                Text(vm.analyticsCollectionDict?[podId]?.descriptionString ?? "")
                    .font(.subheadline)
//                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.accent)
                    .padding()
                Text("Status: \(vm.analyticsCollectionDict?[podId]?.status ?? "")")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.accent)
                    .padding()
                Spacer()
            }
        }
    }
}

//struct ShowDescription_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowDescription()
//    }
//}
