//
//  TeamResponse.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

// MARK: - TeamResponse

public struct TeamResponse: Codable {
    let teams: [Team]
}

// MARK: Equatable

extension TeamResponse: Equatable {
    public static func == (lhs: TeamResponse, rhs: TeamResponse) -> Bool {
        lhs.teams == rhs.teams
    }
}
