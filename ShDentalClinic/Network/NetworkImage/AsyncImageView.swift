//
//  AsyncImageView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 27.08.2025.
//

import SwiftUI

struct AsyncImageView: View {
    let urlString: String
    let width: CGFloat
    let cornerRadius: CGFloat
    
    @StateObject private var loader = ImageLoader()
    
    init(urlString: String, width: CGFloat, cornerRadius: CGFloat = 0) {
        self.urlString = urlString
        self.width = width
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: width)
            } else if loader.isLoading {
                ProgressView()
                    .frame(width: width, height: width * 0.8)
                    .background(Color.gray.opacity(0.1))
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: width, height: width * 0.8)
                    .overlay(
                        VStack {
                            Image(systemName: "person.crop.circle")
                                .foregroundColor(.gray)
                                .font(.largeTitle)
                            Text("Загрузка...")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    )
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .onAppear {
            loader.loadImage(from: urlString)
        }
        .onDisappear {
            loader.cancel()
        }
    }
}

#Preview {
    AsyncImageView(urlString: "", width: 150)
}
