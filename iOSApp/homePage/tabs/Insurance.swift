//
//  tabTwo.swift
//  TabBar
//
//  Created by DPI Student 136 on 7/7/25.
//

import SwiftUI

struct Insurance: View {
    let background = Color(hex: "#F8F4F0")  // soft sand

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // Logo and "decode insurance" subtitle
                    VStack(alignment: .leading, spacing: 12) {
                        Image("insurelitlogo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 80) // ⬅️ Larger logo

                        Text("Decode Insurance")
                            .font(.title2)       // ⬅️ Bigger font
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .padding(.leading, 4) // ⬅️ Slight left indent
                    }
                    .frame(maxWidth: .infinity, alignment: .leading) // Push left
                    .padding(.top, 10) // ⬅️ Push down from nav bar

                    InsuranceCardScanner()
                    DecodedBenefitsView()
                    LowCostClinicsView()

                    NavigationLink(destination: HealthEquityRightsView()) {
                        Text("Learn About Your Health Equity Rights")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#71C0BB"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline) // optional: hides large nav title
            .background(background.ignoresSafeArea())
        }
    }
}



#Preview {
    home()
}
