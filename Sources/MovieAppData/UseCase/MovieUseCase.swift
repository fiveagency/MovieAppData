import Foundation

public protocol MovieUseCaseProtocol {

    func getDetails(id: Int) -> MovieDetailsModel?

}

public class MovieUseCase: MovieUseCaseProtocol {

    public func getDetails(id: Int) -> MovieDetailsModel? {
        guard id == 111161 else { return nil }

        return MovieDetailsModel(
            id: 111161,
            name: "The Shawshank Redemption",
            summary: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
            imageUrl: "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_QL75_UX380_CR0,1,380,562_.jpg",
            releaseDate: "1994-09-13",
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
    }

}

public struct MovieDetailsModel {
    
    public let id: Int
    public let name: String
    public let summary: String
    public let imageUrl: String
    public let releaseDate: String
    public let year: Int
    public let duration: Int
    public let rating: Double
    public let categories: [MovieCategoryModel]
    public let crewMembers: [MovieCrewMemberModel]

}

public struct MovieCrewMemberModel {

    public let name: String
    public let role: String

}

public enum MovieCategoryModel {

    case action
    case adventure
    case comedy
    case crime
    case drama
    case fantasy
    case romance
    case scienceFiction
    case thriller
    case western

}
