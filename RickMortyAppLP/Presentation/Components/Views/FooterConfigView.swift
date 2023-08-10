//
//  FooterConfig.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 9/8/23.
//

import SwiftUI

struct FooterConfigView: View {

    let cols: Int = 8
    let spacing: CGFloat = 2
    let imgsize = CGSize(width: 60, height: 60)
    var hexagonWidth: CGFloat { (imgsize.width / 2) * cos(.pi / 6) * 2 }
    
    var body: some View {
        
        let gridItems = Array(repeating: GridItem(.fixed(imgsize.width), spacing: spacing), count: cols)
        
        ScrollView(.horizontal){
            LazyVGrid(columns: gridItems, spacing: spacing) {
                ForEach(0..<40){idx in
                    VStack(spacing: 0) {
                        AsyncImage(url: URL(string: "https://rickandmortyapi.com/api/character/avatar/\(idx + 1).jpeg")){ image in
                            image.resizable()
                                .frame(width: imgsize.width, height: imgsize.height)
                                .clipShape(PolygonShape(sides: 6).rotation(Angle.degrees(90)))
                                .offset(x: isEvenRow(idx) ? 0 : hexagonWidth / 2 + (spacing/2))
                        }placeholder: {
                            ProgressView()
                        }
                    }
                    .frame(width: hexagonWidth, height: imgsize.height * 0.75)
                }
            }.frame(width: (hexagonWidth + spacing) * CGFloat(cols-1))
        }
    }
        func isEvenRow(_ idx: Int) -> Bool {
            (idx / cols) % 2 == 0 }
}

    struct FooterConfigView_Previews: PreviewProvider {
    static var previews: some View {
            FooterConfigView()
        }
    }

struct PolygonShape: Shape {
    var sides: Int
    
    func path(in rect: CGRect) -> Path {
        let h = Double(min(rect.size.width, rect.size.height)) / 2.0
        let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        var path = Path()
        
        for i in 0..<sides {
            let angle = (Double(i) * (360.0 / Double(sides))) * Double.pi / 180
            
            let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))
            
            if i == 0 {
                path.move(to: pt) // move to first vertex
            } else {
                path.addLine(to: pt) // draw line to next vertex
            }
        }
        path.closeSubpath()
        return path
    }
}
