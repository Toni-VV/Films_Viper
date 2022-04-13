//
//  SpokenLanguage.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

struct SpokenLanguage: Codable {
    let englishName, iso639_1, name: String

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
}
