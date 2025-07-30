//
//  MapView.swift
//  iOSApp
//
//  Created by DPI Student 133 on 7/16/25.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let centerCoordinate: CLLocationCoordinate2D //stores user location
    let annotationPoints: [MKPointAnnotation] //array of map pins
    
    //Note: in future, find way to make map dynamic rather than constant
    
    //creates and returns a map view
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        let region = MKCoordinateRegion(
            center: centerCoordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
        mapView.setRegion(region, animated: false)
        
        mapView.addAnnotations(annotationPoints)

        
        return mapView
        
        
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        //update map view here, if needed
        
    }
}

#Preview {
    PreviewWrapper()
}

struct PreviewWrapper: View {
    var body: some View {
        let center = CLLocationCoordinate2D(latitude: 41.8795, longitude: -87.6417)

        let pin1 = MKPointAnnotation()
        pin1.coordinate = CLLocationCoordinate2D(latitude: 41.8796, longitude: -87.6418)
        pin1.title = "USHealth Advisors"
        pin1.subtitle = "566 W Adams St"

        let pin2 = MKPointAnnotation()
        pin2.coordinate = CLLocationCoordinate2D(latitude: 41.8805, longitude: -87.6495)
        pin2.title = "Midwest Express Clinic"
        pin2.subtitle = "779 W Adams St"

        return MapView(centerCoordinate: center, annotationPoints: [pin1, pin2])
            .edgesIgnoringSafeArea(.all)
    }
}

