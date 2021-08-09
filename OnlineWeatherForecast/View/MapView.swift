//
//  MKMap.swift
//  OnlineWeatherForecast
//
//  Created by Abdussamed on 9.08.2021.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable{
    
    var locationCoordinate: CLLocationCoordinate2D
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(MKCoordinateRegion(center: locationCoordinate,
                                                 span: MKCoordinateSpan(
                                                    latitudeDelta: 0.5,
                                                    longitudeDelta: 0.5)),animated: true)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    
}

/*struct MKMap_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}*/
