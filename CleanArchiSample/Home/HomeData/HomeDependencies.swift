//
//  HomeDependencies.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import Factory

public enum HomeDependencies {
    public static func autoRegister(_ container: Container) {
        container.homeRepository.register {
            HomeRepository()
        }

        container.getLeaguesUseCase.register {
            GetLeaguesUseCase()
        }

        container.getTeamsUseCase.register {
            GetTeamsUseCase()
        }
    }
}
