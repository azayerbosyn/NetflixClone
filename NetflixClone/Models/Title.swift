//
//  Movie.swift
//  NetflixClone
//
//  Created by Azamat Yerbossyn on 10.04.2023.
//

import Foundation

struct TrandingTitleResponse: Codable {
    let results: [Title]
}


struct Title: Codable {
    
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_data: String?
    let vote_average: Double
    
}
