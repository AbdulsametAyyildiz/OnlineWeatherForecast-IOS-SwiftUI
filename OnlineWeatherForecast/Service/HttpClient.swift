//
//  HttpClient.swift
//  OnlineWeatherForecast
//
//  Created by Abdussamed on 7.08.2021.
//

import Foundation

struct HttpClient {
    
    func downloadData(search: String, completion: @escaping (Result<Weather, DownloadError>) -> () ) {
      
        guard let url = URL(string: "http://api.weatherstack.com/current?access_key=426eef60bac9278362f5d4349d336bfd&query=\(search)") else {
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.dataError))
            }
            
            guard let dataResponse = try? JSONDecoder().decode(Weather.self, from: data) else{
                return completion(.failure(.dataNotProcessed))
            }
            
            completion(.success(dataResponse))
        }.resume()
        
    }
}

enum DownloadError: Error {
    case wrongUrl
    case dataError
    case dataNotProcessed
}
