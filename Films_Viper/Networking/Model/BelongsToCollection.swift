//
//  BelongsToCollection.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 28.03.2022.
//

struct BelongsToCollection: Codable {
    let id: Int?
    let name: String?
    let posterPath: String?
    let backdropPath: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}
