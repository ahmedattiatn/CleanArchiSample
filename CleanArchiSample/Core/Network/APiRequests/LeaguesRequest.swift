//
//  LeaguesRequest.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

// MARK: - AllLeaguesRequest

struct LeagueRequest: APIRequest {
    typealias Response = LeagueResponse

    let endpoint: Endpoint = .leagues
}

// MARK: - TeamsRequest
