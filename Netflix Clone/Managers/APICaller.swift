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
    
    func getTopMovies(completion: @escaping (Result<[Title], Error>) -> ()) {
        guard let url = URL(string: "\(Constants.baseURL)/en/API/Top250Movies/\(Constants.API_Key)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let items = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(items.items))
                
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
 
    }
    
    func getTopTV(completion: @escaping (Result<[Title], Error>) -> ()) {
        guard let url = URL(string: "\(Constants.baseURL)/en/API/Top250TVs/\(Constants.API_Key)") else {return}

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let items = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(items.items))
                
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
 
    }
    
    func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> ()) {
        guard let url = URL(string: "\(Constants.baseURL)/en/API/MostPopularMovies/\(Constants.API_Key)") else {return}

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let items = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(items.items))
                
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
 
    }
    
    func getUpcoming(completion: @escaping (Result<[Title], Error>) -> ()) {
        guard let url = URL(string: "\(Constants.baseURL)/en/API/ComingSoon/\(Constants.API_Key)") else {return}

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let items = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(items.items))
                
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
 
    }
    
    func getInTheaters(completion: @escaping (Result<[Title], Error>) -> ()) {
        guard let url = URL(string: "\(Constants.baseURL)/en/API/InTheaters/\(Constants.API_Key)") else {return}

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let items = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(items.items))
                
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
 
    }
}
