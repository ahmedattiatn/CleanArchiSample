//
//  HomeViewState.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 16/11/2025.
//

// MARK: - HomeViewState

enum HomeViewState: Equatable {
    case loading
    case empty
    case loadedContent
    case error(String)
}
