//
//  BackButton.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/29/23.
//

import SwiftUI

struct BackButton: View {
    let dismiss: DismissAction
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            ZStack(alignment: .center) {
                Circle()
                    .frame(width: 35, height: 35)
                    .foregroundColor(Color.theme.background)
                    .shadow(color: Color.primary.opacity(0.25), radius: 3)
                Image(systemName: "arrow.backward")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color.theme.accent)
            }
        }
    }
}

//struct BackButton_Previews: PreviewProvider {
//    static var previews: some View {
//        BackButton()
//    }
//}
