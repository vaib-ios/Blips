
import Foundation

var allMedia = (1...15).compactMap {
    Media(title: "Title", thumbnail: "img\($0)")
}

struct Media: Identifiable, Hashable {
    var id = UUID()
    var title: String?
    var category: Category?
    var thumbnail: String?
    var summaryTitle: String?
    var mediaSummary: String?
    var castMembers: [Cast]?
    var genres: [String]?
    var rating: String?
    var isLiked: Bool = false
    var addToWatchlist: Bool = false
    var duration: String?
    var streamlink: String?
    var watchedTillTime: Int?
}

struct Cast: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var thumbnail: String
}

enum Genres: Equatable {
    
}

enum Category: Equatable {
    case movies
    case tvShows
    case webSeries
    case documentary
    case liveTv
    case shortFilm
    case unknown
}
