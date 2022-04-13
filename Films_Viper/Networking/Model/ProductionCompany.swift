//
//  ProductionCompany.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

struct ProductionCompany: Codable {
    let id: Int
    let logoPath: String?
    let name, originCountry: String

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}
