//
//  TagLayoutView.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//

import SwiftUI

struct TagLayoutView: View {
    let tags: [Tag]
    var body: some View {
            GeometryReader { geometry in
                self.generateFlowLayout(in: geometry)
            }
            .frame(height: calculateHeight())
        }
        
        private func generateFlowLayout(in geometry: GeometryProxy) -> some View {
            var leading: CGFloat = 0
            var top: CGFloat = 0
            
            return ZStack(alignment: .topLeading) {
                ForEach(tags.indices, id: \.self) { index in
                    TagView(tag: tags[index].tagName)
                        .padding(.trailing, 8)
                        .alignmentGuide(.leading) { dimension in
                            if (abs(leading - dimension.width)) > geometry.size.width {
                                leading = .zero
                                top -= dimension.width + 8
                            }
                            
                            let result = leading
                            if index == tags.count - 1 {
                                leading = 0
                            } else {
                                leading -= dimension.width + 8
                            }
                            
                            return result
                        }
                        .alignmentGuide(.top) { _ in
                            let result = top
                            if index == tags.count - 1 {
                                top = .zero
                            }
                            return result
                        }
                }
            }
        }
        
        private func calculateHeight() -> CGFloat {
            let numPerRow = 3
            let rows = (tags.count + numPerRow - 1) / numPerRow
            return CGFloat(rows * 40)
        }
}

#Preview {
    TagLayoutView(tags: Tag.defaultTags)
}

