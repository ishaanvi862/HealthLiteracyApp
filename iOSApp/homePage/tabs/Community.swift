//
//  tabFour.swift
//  TabBar
//
//  Created by DPI Student 136 on 7/7/25.
//

import SwiftUI
import MapKit

struct Community: View {
    var body: some View {
        NavigationStack {
        
            ZStack {
                Image(systemName: "location")
                    .resizable()
                    .foregroundColor(Color.black)
                    .frame(width: 300, height: 300)
                    .opacity(0.05)
                VStack {
                    Text("Hello!")
                        .fontWeight(.bold)
                    Text("Please allow location services so we can find you the closest resources.") .padding()
                    
                    NavigationLink(destination: CommunityView()) {
                        Text("Allow Location")
                            .padding()
                            .frame(width: 120)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding()
                }
            }
        }
    }
}

struct CommunityView: View {
    //stores the center location of the map (users location @ 565 Adams St)
    let centerCoordinate = CLLocationCoordinate2D(latitude: 41.8795, longitude: -87.6417)
    
    //code for an array of map pins/annotations (the local health reasources)
    let pins: [MKPointAnnotation] = {
            let pin1 = MKPointAnnotation()
            pin1.coordinate = CLLocationCoordinate2D(latitude: 41.8796, longitude: -87.6418)
            pin1.title = "USHealth Advisors Chicago"
            pin1.subtitle = "566 W Adams St #100"
            
            let pin2 = MKPointAnnotation()
            pin2.coordinate = CLLocationCoordinate2D(latitude: 41.8805, longitude: -87.6495)
            pin2.title = "Midwest Express Clinic - Urgent Care"
            pin2.subtitle = "779 W Adams St"

            return [pin1, pin2]
        }()

    var body: some View {
        
        Text("Resources Near You:")
            .font(.title3)
            .bold()
            .padding()
            
        ScrollView {
            VStack(alignment: .leading) {
                HStack{
                    Image("USHealth3")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .cornerRadius(12)
                    Text("USHealth Advisors Chicago").bold()
                    + Text("\n566 W Adams St #100")
                    + Text("\nHours: 8AM-8PM")
                    Spacer()
                    NavigationLink(destination: USHealthView()) {
                        Text("?")
                    }
        
                    
                }
                .padding()
                
                HStack{
                    Image("urgentcare")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .cornerRadius(12)
                    Text("Midwest Express Clinic - Urgent Care").bold()
                    + Text("\n779 W Adams St")
                    + Text("\nHours: 8AM-8PM")
                    Spacer()
                    NavigationLink(destination: UrgentCareView()) {
                        Text("?")
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        
        }
        Spacer()
        NavigationLink(destination: MapView(centerCoordinate: centerCoordinate, annotationPoints: pins).edgesIgnoringSafeArea(.all)) {
            Text("Open Map")
        }
    }
}

struct USHealthView: View {
    var body: some View {
        Text("What is USHealth Advisors?")
        Spacer()
    }
}

struct UrgentCareView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("What is Urgent Care?")
            Spacer()
        }
    }
}


#Preview {
    Community()
}
