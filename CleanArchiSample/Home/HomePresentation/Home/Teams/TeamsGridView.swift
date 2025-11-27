//
//  TeamsGridView.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import SwiftUI

struct TeamsGridView: View {
    let teams: [Team]
    let columns: [GridItem]
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    let cornerRadius: CGFloat

    var body: some View {
        LazyVGrid(columns: columns, spacing: CopiloteSpacing.big()) {
            ForEach(teams) { team in
                NavigationLink {
                    HomeRouter.destinationForTappedTeam(team: team)
                } label: {
                    TeamItemView(
                        team: team,
                        width: itemWidth,
                        height: itemHeight,
                        cornerRadius: cornerRadius
                    )
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    TeamsGridView(
        teams: [
            .init(
                idTeam: "1",
                strTeam: "Manchester United",
                strSport: "Soccer",
                strLeague: "English Premier League",
                idLeague: "EPL",
                strBadge: "https://picsum.photos/id/101/200/200",
                strLogo: nil,
                strBanner: nil
            )
        ],
        columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ],
        itemWidth: 150,
        itemHeight: 150,
        cornerRadius: CopiloteRadius.tiny()
    )
}
