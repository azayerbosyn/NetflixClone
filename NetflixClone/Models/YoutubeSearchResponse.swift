//
//  YoutubeSearchResponse.swift
//  NetflixClone
//
//  Created by Azamat Yerbossyn on 17.04.2023.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}


struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
