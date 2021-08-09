//
//  CustomImageView.swift
//  OnlineWeatherForecast
//
//  Created by Abdussamed on 8.08.2021.
//

import SwiftUI

struct CustomImageView: View {
    
    @ObservedObject var downloadImageClient = DownloadImageClient()
    
    init(url: String) {
        self.downloadImageClient.downloadImage(url: url)
    }
    
    var body: some View {
        if let imgData = self.downloadImageClient.downloadedImage {
            Image(uiImage: (UIImage(data: imgData) ?? UIImage(named: "gece")!))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width * 0.24,
                       height: UIScreen.main.bounds.height * 0.11,
                       alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white,lineWidth: 4))
                .shadow(radius: 20)
        }
        
    }
}

/*struct CustomImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageView()
    }
}*/
