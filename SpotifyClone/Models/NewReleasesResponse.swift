//
//  NewReleasesResponse.swift
//  SpotifyClone
//
//  Created by Mustafa Çiçek on 29.10.2022.
//

import Foundation

struct NewReleasesResponse: Codable {
    let albums: AlbumsResponse
}

struct AlbumsResponse: Codable {
    let items: [Album]
}

struct Album: Codable {
    let album_type: String
    let available_markets: [String]
    let id: String
    var images: [SpotifyImage]
    let name: String
    let release_date: String
    let total_tracks: Int
    let artists: [Artist]
}
