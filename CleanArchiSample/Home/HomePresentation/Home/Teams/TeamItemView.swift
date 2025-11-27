//
//  TeamItemView.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import SwiftUI

struct TeamItemView: View {
    let team: Team
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat

    var body: some View {
        VStack(spacing: CopiloteSpacing.tiny()) {
            CopiloteAsyncImageView(urlString: team.strBadge)
                .frame(
                    width: width,
                    height: height
                )

            CopiloteTextView(
                text: team.strTeam ?? "",
                style: .title
            )
        }
        .frame(maxWidth: .infinity)
        .padding(CopiloteSpacing.tiny())
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

#Preview {
    TeamItemView(
        team: .init(
            idTeam: "1",
            strTeam: "Manchester United",
            strSport: "Soccer",
            strLeague: "English Premier League",
            idLeague: "EPL",
            strBadge: "https://picsum.photos/id/101/200/200",
            strLogo: nil,
            strBanner: nil
        ),
        width: 150,
        height: 150,
        cornerRadius: 12
    )
}
