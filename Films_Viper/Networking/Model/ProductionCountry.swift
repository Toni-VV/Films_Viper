//
//  ProductionCountry.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

struct ProductionCountry: Codable {
    let iso3166_1, name: String

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
}
