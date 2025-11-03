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
    
    init(coin: CoinModel) {
        data = coin.sparklineIn7D?.price ?? []
        maxY = data.max() ?? 0
        MinY = data.min() ?? 0
    }
    
    var body: some View {
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
            .stroke(Color.red)
        }
    }
}

#Preview {
    ChartView(coin: DeveloperPreview.instance.coin)
        
}
