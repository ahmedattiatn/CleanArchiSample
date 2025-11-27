import SwiftUI

// MARK: - HomeView

struct HomeView: View {
    @State private var searchText = ""
    @StateObject var viewModel: HomeViewModel = .init()

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                content
            }
            .navigationTitle("home_title")
            .searchable(text: $searchText, prompt: "home_search_prompt") {
                searchSuggestions
            }
            .onSubmit(of: .search, runSearch)
            .task { await viewModel.loadLeagues() }
        }
    }
}

// MARK: - Constants

private enum Constants {
    static let teamImageItemWidth: CGFloat = 150
    static let teamImageItemHeight: CGFloat = 150
    static let textHeight: CGFloat = 20
    static let textCornerRadius: CGFloat = 4
}

// MARK: - Main Content

private extension HomeView {
    @ViewBuilder
    var content: some View {
        switch viewModel.homeViewState {
        case .loading:
            HomeShimmerGridView(
                columns: columns,
                itemWidth: Constants.teamImageItemWidth,
                itemHeight: Constants.teamImageItemHeight,
                cornerRadius: CopiloteRadius.tiny(),
                textHeight: Constants.textHeight,
                textCornerRadius: Constants.textCornerRadius,
                textHorizontalPadding: CopiloteSpacing.medium(),
                itemCount: 4
            )

        case .empty:
            placeHolderView()

        case let .error(message):
            placeHolderView(message)

        case .loadedContent:
            if !viewModel.teams.isEmpty {
                TeamsGridView(
                    teams: viewModel.teams,
                    columns: columns,
                    itemWidth: Constants.teamImageItemWidth,
                    itemHeight: Constants.teamImageItemHeight,
                    cornerRadius: CopiloteRadius.tiny()
                )
            } else {
                placeHolderView()
            }
        }
    }

    @ViewBuilder
    func placeHolderView(_ message: String? = nil) -> some View {
        HomePlaceholderView(
            placeholderImageURL: viewModel.placeholderLink,
            errorMessage: message
        )
    }
}

// MARK: - Search Suggestions

private extension HomeView {
    @ViewBuilder
    var searchSuggestions: some View {
        let matches = viewModel.getFilteredLeagueNames(for: searchText)
        if !searchText.isEmpty, !matches.isEmpty {
            ForEach(matches, id: \.self) { league in
                CopiloteTextView(text: league, style: .body)
                    .searchCompletion(league)
            }
        }
    }
}

// MARK: - Search Logic

private extension HomeView {
    func runSearch() {
        hideKeyboard()
        guard viewModel.isValid(searchText) else {
            return
        }
        Task { await viewModel.loadTeams(for: searchText) }
    }
}

// MARK: - Preview

#Preview {
    HomeView(viewModel: HomeViewModel())
}
