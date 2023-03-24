//
//  LineGraphDisplay.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/23/23.
//

import SwiftUI
import Charts

struct LineGraphDisplay: View {
    var inputArrayDownloads: ArraySlice<DownloadInterval>
    @State var xUnit: Calendar.Component
    @Binding var animateChart: Bool
    
    var body: some View {
        Chart(inputArrayDownloads) { week in
            LineMark(x: .value("Week", week.interval, unit: xUnit),
                     y: .value("Downloads", (animateChart ? week.downloadsTotal : 0)))
            .foregroundStyle(.primary)
            AreaMark(x: .value("Week", week.interval, unit: xUnit),
                     y: .value("Downloads", (animateChart ? week.downloadsTotal : 0)))
            .foregroundStyle(.secondary)
        }.onAppear{
            withAnimation {
                animateChart.toggle()
            }
        }.frame(height: 250)
            .chartXAxisLabel("Weeks")
            .chartYAxisLabel("Downloads")
    }
}

//struct LineGraphDisplay_Previews: PreviewProvider {
//    static var previews: some View {
//        LineGraphDisplay()
//    }
//}
