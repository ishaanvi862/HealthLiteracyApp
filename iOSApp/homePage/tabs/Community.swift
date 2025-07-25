//
//  tabFour.swift
//  TabBar
//
//  Created by DPI Student 136 on 7/7/25.
//

import SwiftUI
import MapKit

struct Community: View {
    let background = Color(hex: "#F8F4F0")  // soft sand

    
    var body: some View {
        NavigationStack {

            
            ZStack {
                background
                    .ignoresSafeArea(edges: .all)

                Image(systemName: "location")
                    .resizable()
                    .foregroundColor(Color.black)
                    .frame(width: 300, height: 300)
                    .opacity(0.05)
                VStack {
                    Text("Hello!")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundStyle(Color(hex: "332D56"))
                    
                    Text("Please allow us to use your location so we can find you the closest resources.") .padding()
                    
                    NavigationLink(destination: CommunityView()) {
                        Text("Allow Location")
                            .padding()
                            .frame(width: 120)
                            .background(Color(hex: "332D56"))
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
    let background = Color(hex: "#F8F4F0")  // soft sand

    
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
        ZStack {
            background
                .ignoresSafeArea(edges: .all)

            ScrollView {
                Text("Resources Near You")
                    .font(.title2)
                    .bold()
                    .padding()
                    .foregroundColor(Color(hex: "332D56"))
                    .navigationBarBackButtonHidden(true)

                VStack(alignment: .leading) {
                    HStack{
                        Image("USHealth3")
                            .resizable()
                            .frame(width: 140, height: 140)
                            .cornerRadius(12)
                            .padding(.trailing, 10)
                        Text("USHealth Advisors Chicago").bold()
                        + Text("\n𖡡 566 W Adams St")
                        + Text("\nHours: 8AM-8PM")
                        Spacer()
                        NavigationLink(destination: USHealthView()) {
                            Image(systemName: "questionmark.circle.fill")
                                .foregroundColor(Color(hex: "332D56"))
                                .font(.title2)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                            .shadow(color: Color.gray.opacity(0.2), radius: 6, x: 0, y: 4)
                            .padding()
                    )
                    
                    HStack{
                        Image("urgentcare")
                            .resizable()
                            .frame(width: 140, height: 140)
                            .cornerRadius(12)
                            .padding(.trailing, 10)
                        Text("Midwest Express Clinic - Urgent Care").bold()
                        + Text("\n𖡡 779 W Adams St")
                        + Text("\nHours: 8AM-8PM")
                        Spacer()
                        NavigationLink(destination: UrgentCareView()) {
                            Image(systemName: "questionmark.circle.fill")
                                .foregroundColor(Color(hex: "332D56"))
                                .font(.title2)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                            .shadow(color: Color.gray.opacity(0.2), radius: 6, x: 0, y: 4)
                            .padding()
                    )
                    
                    HStack {
                        Image("communityhealth")
                            .resizable()
                            .frame(width: 140, height: 140)
                            .cornerRadius(12)
                            .padding(.trailing, 10)
                        Text("CommunityHealth").bold()
                        + Text("\n𖡡 2611 W Chicago Ave")
                        + Text("\nHours: 8:30AM - 7:30PM (Today)")
                        
                        Spacer()
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundColor(Color(hex: "332D56"))
                            .font(.title2)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                            .shadow(color: Color.gray.opacity(0.2), radius: 6, x: 0, y: 4)
                            .padding()
                    )
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Upcoming Events Near You")
                    .font(.title2)
                    .bold()
                    .padding()
                    .foregroundColor(Color(hex: "332D56"))
                HStack{
                    Image("healthfair")
                        .resizable()
                        .frame(width: 140, height: 140)
                        .cornerRadius(12)
                        .padding(.trailing, 10)
                    Text("\n")
                    + Text("M.A.P. Your Health Chicago: Forum & Health Resource Fair").bold()
                    + Text("\n𖡡 Humboldt Park Health Wellness Center")
                    + Text("\nAugust 16, 10AM-3PM")
                    + Text("\n")

                    Spacer()
                    NavigationLink(destination: HealthFairView()) {
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundColor(Color(hex: "332D56"))
                            .font(.title2)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white)
                        .shadow(color: Color.gray.opacity(0.2), radius: 6, x: 0, y: 4)
                        .padding()
                )
            }
        }
        Spacer()
        NavigationLink(destination: MapView(centerCoordinate: centerCoordinate, annotationPoints: pins).edgesIgnoringSafeArea(.all)) {
            Text("Open Map")
                .padding()
                .foregroundStyle(Color(hex: "332D56"))
            
            
        }
    }
}

struct USHealthView: View {
    var body: some View {
        Text("Who is USHealth Advisors?")
        Spacer()
    }
}

struct UrgentCareView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Image("urgentcare2")
                    .resizable()
                    .frame(width: 360, height: 200)
                    .cornerRadius(12)
                
                Text("Midwest Express Clinic")
                    .font(.title2)
                    .bold()
                Text("779 W Adams St, Chicago IL")
                Text("Hours: 8AM-8PM M-F, 8AM-6PM weekends")
                
                Text("Google rating: 4.7★ from 1,200+ reviews")
                
                Text("Walk-in urgent care clinic offering services like flu and strep testing, minor injuries (cuts, sprains, fractures), immunizations, on-site labs and X‑rays. No appointment necessary, but online check‑in  available for shorter waits.")
                    .padding(.bottom, 30)
                
            Divider()
                
                Text("*What is Urgent Care?")
                    .font(.title2)
                    .bold()
                
                Text("Urgent care is a type of medical clinic you can go to when you need help quickly, but it’s not a life-threatening emergency. Appointments are not needed, and clinics are often open later then regular doctor's office hours (including weekends).")
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Urgent Care vs. Emergency Room")
                        .font(.title2)
                        .bold()
                    
                    HStack(alignment: .top, spacing: 16) {
                        // Urgent Care Box
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Urgent Care")
                                .font(.headline)
                            Text("• Minor cuts, sprains")
                            Text("• Cough, sore throat")
                            Text("• Stomach aches, mild vomitting")
                            Text("• Less expensive")
                            Text("• Faster visits")
                        }
                        .padding()
                        .background(Color.indigo.opacity(0.1))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                        
                        // ER Box
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Emergency Room")
                                .font(.headline)
                            Text("• Chest pain, trouble breathing")
                            Text("• Heavy bleeding")
                            Text("• Severe injuries")
                            Text("• Seizures")
                            Text("• Open 24/7")
                        }
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                    }
                }
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)

        }
    }
}

struct HealthFairView: View {
    var body: some View {
        Text("More About This Event:")
        Spacer()
    }
}

#Preview {
    Community()
}



