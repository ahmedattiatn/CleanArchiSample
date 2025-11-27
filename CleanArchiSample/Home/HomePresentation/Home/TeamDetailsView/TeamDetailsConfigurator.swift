//
//  TeamDetailsConfigurator.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import Foundation

enum TeamDetailsConfigurator {
    static func configureTeamDetailsView(with team: Team) -> TeamDetailsView {
        TeamDetailsView(team: team)
    }
}
