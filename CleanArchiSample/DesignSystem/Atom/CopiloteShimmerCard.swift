//
//  CopiloteShimmerCard.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import SwiftUI

// MARK: - CopiloteShimmerCard

struct CopiloteShimmerCard: View {
    // MARK: Internal

    let imageWidth: CGFloat
    let imageHeight: CGFloat
    let imageCornerRadius: CGFloat
    let textHeight: CGFloat
    let textCornerRadius: CGFloat
    let textHorizontalPadding: CGFloat

    var body: some View {
        VStack(spacing: 8) {
            RoundedRectangle(cornerRadius: imageCornerRadius)
                .fill(Color.gray.opacity(0.3))
                .frame(width: imageWidth, height: imageHeight)
                .shimmer(phase: phase)

            RoundedRectangle(cornerRadius: textCornerRadius)
                .fill(Color.gray.opacity(0.3))
                .frame(height: textHeight)
                .shimmer(phase: phase)
                .padding(.horizontal, textHorizontalPadding)
        }
        .frame(maxWidth: .infinity)
        .padding(8)
        .onAppear {
            withAnimation(
                .linear(duration: 1.2)
                    .repeatForever(autoreverses: false)
            ) {
                phase = 1
            }
        }
    }

    // MARK: Private

    @State private var phase: CGFloat = 0
}

// MARK: - Shimmer Modifier

extension View {
    func shimmer(phase: CGFloat) -> some View {
        overlay(
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        .white.opacity(0.3),
                        .white.opacity(0.7),
                        .white.opacity(0.3)
                    ]
                ),
                startPoint: .leading,
                endPoint: .trailing
            )
            .rotationEffect(.degrees(30))
            .offset(x: phase * 200)
        )
       .mask(self)
    }
}

// MARK: - Preview

#Preview {
    CopiloteShimmerCard(
        imageWidth: 150,
        imageHeight: 150,
        imageCornerRadius: 12,
        textHeight: 20,
        textCornerRadius: 4,
        textHorizontalPadding: 16
    )
    .padding()
}
