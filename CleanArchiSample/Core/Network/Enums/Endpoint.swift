import Foundation

public enum Endpoint {
    case leagues
    case teams(league: String)

    // MARK: Internal

    var path: String {
        switch self {
        case .leagues:
            "/all_leagues.php"
        case .teams:
            "/search_all_teams.php"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .leagues,
             .teams:
            .GET
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .leagues: nil
        case let .teams(league):
            [
                URLQueryItem(name: "l", value: league)
            ]
        }
    }

    var apiKey: String {
        "/\(AppInfo.shared.apiKey)"
    }
}
