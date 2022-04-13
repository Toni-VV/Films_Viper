//
//  MoviesPageResponse2.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

struct MoviesPageResponse: Codable {
    let page: Int
    let results: [MovieResponse]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
