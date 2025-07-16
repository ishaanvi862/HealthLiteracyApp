//
//  tabOne.swift
//  TabBar
//
//  Created by DPI Student 136 on 7/7/25.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        
        VStack {
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
            
            
            Text("Exploding Cat")
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
            
            NavigationView(){
                NavigationLink( destination: CalendarView()) {
                    Text("My Calender")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(red: 113/255, green: 192/255, blue: 187/255))
                        .cornerRadius(12)
                }
            }
        }
    }
}

#Preview {
    Profile()
}
