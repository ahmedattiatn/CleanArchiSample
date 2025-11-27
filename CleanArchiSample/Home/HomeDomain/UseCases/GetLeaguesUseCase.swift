//
//  GetLeaguesUseCase.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import Factory

public struct GetLeaguesUseCase: GetLeaguesUseCaseProtocol {
    // MARK: Lifecycle

    public init() {}

    // MARK: Internal

    func callAsFunction() async throws -> [League]? {
        guard let homeRepository else {
            return nil
        }
        // We need to map the LeagueResponse from the data layer to our League model,
        // apply any business rules if needed, then return either the list or an error.
        // Alternatively, if no business rules are required, we could do the mapping
        // directly in the data layer. In that case, the use case simply passes data through,
        // which is fine — in clean architecture, the data layer can work with domain models.
        do {
            return try await homeRepository.loadLeagueResponse()?.leagues
        } catch {
            print("Failed to load leagues: \(error)")
            throw error
        }
    }

    // MARK: Private

    @Injected(\.homeRepository) private var homeRepository
}
