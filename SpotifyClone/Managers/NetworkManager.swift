//
//  ApiManager.swift
//  SpotifyClone
//
//  Created by Mustafa Çiçek on 11.09.2022.
//


// 5. video 17:33 dk
// 5. video 17:33 dk
// 5. video 17:33 dk
// 5. video 17:33 dk


import Foundation

struct NetworkUrl {
    static let baseAPIURL = "https://api.spotify.com/v1/"
}

enum NetworkPaths: String {
    case ME = "me"
    
}

enum NetworkError: Error {
    case failedToGetData
    
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
   
    
    public func getCurrentUserProfile(completion: @escaping (Result<UserProfile, Error>) -> Void){
        createRequest(with: URL(string: NetworkUrl.baseAPIURL+NetworkPaths.ME.rawValue), type: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(NetworkError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    print(result)
                }
                catch {
                    completion(.failure(NetworkError.failedToGetData))
                }
            }
            task.resume()
        }
        
    }
    // MARK: - Private
    
    enum HTTPMethod: String {
        case GET
        case POST
    }
    
    private func createRequest(with url: URL?,type: HTTPMethod ,completion: @escaping (URLRequest) -> Void )  {
        AuthManager.shared.withValidToken { token in
            guard let apiURL = url else {
                return
            }
            var request = URLRequest(url: apiURL )
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            request.httpMethod = type.rawValue
            request.timeoutInterval = 30
            completion(request)
        }
  
        
    }
}
