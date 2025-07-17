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
                "Hi, I'm Chami AI 💜",
                "What health questions can I help you with today?"
            ]
            
            var body: some View {
                VStack {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            ForEach(messages, id: \.self) { message in
                                HStack(alignment: .top) {
                                    Image(systemName: "sparkles")
                                        .foregroundColor(Color.purple)
                                        .padding(.top, 4)
                                    
                                    Text(message)
                                        .padding(12)
                                        .background(Color.purple.opacity(0.1))
                                        .foregroundColor(.primary)
                                        .cornerRadius(12)
                                    
                                    Spacer()
                                }
                            }
                        }
                        .padding()
                    }

                    Spacer()

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
                                .background(Color.purple)
                                .clipShape(Circle())
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground).shadow(radius: 5))
                }
                .navigationTitle("Chami AI")
                .ignoresSafeArea(edges: .bottom)
            }
}

#Preview {
    ChamiAI()
}
