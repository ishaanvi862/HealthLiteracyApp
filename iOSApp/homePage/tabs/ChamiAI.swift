//
//  tabThree.swift
//  TabBar
//
//  Created by DPI Student 136 on 7/7/25.
//

import SwiftUI

struct ChamiAI: View {
    @State private var userInput: String = ""
    @State private var messages: [String] = [
        "Hi, I'm Insure AI 💜",
        "What health questions can I help you with today?"
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(messages, id: \.self) { message in
                        HStack(alignment: .top) {
                            Image(systemName: "sparkles")
                                .foregroundColor(Color(hex: "#332D56"))
                                .padding(.top, 4)
                            
                            Text(message)
                                .padding(12)
                                .background((Color(hex: "#332D56").opacity(0.9)))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                            
                            Spacer()
                        }
                    }
                }
                .padding()
            }
            
            Divider()
            
            HStack {
                TextField("Type your question here...", text: $userInput)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                
                Button(action: {
                    if !userInput.isEmpty {
                        messages.append("You: \(userInput)")
                        userInput = ""
                    }
                }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(hex: "#332D56"))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color(.systemBackground))
            .padding(.bottom, 10) // Keeps it above the tab bar
        }
    }
}
#Preview {
    ChamiAI()
}

