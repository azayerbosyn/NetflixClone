//
//  APICaller.swift
//  NetflixClone
//
//  Created by Azamat Yerbossyn on 07.04.2023.
//

import Foundation


struct Constants {
    static let API_KEY = "4199efa3d1d6c88ca345780f4743b043"
    
    static let baseURL = "https://api.themoviedb.org"
    
    
    //https://api.themoviedb.org/3/trending/all/day?api_key=<<api_key>>
}

enum APIError: Error{
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(complition: @escaping (Result<[Title], Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                //                let results = try JSONSerialization.jsonObject(with: data, options:  .fragmentsAllowed)
                
                let results =  try JSONDecoder().decode(TrandingTitleResponse.self, from: data)
                complition(.success(results.results))
                //                print(results.results[0].original_title)
                
            } catch{
                complition(.failure(error))
            }
            
        }
        
        task.resume()
        
    }
    
    
    
    func getTrandingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                //                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let results = try JSONDecoder().decode(TrandingTitleResponse.self, from: data)
                print(results)
            }
            catch{
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrandingTitleResponse.self, from: data)
                print(results)
            } catch{
                print(error.localizedDescription)
            }
            
            
            
        }
        task.resume()
        
        
    }
    
    
    
    func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrandingTitleResponse.self, from: data)
                print(results)
            } catch{
                print(error.localizedDescription)
            }
            
            
            
        }
        task.resume()
        
        
    }
    
    
    func getTopRatesMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrandingTitleResponse.self, from: data)
                print(results)
            } catch{
                print(error.localizedDescription)
            }
            
            
            
        }
        task.resume()
        
        
    }
    
    
}






