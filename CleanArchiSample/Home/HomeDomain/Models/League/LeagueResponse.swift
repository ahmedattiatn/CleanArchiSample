//
//  LeagueResponse.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

// MARK: - LeagueResponse

public struct LeagueResponse: Codable {
    let leagues: [League]
}

// MARK: Equatable

extension LeagueResponse: Equatable {
    public static func == (lhs: LeagueResponse, rhs: LeagueResponse) -> Bool {
        lhs.leagues == rhs.leagues
    }
}
