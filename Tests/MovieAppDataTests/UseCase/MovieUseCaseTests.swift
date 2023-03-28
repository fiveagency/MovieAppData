import XCTest
@testable import MovieAppData

class MovieUseCaseTests: XCTestCase {

    func testAllMoviesCount() {
        let useCase = MovieUseCase()

        XCTAssertEqual(useCase.allMovies.count, 50)
    }

    func testPopularMoviesCount() {
        let useCase = MovieUseCase()

        XCTAssertEqual(useCase.popularMovies.count, 41)
    }

    func testFreeToWatchMoviesCount() {
        let useCase = MovieUseCase()

        XCTAssertEqual(useCase.freeToWatchMovies.count, 9)
    }

    func testTrendingMoviesCount() {
        let useCase = MovieUseCase()

        XCTAssertEqual(useCase.trendingMovies.count, 17)
    }

    func testMovieDetails() {
        let useCase = MovieUseCase()

        XCTAssertNil(useCase.getDetails(id: -1))

        let expected = MovieDetailsModel(
            id: 111161,
            name: "The Shawshank Redemption",
            summary: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
            imageUrl: "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_QL75_UX380_CR0,1,380,562_.jpg",
            releaseDate: "1994-9-13",
            year: 1994,
            duration: 142,
            rating: 9.3,
            categories: [.drama],
            crewMembers: [
                MovieCrewMemberModel(name: "Frank Darabont", role: "Director"),
                MovieCrewMemberModel(name: "Tim Robbins", role: "Actor"),
                MovieCrewMemberModel(name: "Morgan Freeman", role: "Actor"),
                MovieCrewMemberModel(name: "Bob Gunton", role: "Actor"),
                MovieCrewMemberModel(name: "William Sadler", role: "Actor"),
            ])

        XCTAssertEqual(useCase.getDetails(id: 111161), expected)
    }

}
