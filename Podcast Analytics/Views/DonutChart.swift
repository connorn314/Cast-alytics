//
//  DonutChart.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/29/23.
//

import SwiftUI

struct DonutChart: View {
//    var distributionData: [DistributionMethod]
//    @State var colors: [Color]
    
    var slices: [Int: (String, Double, Color)]
    
    
    var body: some View {
        Canvas { context, size in
            // Add these lines to display as Donut
            //Start Donut
            let donut = Path { p in
                p.addEllipse(in: CGRect(origin: .zero, size: size))
                p.addEllipse(in: CGRect(x: size.width * 0.25, y: size.height * 0.25, width: size.width * 0.5, height: size.height * 0.5))
            }
            context.clip(to: donut, style: .init(eoFill: true))
            //End Donut
            let total = slices.values.reduce(0) { $0 + $1.1 }
            context.translateBy(x: size.width * 0.5, y: size.height * 0.5)
            var pieContext = context
            pieContext.rotate(by: .degrees(-90))
            let radius = min(size.width, size.height) * 0.48
                    let gapSize = Angle(degrees: 5) // size of the gap between slices in degrees

            var startAngle = Angle.zero
            for (key, tupValues) in slices.sorted(by: {$0.key < $1.key}) {
                let value = tupValues.1
                let color = tupValues.2
                print ("rank: \(String(key)) \(String(tupValues.0)), dls: \(String(value)), color: \(color.name)")
                let angle = Angle(degrees: (360 * (value / Double(total))))
                let endAngle = startAngle + angle
                let path = Path { p in
                    p.move(to: .zero)
                    p.addArc(center: .zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                    p.closeSubpath()
                }
                pieContext.fill(path, with: .color(color))
                startAngle = endAngle
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

//struct DonutChart_Previews: PreviewProvider {
//    static var previews: some View {
//        DonutChart()
//    }
//}


