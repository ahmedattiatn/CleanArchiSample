//
//  GetTeamsUseCase.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import Factory

public struct GetTeamsUseCase: GetTeamsUseCaseProtocol {
    // MARK: Lifecycle

    public init() {}

    // MARK: Internal

    func callAsFunction(for leagueName: String) async throws -> [Team]? {
        guard let homeRepository else {
            return nil
        }
        // We need to map the TeamResponse from the data layer to our Team model,
        // apply any business rules if needed, then return either the list or an error.
        // Alternatively, if no business rules are required, we could do the mapping
        // directly in the data layer. In that case, the use case simply passes data through,
        // which is fine — in clean architecture, the data layer can work with domain models.
        do {
            return try await homeRepository
                .loadTeamResponse(for: leagueName)?
                .teams
                .sorted(by: { $0.strTeam ?? "" < $1.strTeam ?? "" })
        } catch {
            print("Failed to load teams: \(error)")
            throw error
        }
    }

    // MARK: Private

    @Injected(\.homeRepository) private var homeRepository
}
