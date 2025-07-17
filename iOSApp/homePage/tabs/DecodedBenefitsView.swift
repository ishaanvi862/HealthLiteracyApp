//
//  DecodedBenefitsView.swift
//  iOSApp
//
//  Created by DPI Student 130 on 7/16/25.
//

import SwiftUI

struct DecodedBenefitsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            BenefitRow(icon: "checkmark.seal", title: "What's Covered?", value: "Comprehensive")
            BenefitRow(icon: "dollarsign.circle", title: "Deductible Information", value: "Active - $1,500, $750 met")
            BenefitRow(icon: "heart.text.square", title: "Mental Health Coverage", value: "Included")
        }
    }
}

struct BenefitRow: View {
    let icon: String
    let title: String
    let value: String

    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: icon)
                .foregroundColor(.green)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .bold()
                Text(value)
                    .font(.subheadline)
            }
        }
    }
}
