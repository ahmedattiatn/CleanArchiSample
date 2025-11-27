//
//  MockedTeam.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

extension Team {
    static func fakeOne() -> Self {
        Team(
            idTeam: "1",
            strTeam: "Manchester United",
            strSport: "Soccer",
            strLeague: "English Premier League",
            idLeague: "EPL",
            strBadge: "https://picsum.photos/id/101/200/200",
            strLogo: nil,
            strBanner: nil
        )
    }

    static func fakeTwo() -> Self {
        Team(
            idTeam: "2",
            strTeam: "Chelsea",
            strSport: "Soccer",
            strLeague: "English Premier League",
            idLeague: "EPL",
            strBadge: "https://picsum.photos/id/102/200/200",
            strLogo: nil,
            strBanner: nil
        )
    }

    static func fakeThree() -> Self {
        Team(
            idTeam: "3",
            strTeam: "Liverpool",
            strSport: "Soccer",
            strLeague: "English Premier League",
            idLeague: "EPL",
            strBadge: "https://picsum.photos/id/103/200/200",
            strLogo: nil,
            strBanner: nil
        )
    }
}

public extension TeamResponse {
    static func fake() -> Self {
        TeamResponse(
            teams: [
                .fakeOne(),
                .fakeTwo(),
                .fakeThree()
            ]
        )
    }
}
