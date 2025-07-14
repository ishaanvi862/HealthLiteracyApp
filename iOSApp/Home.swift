//
//  home.swift
//  iOSApp
//
//  Created by DPI Student 136 on 7/10/25.
//

import Foundation
import SwiftUI

struct home: View {
    var body: some View {
        TabView{
            Profile()
                .padding()
                .tabItem{
                    Image(systemName: "person")
                    Text("Profile")
                }
            Insurance()
                .tabItem{
                    Image(systemName: "shield")
                    Text("Insurance")
                }
            ChamiAI()
                .tabItem{
                    Image(systemName: "stopwatch")
                    Text("Chami AI")
                }
            Community()
                .tabItem{
                Image(systemName: "house")
                Text("Community")
            }
        }
    }
}

#Preview {
    home()
}
