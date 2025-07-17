//
//  HealthEquityRightsView.swift
//  iOSApp
//
//  Created by DPI Student 130 on 7/16/25.
//

import SwiftUI

struct HealthEquityRightsView: View {
    let background = Color(hex: "#F8F4F0")  // soft sand
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Understanding Your Health Equity Rights")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                EquitySection(title: "Free Preventive Screenings", description: "You are eligible for free preventive services like mammograms and colonoscopies under the Affordable Care Act, regardless of your insurance plan.", buttonTitle: "Find Screening Centers")
                
                EquitySection(title: "Parity for Mental Health Care", description: "Mental health and substance use disorder benefits must be covered at parity with medical and surgical benefits. No higher co-pays or stricter limits.", buttonTitle: "Mental Health Resources")
                
                EquitySection(title: "Emergency Care Protections", description: "Your insurance cannot deny payment for emergency care services received outside your network if it was a true emergency.", buttonTitle: "Understand Emergency Coverage")
                
                EquitySection(title: "Non-Discrimination in Healthcare", description: "It is illegal for healthcare providers or insurers to discriminate based on race, color, national origin, sex, age, or disability.", buttonTitle: "Report Discrimination")
                
                let takeaways = [
                    "Always ask your provider about available free preventive services.",
                    "If you suspect discrimination, keep detailed records and seek advocacy.",
                    "Understand your emergency care rights before you need them.",
                    "Mental health is just as important as physical health; demand equal treatment.",
                    "Access to care should be based on need, not ability to pay or background."
                ]

                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Important Takeaways")
                        .font(.headline)
                    ForEach(takeaways, id: \.self) { takeaway in
                        HStack(alignment: .top) {
                            Text("•")
                            Text(takeaway)
                        }
                        .font(.subheadline)
                    }
                }
                .padding(.bottom)
            }
            .padding()
        }
        
        
            }
    
    struct EquitySection: View {
        let title: String
        let description: String
        let buttonTitle: String
        
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text(title).font(.headline)
                Text(description).font(.subheadline)
                Button(buttonTitle) {
                    // action
                }
                .font(.footnote)
                .padding(6)
                .background(Color.blue.opacity(0.2))
                .cornerRadius(6)
            }
            .padding()
            .background(Color.green.opacity(0.05))
            .cornerRadius(10)
        }
    }
}
