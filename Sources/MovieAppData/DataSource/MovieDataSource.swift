import Foundation

class MovieDataSource {

    let movies: [MovieDataModel]

    init() {
        guard
            let url = Bundle.module.url(forResource: "movie_data", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let list = try? JSONDecoder().decode([MovieDataModel].self, from: data)
        else {
            movies = []
            return
        }

        movies = list
    }

}


struct MovieDataModel: Decodable {

    let id: Int
    let name: String
    let year: Int
    let releaseDate: MovieDate
    let duration: Int
    let rating: Double
    let summary: String
    let imageUrl: String
    let categories: [MovieCategoryDataModel]
    let crewMembers: [MovieCrewMemberDataModel]
    let tags: [MovieTagDataModel]

}

struct MovieDate: Decodable {

    let day: Int
    let month: Int
    let year: Int

}

struct MovieCrewMemberDataModel: Decodable {
    
    let name: String
    let role: String

}

enum MovieCategoryDataModel: String, Decodable {

    case action = "ACTION"
    case adventure = "ADVENTURE"
    case comedy = "COMEDY"
    case crime = "CRIME"
    case drama = "DRAMA"
    case fantasy = "FANTASY"
    case romance = "ROMANCE"
    case scienceFiction = "SCIENCE_FICTION"
    case thriller = "THRILLER"
    case western = "WESTERN"

}

enum MovieTagDataModel: String, Decodable {

    case streaming = "STREAMING"
    case onTv = "ON_TV"
    case forRent = "FOR_RENT"
    case inTheaters = "IN_THEATERS"
    case movie = "MOVIE"
    case tvShow = "TV_SHOW"
    case trendingToday = "TRENDING_TODAY"
    case trendingThisWeek = "TRENDING_THIS_WEEK"

}
