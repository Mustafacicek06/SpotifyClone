//
//  AuthResponse.swift
//  SpotifyClone
//
//  Created by Mustafa Çiçek on 11.09.2022.
//

import Foundation


struct AuthResponse: Decodable {
    let accessToken: String?
    let expiresInSecond: Int?
    let refreshToken: String?
    let scope: String?
    let tokenType: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiresInSecond = "expires_in"
        case refreshToken = "refresh_token"
        case scope = "scope"
        case tokenType = "token_type"
    }
    
}
