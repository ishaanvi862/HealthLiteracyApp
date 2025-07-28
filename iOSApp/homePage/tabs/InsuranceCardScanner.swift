//
//  InsuranceCardScanner.swift
//  iOSApp
//
//  Created by DPI Student 130 on 7/16/25.
//

import SwiftUI
import PhotosUI

struct InsuranceCardScanner: View {
    let background = Color(hex: "#F8F4F0")  // soft sand
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage? = nil

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "camera")
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
                showImagePicker = true
            }) {
                Text("Scan Document")
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "332D56"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            // Optional: show uploaded card for confirmation
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180)
                    .cornerRadius(10)
                    .padding(.top)
            }
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(15)
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $selectedImage)
        }
    }
}

#Preview {
    home()
}
