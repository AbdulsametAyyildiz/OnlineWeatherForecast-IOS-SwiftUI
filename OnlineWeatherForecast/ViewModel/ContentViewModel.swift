//
//  ContentViewModel.swift
//  OnlineWeatherForecast
//
//  Created by Abdussamed on 6.08.2021.
//

import Foundation
import SwiftUI
import MapKit

class ContentViewModel: ObservableObject{
    @Published var weather: WeatherViewModel?
    @Published var error: Error?
    let httpClient = HttpClient()
}

extension ContentViewModel{
    
    func getData(search: String){
        
        httpClient.downloadData(search: nomalizeString(string: search)) { (response) in
            switch response {
            case .success(let data):
                DispatchQueue.main.async {
                    self.weather = WeatherViewModel(weather: data)
                    print(self.weather!.country)
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.error = error
                }
            }
        }
    }
    
    private func nomalizeString(string: String) -> String{
        let mutableString = NSMutableString(string: string) as CFMutableString
        CFStringTransform(mutableString, nil, kCFStringTransformStripCombiningMarks,false)
        let normalized = (mutableString as NSMutableString).copy() as! NSString
        return normalized.replacingOccurrences(of: " ", with: "%20")
    }
    
}

struct WeatherViewModel {
    
    let weather: Weather
    
    var country: String{
        weather.request.query
    }
    
    var placeLocation : CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: Double(weather.location.lat)!, longitude: Double(weather.location.lon)!)
    }
    
    var localTime: String{
        weather.location.localtime
    }
    
    var observationTime: String{
        weather.current.observationTime
    }
    
    var temparature: String{
        "\(weather.current.temperature) °C"
    }
    
    var weatherIcon: String{
        weather.current.weatherIcons[0]
    }
    
    var weatherDescription: String{
        weather.current.weatherDescriptions[0]
    }
    
    var windSpeed: String{
        "\(weather.current.windSpeed)km/s"
    }
    
    var pressure: String{
        "\(weather.current.pressure)mbar"
    }
    
    var humidity: String{
        "%\(weather.current.humidity)"
    }
    
    var feelsLike: String{
        "\(weather.current.feelslike) °C"
    }
    
}
