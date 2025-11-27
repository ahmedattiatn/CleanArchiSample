//
//  HomeRouter.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import SwiftUI

// MARK: - HomeRouter

enum HomeRouter {
    static func destinationForTappedTeam(team: Team) -> some View {
        TeamDetailsConfigurator.configureTeamDetailsView(with: team)
    }
}
