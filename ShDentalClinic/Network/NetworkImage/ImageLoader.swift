//
//  ImageLoader.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 27.08.2025.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    @Published var isLoading = false
    
    private var cancellable: AnyCancellable?
    
    func loadImage(from urlString: String) {
        if let cachedImage = ImageCache.shared.getImage(forKey: urlString) {
            self.image = cachedImage
            return
        }
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL: \(urlString)")
            return
        }
        
        isLoading = true
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { data, _ in
                UIImage(data: data)
            }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] loadedImage in
                self?.isLoading = false
                self?.image = loadedImage
                
                if let loadedImage = loadedImage {
                    ImageCache.shared.setImage(loadedImage, forKey: urlString)
                }
            }
    }
    
    func cancel() {
        cancellable?.cancel()
        isLoading = false
    }
    
    deinit {
        cancel()
    }
}
