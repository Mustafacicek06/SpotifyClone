//
//  UserProfile.swift
//  SpotifyClone
//
//  Created by Mustafa Çiçek on 11.09.2022.
//

import Foundation


struct UserProfile: Decodable {
    let country: String
    let displayName: String
    let email: String
    let explicitContent: [String: Bool]
    let externalUrls: [String: String]
    let id: String
    let product: String
    let images: [SpotifyImage]
    
    enum CodingKeys: String, CodingKey {
        case country
        case displayName = "display_name"
        case email
        case explicitContent = "explicit_content"
        case externalUrls = "external_urls"
        case id
        case product
        case images
    }
    
  
}


struct SpotifyImage: Decodable {
    let url: String
}
