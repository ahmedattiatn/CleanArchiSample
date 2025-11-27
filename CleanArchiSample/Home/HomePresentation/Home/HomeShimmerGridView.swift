//
//  HomeShimmerGridView.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import SwiftUI

struct HomeShimmerGridView: View {
    let columns: [GridItem]
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    let cornerRadius: CGFloat
    let textHeight: CGFloat
    let textCornerRadius: CGFloat
    let textHorizontalPadding: CGFloat
    let itemCount: Int

    var body: some View {
        LazyVGrid(columns: columns, spacing: CopiloteSpacing.big()) {
            ForEach(0 ..< itemCount, id: \.self) { _ in
                CopiloteShimmerCard(
                    imageWidth: itemWidth,
                    imageHeight: itemHeight,
                    imageCornerRadius: cornerRadius,
                    textHeight: textHeight,
                    textCornerRadius: textCornerRadius,
                    textHorizontalPadding: textHorizontalPadding
                )
            }
        }
        .padding(.horizontal)
        .padding(.top, CopiloteSpacing.big())
    }
}

#Preview {
    HomeShimmerGridView(
        columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ],
        itemWidth: 150,
        itemHeight: 150,
        cornerRadius: CopiloteRadius.tiny(),
        textHeight: 20,
        textCornerRadius: 12,
        textHorizontalPadding: CopiloteSpacing.medium(),
        itemCount: 4
    )
}
