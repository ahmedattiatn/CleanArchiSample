
//
//  GetLeaguesUseCaseTests.swift
//  CleanArchiSampleTests
//
//  Created by ChatGPT on 2025-11-16
//

import Factory
import XCTest
@testable import CleanArchiSample

final class GetLeaguesUseCaseTests: XCTestCase {
    // MARK: Internal

    // MARK: - TearDown

    override func tearDown() {
        Container.shared.homeRepository.reset()
        homeRepositoryMock = nil
        sut = nil
        super.tearDown()
    }

    // MARK: - Tests

    func test_GetLeagues_Success() async throws {
        // GIVEN
        let fakeLeagues = LeagueResponse.fake()
        homeRepositoryMock = HomeRepositoryMock(leagueResult: .success(fakeLeagues))
        Container.shared.homeRepository.register { self.homeRepositoryMock }
        sut = GetLeaguesUseCase()

        // WHEN
        let leagues = try await sut()

        // THEN
        XCTAssertNotNil(leagues)
        XCTAssertEqual(leagues?.count, fakeLeagues.leagues.count)
        XCTAssertEqual(leagues?.first?.strLeague, "English Premier League")
    }

    func test_GetLeagues_ReturnsNilWhenRepositoryReturnsNil() async throws {
        // GIVEN
        homeRepositoryMock = HomeRepositoryMock(leagueResult: .success(nil))
        Container.shared.homeRepository.register { self.homeRepositoryMock }
        sut = GetLeaguesUseCase()

        // WHEN
        let leagues = try await sut()

        // THEN
        XCTAssertNil(leagues)
    }

    func test_GetLeagues_FailureThrowsError() async throws {
        enum FakeError: Error { case failed }

        // GIVEN
        homeRepositoryMock = HomeRepositoryMock(leagueResult: .failure(FakeError.failed))
        Container.shared.homeRepository.register { self.homeRepositoryMock }
        sut = GetLeaguesUseCase()

        // THEN
        do {
            _ = try await sut()
            XCTFail("Expected error but got success")
        } catch {
            XCTAssertTrue(error is FakeError)
        }
    }

    // MARK: Private

    private var homeRepositoryMock: HomeRepositoryMock!
    private var sut: GetLeaguesUseCase!
}
