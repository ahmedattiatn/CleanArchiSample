//
//  HomeRepositoryProtocol.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import Factory

// MARK: - HomeRepositoryProtocol

public protocol HomeRepositoryProtocol {
    func loadLeagueResponse() async throws -> LeagueResponse?
    func loadTeamResponse(for leagueName: String) async throws -> TeamResponse?
}

public extension Container {
    var homeRepository: Factory<HomeRepositoryProtocol?> {
        promised()
    }
}
