//
//  GetTeamsUseCaseProtocol.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import Combine
import Factory

// MARK: - GetTeamsUseCaseProtocol

protocol GetTeamsUseCaseProtocol {
    func callAsFunction(for leagueName: String) async throws -> [Team]?
}

extension Container {
    var getTeamsUseCase: Factory<GetTeamsUseCaseProtocol> {
        Factory(self) { GetTeamsUseCase() }
    }
}
