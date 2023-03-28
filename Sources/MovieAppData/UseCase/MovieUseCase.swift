import Foundation

public protocol MovieUseCaseProtocol {

    var allMovies: [MovieModel] { get }

    var popularMovies: [MovieModel] { get }

    var freeToWatchMovies: [MovieModel] { get }

    var trendingMovies: [MovieModel] { get }

    func getDetails(id: Int) -> MovieDetailsModel?

}

public class MovieUseCase: MovieUseCaseProtocol {

    private let dataSource = MovieDataSource()

    public init() { }

    public var allMovies: [MovieModel] {
        dataSource
            .movies
            .map { $0.useCaseModel.summaryModel }
    }

    public var popularMovies: [MovieModel] {
        dataSource
            .movies
            .filter { $0.tags.contains(.streaming) || $0.tags.contains(.onTv) || $0.tags.contains(.forRent) || $0.tags.contains(.inTheaters)}
            .map { $0.useCaseModel.summaryModel }
    }

    public var freeToWatchMovies: [MovieModel] {
        dataSource
            .movies
            .filter { $0.tags.contains(.movie) || $0.tags.contains(.tvShow)}
            .map { $0.useCaseModel.summaryModel }
    }

    public var trendingMovies: [MovieModel] {
        dataSource
            .movies
            .filter { $0.tags.contains(.trendingToday) || $0.tags.contains(.trendingThisWeek) }
            .map { $0.useCaseModel.summaryModel }
    }

    public func getDetails(id: Int) -> MovieDetailsModel? {
        dataSource
            .movies
            .first(where: { $0.id == id })?
            .useCaseModel
    }

}


public struct MovieModel {

    public let id: Int
    public let name: String
    public let summary: String
    public let imageUrl: String

}

public struct MovieDetailsModel: Equatable {
    
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

public struct MovieCrewMemberModel: Equatable {

    public let name: String
    public let role: String

}

public enum MovieCategoryModel: Equatable {

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

private extension MovieDataModel {

    var useCaseModel: MovieDetailsModel {
        MovieDetailsModel(
            id: id,
            name: name,
            summary: summary,
            imageUrl: imageUrl,
            releaseDate: "\(releaseDate.year)-\(releaseDate.month)-\(releaseDate.day)",
            year: year,
            duration: duration,
            rating: rating,
            categories: categories.map { $0.useCaseModel },
            crewMembers: crewMembers.map { $0.useCaseModel })
    }
}

private extension MovieDetailsModel {

    var summaryModel: MovieModel {
        MovieModel(id: id, name: name, summary: summary, imageUrl: imageUrl)
    }

}

private extension MovieCrewMemberDataModel {

    var useCaseModel: MovieCrewMemberModel {
        MovieCrewMemberModel(name: name, role: role)
    }

}

private extension MovieCategoryDataModel {

    var useCaseModel: MovieCategoryModel {
        switch self {
        case .action:
            return .action
        case .adventure:
            return .adventure
        case .comedy:
            return .comedy
        case .crime:
            return .crime
        case .drama:
            return .drama
        case .fantasy:
            return .fantasy
        case .romance:
            return .romance
        case .scienceFiction:
            return .scienceFiction
        case .thriller:
            return .thriller
        case .western:
            return .western
        }
    }

}
