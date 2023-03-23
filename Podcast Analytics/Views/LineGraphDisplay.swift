//
//  LineGraphDisplay.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/23/23.
//

import SwiftUI
import Charts

struct LineGraphDisplay: View {
    var inputArrayDownloads: [DownloadInterval]? = nil
    
    var body: some View {
        Chart(inputArrayDownloads ?? []) { month in
            LineMark(x: .value("Month", month.interval),
                     y: .value("Downloads", month.downloadsTotal))
        }.frame(maxHeight: 500)
    }
}

//struct LineGraphDisplay_Previews: PreviewProvider {
//    static var previews: some View {
//        LineGraphDisplay()
//    }
//}
