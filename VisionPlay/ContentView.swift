//
//  ContentView.swift
//  VisionPlay
//
//  Created by Marc Harvey on 15/09/2023.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var imagesFromFirstArray = true
    let images = ["coast", "dog"]
    let imagesTakeTwo = ["nanas", "whale"]

    var displayedImages: [String] {
        imagesFromFirstArray ? images : imagesTakeTwo
    }

    var body: some View {
        TabView {
            ImageView()
                .tabItem { Label("Pics", systemImage: "photo.artframe") }
            TextFieldView()
                .tabItem { Label("Writer", systemImage: "pencil.tip") }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

struct ImageView: View {
    @State private var imagesFromFirstArray = true
    let images = ["coast", "dog"]
    let imagesTakeTwo = ["nanas", "whale"]

    var displayedImages: [String] {
        imagesFromFirstArray ? images : imagesTakeTwo
    }

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 0) {
                    ForEach(displayedImages, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(40)
                    }
                }
            }
            Button(action: {
                imagesFromFirstArray.toggle()
            }) {
                Text("Reload")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
            }
            .padding()
        }
    }
}


struct TextFieldView: View {
    @State private var enteredText = ""

        var body: some View {
            VStack {
                TextField("Type something...", text: $enteredText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Text("You entered: \(enteredText)")
                    .font(.headline)
                    .padding()
            }
            .padding()
        }
}
