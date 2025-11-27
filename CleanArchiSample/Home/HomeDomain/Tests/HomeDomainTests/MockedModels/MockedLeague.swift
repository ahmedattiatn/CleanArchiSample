//
//  MockedLeague.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

extension League {
    static func fakeOne() -> Self {
        League(
            idLeague: "EPL",
            strLeague: "English Premier League",
            strSport: "Soccer",
            strLeagueAlternate: nil
        )
    }

    static func fakeTwo() -> Self {
        League(
            idLeague: "LL",
            strLeague: "La Liga",
            strSport: "Soccer",
            strLeagueAlternate: nil
        )
    }

    static func fakeThree() -> Self {
        League(
            idLeague: "BL",
            strLeague: "Bundesliga",
            strSport: "Soccer",
            strLeagueAlternate: nil
        )
    }
}

extension LeagueResponse {
    static func fake() -> Self {
        LeagueResponse(
            leagues: [
                .fakeOne(),
                .fakeTwo(),
                .fakeThree()
            ]
        )
    }
}
