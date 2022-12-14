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
    case NEW_RELEASES = "browse/new-releases?limit=1"
    
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
                    let result = try JSONDecoder().decode(UserProfile.self, from: data)
                    print(result)
                }
                catch {
                    print(error.localizedDescription)
                    completion(.failure(NetworkError.failedToGetData))
                }
            }
            task.resume()
        }
        
    }
    // MARK: - Public Functions
    
    public func getNewReleases(completion: @escaping((Result<String, Error>))-> Void) {
        createRequest(with: URL(string: NetworkUrl.baseAPIURL + NetworkPaths.NEW_RELEASES.rawValue ), type: HTTPMethod.GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _ ,  error in
                guard let data = data, error == nil else {
                    completion(.failure(NetworkError.failedToGetData))
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options:  .allowFragments)
                    print(json)
                } catch {
                    print(String(describing: error))
                    completion(.failure(error))
                }
                
            }
            task.resume()
        }
    }
   
    
    enum HTTPMethod: String {
        case GET
        case POST
    }
    // MARK: - Private
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
