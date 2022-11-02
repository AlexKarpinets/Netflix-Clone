//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Karpinets Alexander on 02.11.2022.
//

import Foundation

struct Constants {
    static let API_Key = "k_lt9zi1xq"
    static let baseURL = "https://imdb-api.com"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTopMovies(completion: @escaping (Result<[Movie], Error>) -> ()) {
        guard let url = URL(string: "\(Constants.baseURL)/en/API/Top250Movies/\(Constants.API_Key)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let items = try JSONDecoder().decode(TopMoviesResponse.self, from: data)
                completion(.success(items.items))
                
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
 
    }
}
