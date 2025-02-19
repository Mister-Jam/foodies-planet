//
//  FlowLayout.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//
import SwiftUI

struct FlowLayout<Data, Content>: View where Data: RandomAccessCollection, Data.Element: Hashable, Content: View {
    enum Mode {
        case stack
        case scrollable
    }
    
    let mode: Mode
    let items: Data
    let itemSpacing: CGFloat
    let content: (Data.Element) -> Content
    
    init(mode: Mode = .stack,
         items: Data,
         itemSpacing: CGFloat = 8,
         @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.mode = mode
        self.items = items
        self.itemSpacing = itemSpacing
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            contentView(in: geometry)
        }
    }
    
    @ViewBuilder
    func contentView(in geometry: GeometryProxy) -> some View {
        let containerWidth = geometry.size.width
        
        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        var lineHeight: CGFloat = 0
        
        let itemsWithSize = items.map { item -> (Data.Element, CGSize) in
            let size = content(item).measuring(in: geometry.size)
            return (item, size)
        }
        
        let positions: [CGPoint] = itemsWithSize.map { item, size in
            if currentX + size.width > containerWidth {
                currentX = 0
                currentY += lineHeight + itemSpacing
                lineHeight = 0
            }
            
            let position = CGPoint(x: currentX, y: currentY)
            currentX += size.width + itemSpacing
            lineHeight = max(lineHeight, size.height)
            
            return position
        }
        
        let contentHeight = positions.last.map { $0.y + lineHeight } ?? 0
        
        let positionMapping: [Data.Element: CGPoint] = Dictionary(uniqueKeysWithValues: zip(itemsWithSize.map { $0.0 }, positions))
        
        if mode == .scrollable {
            ScrollView(.vertical, showsIndicators: false) {
                ZStack(alignment: .topLeading) {
                    ForEach(Array(items), id: \.self) { item in
                        content(item)
                            .alignmentGuide(.leading) { _ in
                                -positionMapping[item]!.x
                            }
                            .alignmentGuide(.top) { _ in
                                -positionMapping[item]!.y
                            }
                    }
                }
                .frame(height: contentHeight)
            }
        } else {
            ZStack(alignment: .topLeading) {
                ForEach(Array(items), id: \.self) { item in
                    content(item)
                        .alignmentGuide(.leading) { _ in
                            -positionMapping[item]!.x
                        }
                        .alignmentGuide(.top) { _ in
                            -positionMapping[item]!.y
                        }
                }
            }
            .frame(height: contentHeight)
        }
    }
}
