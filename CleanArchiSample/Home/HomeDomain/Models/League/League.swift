//
//  League.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

// MARK: - League

public struct League: Codable {
    let idLeague, strLeague: String
    let strSport: String?
    let strLeagueAlternate: String?
}

// MARK: Identifiable

extension League: Identifiable {
    public var id: String { idLeague }
}

// MARK: Equatable

extension League: Equatable {
    public static func == (lhs: League, rhs: League) -> Bool {
        lhs.idLeague == rhs.idLeague && lhs.strLeague == rhs.strLeague
    }
}
