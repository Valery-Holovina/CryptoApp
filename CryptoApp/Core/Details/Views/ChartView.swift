//
//  ChartView.swift
//  CryptoApp
//
//  Created by Valery on 03.11.2025.
//

import SwiftUI

struct ChartView: View {
    
    let data : [Double]
    let maxY: Double
    let MinY: Double
    let lineColor: Color
    
    init(coin: CoinModel) {
        data = coin.sparklineIn7D?.price ?? []
        maxY = data.max() ?? 0
        MinY = data.min() ?? 0
        
        let priceChange = (data.last ?? 0) - (data.first ?? 0)
        lineColor = priceChange > 0 ? Color.theme.green : Color.theme.red
    }
    
    var body: some View {
        chartView
            .frame(height: 200)
            .background(chartBackground)
            .overlay (
                chartYAxis
                ,alignment: .leading
            )
        
    }
}

#Preview {
    ChartView(coin: DeveloperPreview.instance.coin)
        
}




extension ChartView{
    private var chartView: some View{
        GeometryReader { geometry in
            Path{ path in
                for index in data.indices{
                    let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
                    
                    let yAxis = maxY - MinY
                    
                    let yPosition = (1 - CGFloat((data[index] - MinY) / yAxis)) * geometry.size.height
                    
                    if index == 0{
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    }
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                }
                
            }
            .stroke(lineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
        }

    }
    
    private var chartBackground: some View{
        VStack{
            Divider()
            Spacer()
            Divider()
            Spacer()
            Divider()
        }
    }
    
    private var chartYAxis: some View{
        VStack{
            Text(maxY.formattedWithAbbreviations())
            Spacer()
            let price = ((maxY + MinY) / 2).formattedWithAbbreviations()
            Text(price)
            Spacer()
            Text(MinY.formattedWithAbbreviations())
         
        }
    }
}
