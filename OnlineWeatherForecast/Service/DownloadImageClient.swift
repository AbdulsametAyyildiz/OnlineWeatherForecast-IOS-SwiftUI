//
//  DownloadImageClient.swift
//  OnlineWeatherForecast
//
//  Created by Abdussamed on 8.08.2021.
//

import Foundation
import SwiftUI

class DownloadImageClient: ObservableObject{
    
    @Published var downloadedImage: Data?
    
    func downloadImage(url: String)
    {
        guard let imgUrl = URL(string: url) else{
            return
        }
        
        URLSession.shared.dataTask(with: imgUrl) { data, response, error in
            guard let data = data, error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedImage = data
            }
            
        }.resume()
    }
    
}
