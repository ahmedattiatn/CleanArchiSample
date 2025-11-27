//
//  CopiloteImageView.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import SwiftUI

struct CopiloteAsyncImageView: View {
    let urlString: String

    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.gray.opacity(0.2))
            case let .success(image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                Color.gray
            @unknown default:
                Color.gray
            }
        }
        .clipped()
    }
}
