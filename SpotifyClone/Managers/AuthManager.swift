//
//  AuthManager.swift
//  SpotifyClone
//
//  Created by Mustafa Çiçek on 11.09.2022.
//

import Foundation


final class AuthManager {
    static let shared = AuthManager()
    
    struct SpotifyConstants {
        static let clientID = "23a4e58662f94f4681e683c81dcde738"
        static let secretClientID = "49ee5c96aa8449339db1a127c0e9e8ca"
    }
    
    private init() {}
    
    public var singInUrl: URL? =  {
        let scopes = "user-read-private"
        let baseUrL = "https://accounts.spotify.com/"
        let redirectURI = "https://open.spotify.com/"
        let path = "\(baseUrL)authorize?response_type=code&client_id=\(SpotifyConstants.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        
        
        return URL(string: path)
    }()
    
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
    
    public func exchangeCodeForToken(
        code: String,
        completion: @escaping ((Bool) -> Void)
    
    ) {
        
    }
    
    public func refreshAccessToken() {
        
    }
    
    private func cacheToken() {
        
    }
    
}
