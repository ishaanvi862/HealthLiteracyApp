//
//  tabFour.swift
//  TabBar
//
//  Created by DPI Student 136 on 7/7/25.
//

import SwiftUI

struct Community: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello!")
                    .fontWeight(.bold)
                Text("Please allow location services or enter your zip code so we can connect you with the closest resources.") .padding()
                
                NavigationLink(destination: CommunityView()) {
                    
                    Text("Allow Location")
                        .padding()
                        .frame(width: 120)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding()
                
                TextField("Enter Zip Code", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .frame(width: 120, alignment: .center)
                
                NavigationLink(destination: CommunityView()) {
                    
                }

            }
        }
    }
}

struct CommunityView: View {
    var body: some View {
        
        Text("Resources Near You:")
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
                        + Text("\nLocation: 566 W Adams St #100")
                        + Text("\nDescription")
                    
                }
                .padding()
                
                HStack{
                    Image("USHealth3")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .cornerRadius(12)
                    Text("Event Name Here")
                }
                .padding()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            NavigationLink(destination: MapView()) {
                Text("Open Map")
            }
        }
    }
}


#Preview {
    Community()
}
