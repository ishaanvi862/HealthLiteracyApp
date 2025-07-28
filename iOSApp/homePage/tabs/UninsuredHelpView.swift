//
//  UninsuredHelpView.swift
//  iOSApp
//
//  Created by DPI Student 130 on 7/27/25.
//

import SwiftUI

struct UninsuredHelpView: View {
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Uninsured Care Options")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "#71C0BB"))
                    .padding(.bottom, 10)

                GroupBox(label: Label("Emergency Care", systemImage: "exclamationmark.triangle")) {
                    Text("Hospitals must treat you in emergencies under EMTALA — even without insurance. You may still get billed.")
                        .padding(4)
                }

                GroupBox(label: Label("Free / Low-Cost Clinics", systemImage: "stethoscope")) {
                    Text("Find local clinics that offer checkups, vaccines, STD testing, and more — even if you can’t pay.").padding(4)
                    Button("Search Clinics Near Me") {
                        // Implement location-based search (e.g., Google Places API)
                    }
                    .foregroundColor(.green)
                }

                GroupBox(label: Label("Medicaid / CHIP", systemImage: "doc.plaintext")) {
                    Text("You may qualify for free state insurance. Tap below to check and apply.").padding(4)
                    Link("See if You Qualify", destination: URL(string: "https://www.healthcare.gov/medicaid-chip/eligibility/")!)
                        .foregroundColor(.green)
                }

                GroupBox(label: Label("Discount Prescriptions", systemImage: "pills")) {
                    Text("Some pharmacies and drug companies offer discount programs.").padding(4)
                    Link("Try GoodRx", destination: URL(string: "https://www.goodrx.com")!)
                        .foregroundColor(.green)
                }

                GroupBox(label: Label("Marketplace Plans", systemImage: "creditcard")) {
                    Text("During open enrollment or after job loss, you may qualify for cheap plans at HealthCare.gov").padding(4)
                    Link("Visit HealthCare.gov", destination: URL(string: "https://www.healthcare.gov")!)
                        .foregroundColor(.green)
                }
            }
            .padding()
        }
        .navigationTitle("No Insurance? Here's Help")
    }
}

