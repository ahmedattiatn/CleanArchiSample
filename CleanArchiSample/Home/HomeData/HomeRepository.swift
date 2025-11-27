//
//  HomeRepository.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

final class HomeRepository: HomeRepositoryProtocol {
    // MARK: Internal

    func loadLeagueResponse() async throws -> LeagueResponse? {
        // Return either the LeagueResponse or an error (possibly mapped using a Home-specific error enum).
        try await client.send(LeagueRequest())
    }

    func loadTeamResponse(for leagueName: String) async throws -> TeamResponse? {
        // Return either the TeamResponse or an error (possibly mapped using a Home-specific error enum).
        try await client.send(TeamsRequest(league: leagueName))
    }

    // MARK: Private

    private let client = NetworkAPI()
}
