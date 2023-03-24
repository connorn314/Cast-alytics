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
//    @Binding var animateChart: Bool
    
    var body: some View {
        
        Chart(inputArrayDownloads) { week in
            LineMark(x: .value("Week", week.interval, unit: xUnit),
                     y: .value("Downloads", week.downloadsTotal))
            .foregroundStyle(.primary)
            AreaMark(x: .value("Week", week.interval, unit: xUnit),
                     y: .value("Downloads", week.downloadsTotal))
            .foregroundStyle(.secondary)
        }.frame(height: 250)
            .chartXAxisLabel("Weeks")
            .chartYAxisLabel("Downloads")
    }
}

struct AggregateLineGraphDisplay: View {
    @State var inputArrayDownloads: ArraySlice<DownloadInterval>
    @State var xUnit: Calendar.Component
    @State var correctArray: [DownloadInterval] = []
    
    var body: some View {
        
        Chart(correctArray) { week in
            LineMark(x: .value("Week", week.interval, unit: xUnit),
                     y: .value("Downloads", week.downloadsTotal))
            .foregroundStyle(.primary)
            AreaMark(x: .value("Week", week.interval, unit: xUnit),
                     y: .value("Downloads", week.downloadsTotal))
            .foregroundStyle(.secondary)
            
        }.frame(height: 250)
            .chartXAxisLabel("Weeks")
            .chartYAxisLabel("Downloads")
            .onAppear{
                self.formatForAggregation(inputArray: inputArrayDownloads)
            }
    }
    
    func formatForAggregation(inputArray: ArraySlice<DownloadInterval>){
        var count = 0
        inputArray.forEach { week in
            count += week.downloadsTotal
            correctArray.append(DownloadInterval(interval: week.interval, downloadsTotal: count, downloadsPercent: week.downloadsPercent))
        }
//        print("made it here")
    }
}

//struct LineGraphDisplay_Previews: PreviewProvider {
//    static var previews: some View {
//        LineGraphDisplay()
//    }
//}
