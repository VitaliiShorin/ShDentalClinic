//
//  ReviewsViewModel.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 17.05.2025.
//

import Foundation

struct DoctorReview: Identifiable, Codable {
    let id: UUID
    let doctorFullName: String
    let patientName: String
    let date: Date
    let numberOfStars: Int
    let reviewText: String
}

class ReviewsViewModel: ObservableObject {
    @Published var reviews: [DoctorReview] = [] {
        didSet { save() }
    }
    
    // Для удаления отзывов:
    init() { load() }
//    init() {
//        self.reviews = []
//        save()
//    }
    
    func reviews(forDoctor name: String) -> [DoctorReview] {
        reviews.filter { $0.doctorFullName == name }
            .sorted { $0.date > $1.date }
    }
    
    func addReview(for doctor: Doctor, patientName: String, stars: Int, text: String) {
        let review = DoctorReview(
            id: UUID(),
            doctorFullName: doctor.fullName,
            patientName: patientName,
            date: Date(),
            numberOfStars: stars,
            reviewText: text
        )
        reviews.append(review)
    }
    
    private let reviewsKey = "doctor_reviews"

    func save() {
        if let data = try? JSONEncoder().encode(reviews) {
            UserDefaults.standard.set(data, forKey: reviewsKey)
        }
    }
    
    func load() {
        if let data = UserDefaults.standard.data(forKey: reviewsKey),
           let loaded = try? JSONDecoder().decode([DoctorReview].self, from: data) {
            reviews = loaded
        }
    }
    
    func averageStars(forDoctor name: String) -> Double {
        let doctorReviews = reviews(forDoctor: name)
        guard !doctorReviews.isEmpty else { return 0.0 }
        let total = doctorReviews.reduce(0) { $0 + $1.numberOfStars }
        return Double(total) / Double(doctorReviews.count)
    }

    func averageStarsString(forDoctor name: String) -> String {
        let average = averageStars(forDoctor: name)
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 1
        formatter.decimalSeparator = ","
        return formatter.string(from: NSNumber(value: average)) ?? "0,0"
    }
}
