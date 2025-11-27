//
//  HomePlaceholderView.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import SwiftUI

// MARK: - HomePlaceholderView

struct HomePlaceholderView: View {
    // MARK: Internal

    let placeholderImageURL: String
    var errorMessage: String?

    var body: some View {
        VStack(spacing: CopiloteSpacing.big()) {
            CopiloteAsyncImageView(urlString: placeholderImageURL)
                .frame(
                    width: Constants.placeholderImageWidth,
                    height: isLandscape
                        ? Constants.placeholderImageHeightLandscape
                        : Constants.placeholderImageHeightPortrait
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: CopiloteRadius.tiny())
                )
                .shadow(radius: CopiloteRadius.tiny())

            if let errorMessage, !errorMessage.isEmpty {
                CopiloteTextView(text: errorMessage, style: .caption)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.red)
                    .padding(.horizontal, CopiloteSpacing.medium())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }

    // MARK: Private

    @IsLandscape private var isLandscape: Bool
}

// MARK: - Constants

private enum Constants {
    static let placeholderImageWidth: CGFloat = 200
    static let placeholderImageHeightPortrait: CGFloat = 500
    static let placeholderImageHeightLandscape: CGFloat = 200
}

// MARK: - Preview

#Preview {
    HomePlaceholderView(
        placeholderImageURL: "https://picsum.photos/id/318/800/800",
        errorMessage: "Failed to load teams"
    )
}
