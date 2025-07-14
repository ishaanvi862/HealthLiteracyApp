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
            
            Button("My Calender") {
                
            }
            .padding()
            .background(Color(red: 0.579, green: 0.758, blue: 0.509))
            .cornerRadius(10)
        }
        
    }
}

#Preview {
    Profile()
}
