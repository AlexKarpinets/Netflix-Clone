//
//  Movie.swift
//  Netflix Clone
//
//  Created by Karpinets Alexander on 02.11.2022.
//

import Foundation

struct TopMoviesResponse: Codable {
    let items: [Movie]
}

struct Movie: Codable {
    let crew: String?
    let fullTitle: String?
    let id: String?
    let imDbRating: String?
    let imDbRatingCount: String?
    let image: String?
    let rank: String?
    let title: String?
    let year: String?
}





