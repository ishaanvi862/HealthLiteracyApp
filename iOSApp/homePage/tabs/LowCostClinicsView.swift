//
//  LowCostClinicsView.swift
//  iOSApp
//
//  Created by DPI Student 130 on 7/16/25.
//

import SwiftUICore
import SwiftUI

struct LowCostClinicsView: View {
    let background = Color(hex: "#F8F4F0")  // soft sand
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Suggested Low-Cost Clinics")
                .font(.headline)

            ClinicView(name: "Community Health Center", address: "123 Main St, Anytown, USA", description: "Offers sliding scale fees based on income. Comprehensive primary care services.")
            ClinicView(name: "Wellness Corner Clinic", address: "456 Oak Ave, Anytown, USA", description: "Specializes in preventive care and mental wellness programs. Accepts various insurances.")
        }
    }
}

struct ClinicView: View {
    let name: String
    let address: String
    let description: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(name)
                .bold()
            Text(address)
                .font(.caption)
            Text(description)
                .font(.caption)
                .foregroundColor(.gray)
            Button("View Details") {
                // Add navigation if needed
            }
            .padding(.vertical, 5)
            .padding(.horizontal)
            .background(Color.green.opacity(0.2))
            .cornerRadius(8)
        }
        .padding(8)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}
