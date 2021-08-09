//
//  ContentView.swift
//  OnlineWeatherForecast
//
//  Created by Abdussamed on 6.08.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var contentViewModel = ContentViewModel()
    
    @State var cityName = ""
    
    var body: some View {
        
        ScrollView{
            
            VStack{
                
                VStack{
                    
                    TextField("Please enter a city", text: $cityName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    Button(action: {
                        contentViewModel.getData(search: cityName)
                    },
                    label: {
                        Text("Search")
                            .padding(.vertical)
                    })
  
                }.frame(width: UIScreen.main.bounds.width * 0.9,
                        alignment: .center)
                
                VStack{
                    
                    if let coordinate = contentViewModel.weather?.placeLocation{
                        MapView(locationCoordinate: coordinate)
                            .frame(width: UIScreen.main.bounds.width,
                                   height: UIScreen.main.bounds.height * 0.3,
                                   alignment: .top)
                    }
                    
                    VStack{
                        
                        CustomImageView(url: contentViewModel.weather?.weatherIcon ?? "").padding()
                        
                        Text(contentViewModel.weather?.weatherDescription ?? "")
                            .foregroundColor(Color("customBlue"))
                            .multilineTextAlignment(.center)
                        
                        Text(contentViewModel.weather?.temparature ?? "")
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Text(contentViewModel.weather?.country ?? "Please enter a city")
                            .bold()
                            .multilineTextAlignment(.center)
                        
                        Text(contentViewModel.weather?.localTime ?? "")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                        
                    }.offset(y: UIScreen.main.bounds.height * -0.1)
                    .padding(.bottom, UIScreen.main.bounds.height * -0.1)
                    
                }.frame(width: UIScreen.main.bounds.width,
                        alignment: .center).padding(.bottom)
                
                VStack{
                    
                    HStack{
                        
                        VStack{
                            
                            VStack{
                                Text("Feels Like").font(.callout)
                                Text(contentViewModel.weather?.feelsLike ?? "-").font(.callout)
                            }.padding(.bottom)
                                
                            VStack{
                                Text("Wind Speed").font(.callout)
                                Text(contentViewModel.weather?.windSpeed ?? "-").font(.callout)
                            }.padding(.bottom)
       
                        }.frame(width: UIScreen.main.bounds.width * 0.4, alignment:.center).padding(.horizontal)
                        
                        VStack{
                            
                            VStack{
                                Text("Humidity").font(.callout)
                                Text(contentViewModel.weather?.humidity ?? "-").font(.callout)
                            }.padding(.bottom)
                                
                            VStack{
                                Text("Pressure").font(.callout)
                                Text(contentViewModel.weather?.pressure ?? "-").font(.callout)
                            }.padding(.bottom)

                        }.frame(width: UIScreen.main.bounds.width * 0.4, alignment:.center).padding(.horizontal)
                        
                    }
                    
                    VStack{
                        Text("Observation Time").font(.callout)
                        Text(contentViewModel.weather?.observationTime ?? "-").font(.callout)
                    }.padding()
                    
                }.frame(width: UIScreen.main.bounds.width,
                         alignment: .bottom)
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
