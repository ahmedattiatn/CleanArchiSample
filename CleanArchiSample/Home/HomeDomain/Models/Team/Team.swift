//
//  Team.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import Foundation

// MARK: - Team

public struct Team: Codable {
    let idTeam: String
    let strTeam: String?
    let strSport: String?
    let strLeague: String
    let idLeague: String
    let strBadge: String
    let strLogo: String?
    let strBanner: String?
}

// MARK: Identifiable

extension Team: Identifiable {
    public var id: String { idTeam }
}

// MARK: Equatable

extension Team: Equatable {
    public static func == (lhs: Team, rhs: Team) -> Bool {
        lhs.idTeam == rhs.idTeam &&
            lhs.strBadge == rhs.strBadge &&
            lhs.strBanner == rhs.strBanner
    }
}
