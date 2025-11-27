//
//  RepositoryMock.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import Factory
import XCTest

final class HomeRepositoryMock: HomeRepositoryProtocol {
    // MARK: Lifecycle

    // MARK: - Init

    init(
        leagueResult: Result<LeagueResponse?, Error> = .success(nil),
        teamResult: Result<TeamResponse?, Error> = .success(nil)
    ) {
        self.leagueResult = leagueResult
        self.teamResult = teamResult
    }

    // MARK: Internal

    // MARK: - Stored results for tests

    var leagueResult: Result<LeagueResponse?, Error>
    var teamResult: Result<TeamResponse?, Error>

    // MARK: - HomeRepositoryProtocol

    func loadLeagueResponse() async throws -> LeagueResponse? {
        switch leagueResult {
        case let .success(response): return response
        case let .failure(error): throw error
        }
    }

    func loadTeamResponse(for _: String) async throws -> TeamResponse? {
        switch teamResult {
        case let .success(response): return response
        case let .failure(error): throw error
        }
    }
}
