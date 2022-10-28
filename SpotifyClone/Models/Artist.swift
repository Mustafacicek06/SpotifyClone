//
//  Artist.swift
//  SpotifyClone
//
//  Created by Mustafa Çiçek on 11.09.2022.
//

import Foundation


struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let images: [SpotifyImage]?
    let external_urls: [String: String]
    
}
