//
//  NetworkManager.swift
//  MovieApp
//
//  Created by mahmoud yousef on 08/01/2023.
//

import Foundation

class NetworkManager{
    
    static let shared = NetworkManager()
    private init(){}
    
    func getTrendingMovies( completed: @escaping(Result<TrendingMovie , ErrorMessage>) -> Void ){
        let endPoint = NetworkConstant.shared.baseURL + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let movies = try decoder.decode(TrendingMovie.self, from: data)
                completed(.success(movies))
                
            }catch{
                completed(.failure(.invalidData))
            }
            
        }).resume()
    }
    
}

