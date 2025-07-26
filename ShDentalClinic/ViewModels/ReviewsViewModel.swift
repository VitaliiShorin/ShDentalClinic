//
//  ReviewsViewModel.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 17.05.2025.
//

import Foundation
import RealmSwift

// MARK: - Model
final class RealmDoctorReview: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var doctorFullName = ""
    @Persisted var patientName = ""
    @Persisted var date = Date()
    @Persisted var numberOfStars = 0
    @Persisted var reviewText = ""
}

// MARK: - ViewModel
final class ReviewViewModel: ObservableObject {
    @Published private(set) var reviews: [RealmDoctorReview] = []
    
    private let realm: Realm
    
    // MARK: - Formatter
    private static let starFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        formatter.decimalSeparator = ","
        return formatter
    }()
    
    // MARK: - Initialization
    init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to initialize Realm: \(error.localizedDescription)")
        }
//        deleteAllReviews() // для тестирования
        load()
    }
    
    // MARK: - Public Methods
    func reviews(forDoctor doctorFullName: String) -> [RealmDoctorReview] {
        reviews
            .filter { $0.doctorFullName == doctorFullName }
            .sorted { $0.date > $1.date }
    }
    
    func addReview(
        for doctor: Doctor,
        patientName: String,
        stars: Int,
        text: String
    ) {
        let review = RealmDoctorReview()
        review.id = UUID()
        review.doctorFullName = doctor.fullName
        review.patientName = patientName
        review.date = Date()
        review.numberOfStars = stars
        review.reviewText = text
        
        do {
            try realm.write {
                realm.add(review)
            }
            load()
        } catch {
            print("Failed to add review: \(error.localizedDescription)")
        }
    }

    func load() {
        let realmReviews = realm.objects(RealmDoctorReview.self)
        reviews = Array(realmReviews)
    }
    
    func averageStars(forDoctor doctorFullName: String) -> Double {
        let doctorReviews = reviews(forDoctor: doctorFullName)
        guard !doctorReviews.isEmpty else { return 0.0 }
        
        let totalStars = doctorReviews.reduce(0) { $0 + $1.numberOfStars }
        return Double(totalStars) / Double(doctorReviews.count)
    }
    
    func averageStarsString(forDoctor doctorFullName: String) -> String {
        let average = averageStars(forDoctor: doctorFullName)
        
        guard average > 0 else { return "0" }
        
        if average.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(average))
        }
        
        return Self.starFormatter.string(from: NSNumber(value: average)) ??
        String(format: "%.1f", average).replacingOccurrences(of: ".", with: ",")
    }
    
    func deleteAllReviews() {
        do {
            let allReviews = realm.objects(RealmDoctorReview.self)
            try realm.write {
                realm.delete(allReviews)
            }
            load()
        } catch {
            print("Failed to delete all reviews: \(error.localizedDescription)")
        }
    }
}
