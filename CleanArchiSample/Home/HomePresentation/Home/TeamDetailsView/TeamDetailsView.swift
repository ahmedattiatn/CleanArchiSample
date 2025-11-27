//
//  TeamDetailsView.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import SwiftUI

// MARK: - TeamDetailsView

struct TeamDetailsView: View {
    let team: Team

    var body: some View {
        VStack {
            VStack(spacing: CopiloteSpacing.medium()) {
                CopiloteAsyncImageView(urlString: team.strBadge)
                    .frame(
                        width: Constants.imageHeight,
                        height: Constants.imageWdith
                    )
                    .clipped()
                    .cornerRadius(CopiloteRadius.medium())
                CopiloteTextView(text: team.strSport ?? "", style: .title)
                CopiloteTextView(text: team.strLeague, style: .subtitle)
            }
            .padding()
            .frame(height: Constants.cardHeight)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: CopiloteRadius.medium()))
            .shadow(radius: Constants.shadowRadius)
            Spacer()
        }
        .padding()
        .navigationTitle(team.strTeam ?? "")
    }
}

// MARK: - Constants

private enum Constants {
    static let imageHeight: CGFloat = 200
    static let imageWdith: CGFloat = 200
    static let cardHeight: CGFloat = 300
    static let shadowRadius: CGFloat = 6
}

// MARK: - TeamDetailsView_Previews

#Preview {
    TeamDetailsView(
        team: Team(
            idTeam: "1",
            strTeam: "Manchester United",
            strSport: "Soccer",
            strLeague: "English Premier League",
            idLeague: "EPL",
            strBadge: "https://picsum.photos/id/101/200/200",
            strLogo: nil,
            strBanner: nil
        )
    )
}
