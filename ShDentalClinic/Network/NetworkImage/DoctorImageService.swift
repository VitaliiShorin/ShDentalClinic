//
//  DoctorImageService.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 27.08.2025.
//

import Foundation

class DoctorImageService {
    static let shared = DoctorImageService()
    
    private let baseURL = "https://raw.githubusercontent.com/VitaliiShorin/MaterialsToTheClinic/main/"
    
    private init() {}
    
    func imageURL(for imageName: String) -> String {
        return "\(baseURL)\(imageName).png"
    }
}
