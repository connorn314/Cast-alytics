//
//  ChartAnalytics.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/24/23.
//

import SwiftUI

struct ChartAnalytics: View {
    
    // true means podcast and false means episode
    @State var isPodcastOrEpisode: Bool
    
    @Binding var currentTab: Int
    @Binding var graphData: [DownloadInterval]
    @Binding var animateChart: Bool
    @State var podTitle: String
    
    @State var tags: [Int: (String, Int)]
    @State var calendarInterval: Calendar.Component
    @State var intervalDescription: String
    
    var body: some View {
        VStack (spacing: 20) {
            HStack {
                Text("\(intervalDescription) Downloads")
                    .fontWeight(.semibold)
                Spacer()
                Picker("", selection: $currentTab){
                    Text(tags[0]!.0)
                        .tag(tags[0]!.1) // make this dynamic!!!!
                    Text(tags[1]!.0)
                        .tag(tags[1]!.1)
                    Text(tags[2]!.0)
                        .tag(graphData.count - 1)
                }.pickerStyle(.segmented)
                    .frame(maxWidth: 180)
            }
            let totalDownloads = (isPodcastOrEpisode ?
                (graphData[((graphData.count - currentTab) > 0 ? (graphData.count - currentTab) : 0)...]) :
            ((graphData.count > currentTab) ? graphData[...currentTab] : [])
            ).reduce(0) { partialResult, DownloadInterval in
                return partialResult + DownloadInterval.downloadsTotal
            }
            let intervalAvg: Double = round((Double(totalDownloads) / Double(currentTab)) * 10) / 10.0
            HStack {
                Text("\(intervalDescription) Avg: \(String(intervalAvg))")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                Text("Total Downloads: \(totalDownloads)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }

            LineGraphDisplay(inputArrayDownloads: isPodcastOrEpisode ?
                             (graphData[((graphData.count - currentTab) > 0 ? (graphData.count - currentTab) : 0)...]) :
                                ((graphData.count > currentTab) ? graphData[...currentTab] : []),
                             xUnit: calendarInterval, regularLineGraph: isPodcastOrEpisode)
            
//            AggregateLineGraphDisplay(inputArrayDownloads: ((graphData.count > currentTab) ? graphData[...currentTab] : []), xUnit: calendarInterval)
        }.navigationTitle(podTitle)
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.theme.background)
                    .shadow(color: .primary.opacity(0.5), radius: 4)
            }.padding()
    }
}

//struct ChartAnalytics_Previews: PreviewProvider {
//    static var previews: some View {
//        ChartAnalytics()
//    }
//}
