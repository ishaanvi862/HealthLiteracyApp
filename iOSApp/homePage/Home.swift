//
//  home.swift
//  iOSApp
//
//  Created by DPI Student 136 on 7/10/25.
//

import Foundation
import SwiftUI
let background = Color(hex: "#F8F4F0")  // soft sand
let Chamara = Color(hex: "#71C0BB")
struct home: View {
    var body: some View {
        
        TabView{
            Insurance()
                .background(Color(hex: "#F8F4F0"))
                .tabItem{
                    Image(systemName: "shield")
                    Text("Insurance")
                }
                .toolbarBackgroundVisibility(.visible, for: .tabBar)
                .toolbarBackground(Color(hex: "332D56"), for: .tabBar)
            Community()
                .background(Color(hex: "#F8F4F0"))
                .tabItem{
                    Image(systemName: "person.3.fill")
                    Text("Community")
                }
                .toolbarBackgroundVisibility(.visible, for: .tabBar)
                .toolbarBackground(Color(hex: "332D56"), for: .tabBar)
            ChamiAI()
                .background(Color(hex: "#F8F4F0"))
                .tabItem{
                    Image(systemName: "wand.and.sparkles")
                    Text("Insure AI")
                }
                .toolbarBackgroundVisibility(.visible, for: .tabBar)
                .toolbarBackground(Color(hex: "332D56"), for: .tabBar)
            Profile()
                .padding()
                .background(Color(hex: "#F8F4F0"))                .tabItem{
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
                .toolbarBackgroundVisibility(.visible, for: .tabBar)
                .toolbarBackground(Color(hex: "332D56"), for: .tabBar)
            

        }
        .tint(Chamara)
    }
}

#Preview {
    home()
}
