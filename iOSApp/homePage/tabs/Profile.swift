//
//  tabOne.swift
//  TabBar
//
//  Created by DPI Student 136 on 7/7/25.
//

import SwiftUI

struct Profile: View {
    let background = Color(hex: "#F8F4F0")  // soft sand
    
    var body: some View {
        NavigationView {
            ZStack {
                background
                    .ignoresSafeArea(edges: .all)
                                
                VStack {
                    Text("Welcome!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "332D56"))
                        .padding(.bottom, 20)
                    
                    
                    Image("pfp")
                        .resizable()
                        .scaledToFill()
                        .padding()
                        .frame(width: 230.0, height: 200)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 5)
                        }
                        .shadow(radius: 8)
                    
                    
                    Text("Username123")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    VStack {
                        Text("Joined 3 weeks ago")
                            .font(.subheadline)
                            .fontWeight(.light)
                        Text("Insured with United Health")
                            .font(.subheadline)
                            .fontWeight(.light)
                        Text("Southside of Chicago, IL")
                            .font(.subheadline)
                            .fontWeight(.light)
                    }
                    
                    NavigationLink( destination: CalendarView()) {
                        Text("My Calender")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(hex: "#A188A6"))
                            .cornerRadius(12)
                    }
                }
            }
        }
    }
}


#Preview {
    Profile()
}
