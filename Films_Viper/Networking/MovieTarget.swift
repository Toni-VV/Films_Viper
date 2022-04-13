//
//  MovieTarget.swift
//  Films_Viper
//
//  Created by Антон Волков on 13.04.2022.
//

import Foundation
import Moya

enum MovieTarget {
    case popularMovie(page: Int)
    case topRatedMovie(page: Int)
    case movieDetailInfo(movieId: Int)
}

extension MovieTarget: TargetType {
    
    var apiKey: String {
        "3707d5542daf3c8ccf5e7078afc3821e"
    }
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/") else {
            fatalError()
        }
        return url
    }
    
    var path: String {
        switch self {
        case .popularMovie:
            return "popular"
        case .topRatedMovie:
            return "top_rated"
        case let .movieDetailInfo(movieId):
            return "\(movieId)"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        switch self {
        case let .popularMovie(page), let .topRatedMovie(page):
            return .requestParameters(
                parameters: ["api_key": apiKey, "page": page],
                encoding: URLEncoding.queryString)
        case .movieDetailInfo:
            return .requestParameters(
                parameters: ["api_key": apiKey],
                encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
}
