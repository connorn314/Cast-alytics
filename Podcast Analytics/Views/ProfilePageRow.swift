//
//  ProfilePageRow.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/27/23.
//

import SwiftUI

struct ProfilePageRow: View {
    @State var label: String
    @State var textString: String
    @State var rowHeight: CGFloat
    
    var body: some View {
        GeometryReader { geo in
            VStack (alignment: .leading) {
                Text(label)
                    .font(.caption)
                ZStack (alignment: .leading) {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color.theme.secondBackground)
                        .frame(width: geo.size.width, height: rowHeight)
                    Text(textString)
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
            }
            .frame(height: geo.size.height)
        }
    }
}

//struct ProfilePageRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfilePageRow()
//    }
//}
