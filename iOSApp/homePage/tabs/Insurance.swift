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
                    InsuranceCardScanner()
                    DecodedBenefitsView()
                    LowCostClinicsView()
                    NavigationLink(destination: HealthEquityRightsView()) {
                        Text("Learn About Your Health Equity Rights")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .navigationTitle("Decode Insurance")
        }
    }
}

#Preview {
    home()
}
