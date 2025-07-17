//
//  InsuranceCardScanner.swift
//  iOSApp
//
//  Created by DPI Student 130 on 7/16/25.
//

import SwiftUICore
import SwiftUI

struct InsuranceCardScanner: View {
    let background = Color(hex: "#F8F4F0")  // soft sand
    var body: some View {
        VStack(spacing: 12) {
            Image("scan-icon") // Upload scan icon from Noun Project
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.top)
            Text("Scan Your Insurance Card")
                .font(.headline)
            Text("Capture or upload your document to instantly decode coverage, deductibles, and more.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            Button(action: {
                // Implement scanner logic
            }) {
                Text("Scan Document")
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(15)
    }
}
