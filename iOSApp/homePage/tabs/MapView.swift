//
//  MapView.swift
//  iOSApp
//
//  Created by DPI Student 133 on 7/16/25.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    func updateUIView(_ view: MKMapView, context: Context) {
        //update your map view here, if needed
    }
}

#Preview {
    MapView()
}
