//
//  TeamsRequest.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

struct TeamsRequest: APIRequest {
    // MARK: Lifecycle

    init(league: String) {
        self.endpoint = .teams(league: league)
    }

    // MARK: Internal

    typealias Response = TeamResponse

    let endpoint: Endpoint
}
