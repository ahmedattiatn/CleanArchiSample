//
//  LeagueServiceProtocol.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import Combine
import Factory

// MARK: - GetLeaguesUseCaseProtocol

protocol GetLeaguesUseCaseProtocol {
    func callAsFunction() async throws -> [League]?
}

extension Container {
    var getLeaguesUseCase: Factory<GetLeaguesUseCaseProtocol> {
        Factory(self) { GetLeaguesUseCase() }
    }
}
