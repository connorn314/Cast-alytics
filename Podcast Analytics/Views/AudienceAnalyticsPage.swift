//
//  AudienceAnalyticsPage.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/27/23.
//

import SwiftUI

struct AudienceAnalyticsPage: View {
    
    @State private var errorShowing: Bool = false
    @State private var errorMessage: String = ""
    
    @State private var podId = "cdeac5f4-4d81-4626-9b04-03170af3ecf8"
    let colors: [Color] = [
        Color.theme.fun,
        .primary,
        Color.theme.accent,
        Color.theme.secondBackground,
        Color.theme.fun.opacity(0.5),
        .primary.opacity(0.5),
        Color.theme.accent.opacity(0.5),
        Color.theme.secondBackground.opacity(0.5)
    ]
    
    @EnvironmentObject private var vm: GeneralPodcastViewModel
    @State var count = 0
 
    var body: some View {
        NavigationView {
            if vm.analyticsCollectionDict?[podId]?.distributionMethodAnalytics == nil {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.theme.accent))
                    .task {
                        do {
                            try await vm.loadPodcastDistMethodDownloads(podId: podId)
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
                    VStack {
                        let distributionData = vm.analyticsCollectionDict?[podId]?.distributionMethodAnalytics
                        let slices: [Int: (String, Double, Color)] = formatDistributionSlices(inputArray: distributionData ?? [])
                        DonutChart(slices: slices)
                            .navigationTitle("Listening Methods")
                        Spacer(minLength: 40)
                        ZStack (alignment: .center){
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color.theme.secondBackground.opacity(0.1))
                            VStack {
                                ForEach(Array(slices.sorted(by: {$0.key < $1.key})), id: \.key) { index, value in
                                    VStack {
                                        RoundedRectangle(cornerRadius: 3)
                                            .foregroundColor(Color.primary)
                                        HStack {
                                            Text("\(index + 1). \(value.0)")
                                            Rectangle()
                                                .foregroundColor((value.2))
                                            Text("\(Int(value.1))")
                                        }.foregroundColor(Color.primary)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                    }
                                }
                                RoundedRectangle(cornerRadius: 3)
                                    .foregroundColor(Color.primary)
                            }.padding()
                        }
                    }
                }.padding()
            }
        }
    }
    func formatDistributionSlices(inputArray: [DistributionMethod]) -> [Int: (String, Double, Color)] {
        var colorCount = 0
        var count = 0
        var newArray: [Int: (String, Double, Color)] = [:]
        
        
        inputArray.forEach { methodType in
            newArray[count] = (methodType.name, Double(methodType.downloadsTotal), colors[colorCount])
            count += 1
            colorCount = (count + 1) % 8
        }
        return newArray
    }
}

extension Color {
    var name: String {
        switch self {
        case Color.theme.fun:
            return "fun"
        case .primary:
            return "primary"
        case Color.theme.accent: return "accent"
        case Color.theme.secondBackground: return "second Bground"
        case Color.theme.fun.opacity(0.5): return "fun hp"
        case .primary.opacity(0.5): return "primary ho"
        case Color.theme.accent.opacity(0.5): return "accent ho"
        case Color.theme.secondBackground.opacity(0.5): return "sec B ho"
        default:
            return "not on list"
        }
    }
}

//struct AudienceAnalyticsPage_Previews: PreviewProvider {
//    static var previews: some View {
//        AudienceAnalyticsPage()
//    }
//}
