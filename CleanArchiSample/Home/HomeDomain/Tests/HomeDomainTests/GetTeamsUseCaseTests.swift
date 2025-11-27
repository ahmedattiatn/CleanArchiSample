//
//  GetTeamsUseCaseTests.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import Factory
import XCTest

final class GetTeamsUseCaseTests: XCTestCase {
    // MARK: Internal

    // MARK: - Teardown

    override func tearDown() {
        Container.shared.homeRepository.reset()
        homeRepositoryMock = nil
        sut = nil
        super.tearDown()
    }

    // MARK: - Tests

    func test_GetTeams_Success() async throws {
        // GIVEN
        let fakeTeams = TeamResponse.fake()

        homeRepositoryMock = HomeRepositoryMock(
            leagueResult: .success(nil),
            teamResult: .success(fakeTeams)
        )

        Container.shared.homeRepository.register { self.homeRepositoryMock }

        sut = GetTeamsUseCase()

        // WHEN
        let teams = try await sut(for: "English Premier League")

        // THEN
        XCTAssertNotNil(teams)
        XCTAssertEqual(teams?.count, 3)

        // Sorted alphabetically by strTeam
        XCTAssertEqual(teams?.map(\.strTeam), [
            "Chelsea",
            "Liverpool",
            "Manchester United"
        ])
    }

    func test_GetTeams_ReturnsNilWhenRepositoryReturnsNil() async throws {
        // GIVEN
        homeRepositoryMock = HomeRepositoryMock(
            leagueResult: .success(nil),
            teamResult: .success(nil)
        )

        Container.shared.homeRepository.register { self.homeRepositoryMock }

        sut = GetTeamsUseCase()

        // WHEN
        let teams = try await sut(for: "EPL")

        // THEN
        XCTAssertNil(teams)
    }

    func test_GetTeams_FailureThrowsError() async throws {
        enum FakeError: Error { case failed }

        // GIVEN
        homeRepositoryMock = HomeRepositoryMock(
            leagueResult: .success(nil),
            teamResult: .failure(FakeError.failed)
        )

        Container.shared.homeRepository.register { self.homeRepositoryMock }

        sut = GetTeamsUseCase()

        // THEN
        do {
            _ = try await sut(for: "EPL")
            XCTFail("Expected error but got success")
        } catch {
            XCTAssertTrue(error is FakeError)
        }
    }

    func test_GetTeams_SortingIsAlphabetical() async throws {
        // GIVEN – deliberately unsorted data
        let unsorted = TeamResponse(
            teams: [
                .fakeThree(), // Liverpool
                .fakeOne(), // Manchester United
                .fakeTwo() // Chelsea
            ]
        )

        homeRepositoryMock = HomeRepositoryMock(
            leagueResult: .success(nil),
            teamResult: .success(unsorted)
        )

        Container.shared.homeRepository.register { self.homeRepositoryMock }

        sut = GetTeamsUseCase()

        // WHEN
        let teams = try await sut(for: "EPL")

        // THEN
        XCTAssertEqual(teams?.map(\.strTeam), [
            "Chelsea", // C
            "Liverpool", // L
            "Manchester United" // M
        ])
    }

    // MARK: Private

    private var homeRepositoryMock: HomeRepositoryMock!
    private var sut: GetTeamsUseCase!
}
