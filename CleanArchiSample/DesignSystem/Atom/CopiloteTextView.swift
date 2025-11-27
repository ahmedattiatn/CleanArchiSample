//
//  CopiloteTextView.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import SwiftUI

// MARK: - CopiloteTextStyle

enum CopiloteTextStyle {
    case title
    case subtitle
    case body
    case caption
    case custom(font: Font, color: Color)

    // MARK: Internal

    var font: Font {
        switch self {
        case .title: return .title2.bold()
        case .subtitle: return .headline
        case .body: return .body
        case .caption: return .caption
        case let .custom(font, _): return font
        }
    }

    var color: Color {
        switch self {
        case .title: return .primary
        case .subtitle: return .secondary
        case .body: return .primary
        case .caption: return .secondary
        case let .custom(_, color): return color
        }
    }
}

// MARK: - CopiloteTextView

struct CopiloteTextView: View {
    // MARK: Lifecycle

    init(
        title: String? = nil,
        text: String,
        style: CopiloteTextStyle = .body
    ) {
        self.title = title
        self.text = text
        self.style = style
    }

    // MARK: Internal

    let title: String?
    let text: String
    let style: CopiloteTextStyle

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            if let title {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Text(text)
                .font(style.font)
                .foregroundColor(style.color)
                .lineLimit(nil)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 20) {
        CopiloteTextView(
            title: "Name",
            text: "Kylian Mbappé",
            style: .title
        )

        CopiloteTextView(
            title: "Description",
            text: "One of the fastest and most talented football players in the world."
        )

        CopiloteTextView(
            text: "Small caption text",
            style: .caption
        )

        CopiloteTextView(
            title: "Custom",
            text: "Fully Custom Styling",
            style: .custom(font: .system(size: 22, weight: .semibold), color: .blue)
        )
    }
    .padding()
}
