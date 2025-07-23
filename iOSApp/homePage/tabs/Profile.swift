//
//  tabOne.swift
//  TabBar
//
//  Created by DPI Student 136 on 7/7/25.
//

import SwiftUI
import PhotosUI

struct Profile: View {
    let background = Color(hex: "#F8F4F0")  // soft sand

    @State private var username: String = "Username123"
    @State private var insuranceProvider: String = "United Health"
    @State private var location: String = "Southside of Chicago, IL"
    @State private var isEditingUsername = false
    @State private var isEditingInsurance = false
    @State private var isEditingLocation = false
    @State private var profileImage: UIImage? = nil
    @State private var showImagePicker = false

    var body: some View {
        NavigationView {
            ZStack {
                background.ignoresSafeArea(edges: .all)

                VStack(spacing: 16) {
                    Text("Welcome!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "332D56"))
                        .padding(.bottom, 10)

                    ZStack(alignment: .bottomTrailing) {
                        if let image = profileImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                        } else {
                            Image("pfp")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                        }

                        Button(action: {
                            showImagePicker = true
                        }) {
                            Image(systemName: "camera.fill")
                                .padding(8)
                                .background(Color(hex: "332D56").opacity(0.8))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .shadow(radius: 2)
                        }
                        .offset(x: -10, y: -10)
                    }
                    .padding(.bottom, 10)

                    HStack {
                        if isEditingUsername {
                            TextField("Username", text: $username)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        } else {
                            Text(username)
                                .font(.title2)
                        }
                        Button(action: {
                            isEditingUsername.toggle()
                        }) {
                            Image(systemName: "pencil")
                                .padding(6)
                                .background(Color.green.opacity(0.2))
                                .clipShape(Circle())
                        }
                    }

                    VStack(spacing: 8) {
                        HStack {
                            Text("Date Joined: \(formattedDate())")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }

                        HStack {
                            if isEditingInsurance {
                                TextField("Insurance", text: $insuranceProvider)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            } else {
                                Text("Insured with \(insuranceProvider)")
                                    .font(.subheadline)
                                    .fontWeight(.light)
                            }
                            Button(action: {
                                isEditingInsurance.toggle()
                            }) {
                                Image(systemName: "pencil")
                                    .padding(6)
                                    .background(Color.green.opacity(0.2))
                                    .clipShape(Circle())
                            }
                        }

                        HStack {
                            if isEditingLocation {
                                TextField("Location", text: $location)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            } else {
                                Text(location)
                                    .font(.subheadline)
                                    .fontWeight(.light)
                            }
                            Button(action: {
                                isEditingLocation.toggle()
                            }) {
                                Image(systemName: "pencil")
                                    .padding(6)
                                    .background(Color.green.opacity(0.2))
                                    .clipShape(Circle())
                            }
                        }
                    }

                    NavigationLink(destination: CalendarView()) {
                        Text("My Calendar")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(hex: "#A188A6"))
                            .cornerRadius(12)
                    }
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(image: $profileImage)
                }
                .padding()
            }
        }
    }

    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: Date())
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, PHPickerViewControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            guard let provider = results.first?.itemProvider,
                  provider.canLoadObject(ofClass: UIImage.self) else { return }

            provider.loadObject(ofClass: UIImage.self) { image, _ in
                DispatchQueue.main.async {
                    self.parent.image = image as? UIImage
                }
            }
        }
    }

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 1
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
}

#Preview {
    Profile()
}
