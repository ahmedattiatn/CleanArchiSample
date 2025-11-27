import Combine
import Factory
import Foundation

// MARK: - HomeViewModel

@MainActor
class HomeViewModel: ObservableObject {
    // MARK: Lifecycle

    deinit {
        print("HomeViewModel deinit")
    }

    // MARK: Internal

    // MARK: - Published Properties

    @Published private(set) var teams: [Team] = []
    @Published private(set) var leagues: [League] = []
    @Published private(set) var homeViewState: HomeViewState = .empty

    let placeholderLink: String = Constants.placeholderLink

    // MARK: Load Methods

    func loadLeagues() async {
        await load(
            fetch: { [weak self] in try await self?.getLeaguesUseCase() },
            update: { [weak self] (result: [League]) in
                self?.leagues = result
            },
            errorPrefix: "Leagues"
        )
    }

    func loadTeams(for leagueName: String) async {
        await load(
            fetch: { [weak self] in try await self?.getTeamsUseCase(for: leagueName) },
            update: { [weak self] (result: [Team]) in
                self?.teams = result
            },
            errorPrefix: "Teams"
        )
    }

    // MARK: - Filter / Validation

    func getFilteredLeagueNames(for searchText: String) -> [String] {
        leagues
            .compactMap(\.strLeague)
            .filter { $0.localizedCaseInsensitiveContains(searchText) }
    }

    func isValid(_ searchText: String) -> Bool {
        leagues.contains {
            $0.strLeague.localizedCaseInsensitiveCompare(searchText) == .orderedSame
        }
    }

    // MARK: Private

    private enum Constants {
        static let placeholderLink: String = "https://picsum.photos/id/318/800/800"
    }

    @LazyInjected(\.getLeaguesUseCase) private var getLeaguesUseCase
    @LazyInjected(\.getTeamsUseCase) private var getTeamsUseCase

    private var searchScopes: [String] { leagues.map(\.strLeague) }

    // MARK: - Generic Loader

    private func load<T>(
        fetch: @escaping () async throws -> [T]?,
        update: @escaping ([T]) -> Void,
        errorPrefix: String
    ) async {
        homeViewState = .loading
        do {
            let result = try await fetch() ?? []
            homeViewState = result.isEmpty ? .empty : .loadedContent
            update(result)
        } catch {
            homeViewState = .error("Failed to load \(errorPrefix): \(error.localizedDescription)")
        }
    }
}
