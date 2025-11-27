
//
//  HomeViewModelTests.swift
//  CleanArchiSampleTests
//
//  Created by Ahmed Atia on 15/11/2025.
//

import Factory
import XCTest
@testable import CleanArchiSample

final class HomeViewModelTests: XCTestCase {
    // MARK: Internal

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        Container.shared.homeRepository.reset()
        viewModel = nil
        homeRepositoryMock = nil
        super.tearDown()
    }

    // MARK: - Load LEAGUES

    func test_loadLeagues_success() async throws {
        // GIVEN
        let fake = LeagueResponse.fake()
        homeRepositoryMock = HomeRepositoryMock(
            leagueResult: .success(fake),
            teamResult: .success(nil)
        )
        Container.shared.homeRepository.register { self.homeRepositoryMock }
        viewModel = await HomeViewModel()

        // WHEN
        await viewModel.loadLeagues()

        // THEN
        await MainActor.run {
            XCTAssertFalse(viewModel.leagues.isEmpty)
            XCTAssertEqual(viewModel.leagues.count, 3)
            XCTAssertEqual(viewModel.homeViewState, HomeViewState.loadedContent)
        }
    }

    func test_loadLeagues_failure_setsError() async throws {
        enum FakeError: Error { case failed }

        // GIVEN
        homeRepositoryMock = HomeRepositoryMock(
            leagueResult: .failure(FakeError.failed),
            teamResult: .success(nil)
        )
        Container.shared.homeRepository.register { self.homeRepositoryMock }
        viewModel = await HomeViewModel()

        // WHEN
        await viewModel.loadLeagues()

        // THEN
        await MainActor.run {
            XCTAssertTrue(viewModel.leagues.isEmpty)
            if case let .error(message) = viewModel.homeViewState {
                XCTAssertTrue(message.contains("Leagues"))
            } else {
                XCTFail("Expected HomeViewState to be .error")
            }
        }
    }

    // MARK: - Load TEAMS

    func test_loadTeams_success() async throws {
        // GIVEN
        let fakeTeams = TeamResponse.fake()
        homeRepositoryMock = HomeRepositoryMock(
            leagueResult: .success(nil),
            teamResult: .success(fakeTeams)
        )
        Container.shared.homeRepository.register { self.homeRepositoryMock }
        viewModel = await HomeViewModel()

        // WHEN
        await viewModel.loadTeams(for: "English Premier League")

        // THEN
        await MainActor.run {
            XCTAssertEqual(viewModel.teams.count, 3)
            XCTAssertEqual(viewModel.teams.map(\.strTeam), [
                "Chelsea",
                "Liverpool",
                "Manchester United"
            ])
            XCTAssertEqual(viewModel.homeViewState, HomeViewState.loadedContent)
        }
    }

    func test_loadTeams_failure_setsError() async throws {
        enum FakeError: Error { case failed }

        // GIVEN
        homeRepositoryMock = HomeRepositoryMock(
            leagueResult: .success(nil),
            teamResult: .failure(FakeError.failed)
        )
        Container.shared.homeRepository.register { self.homeRepositoryMock }
        viewModel = await HomeViewModel()

        // WHEN
        await viewModel.loadTeams(for: "English Premier League")

        // THEN
        await MainActor.run {
            XCTAssertTrue(viewModel.teams.isEmpty)
            if case let .error(message) = viewModel.homeViewState {
                XCTAssertTrue(message.contains("Teams"))
            } else {
                XCTFail("Expected HomeViewState to be .error")
            }
        }
    }

    // MARK: - Filter / Validation

    func test_getFilteredLeagueNames() async {
        homeRepositoryMock = HomeRepositoryMock(
            leagueResult: .success(LeagueResponse.fake()),
            teamResult: .success(nil)
        )
        Container.shared.homeRepository.register { self.homeRepositoryMock }
        viewModel = await HomeViewModel()
        await viewModel.loadLeagues()

        await MainActor.run {
            let result = viewModel.getFilteredLeagueNames(for: "Bundesliga")
            XCTAssertEqual(result.count, 1)
        }
    }

    // MARK: Private

    private var viewModel: HomeViewModel!
    private var homeRepositoryMock: HomeRepositoryMock!
}
