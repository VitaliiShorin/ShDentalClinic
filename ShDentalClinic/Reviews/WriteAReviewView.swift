//
//  WriteAReviewView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 14.05.2025.
//

import SwiftUI

struct WriteAReviewView: View {
    let doctor: Doctor
    var onSend: (String, Int) -> Void // Передаем отзыв и звезды

    @State private var text = ""
    @State private var selectedStars = 0
    @State private var review = ""
    
    private let maxCharacterLimit = 400
    
    private var isButtonActive: Bool {
        !review.isEmpty && selectedStars > 0
    }
    
    var body: some View {
        let width = UIScreen.main.bounds.width - 32
        let height = width

        ScrollView(.vertical, showsIndicators: false) {
            HStack(spacing: 20) {
                Image(doctor.imageName)
                    .resizable()
                    .frame(width: width / 2.5, height: height / 2.5)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                VStack(alignment: .leading) {
                    Text(doctor.fullName)
                        .font(.callout.bold())
                    Text(doctor.speciality)
                        .font(.subheadline)
                }
                .frame(width: width / 2, height: height / 2.5, alignment: .leading)
            }

            Text("Пожалуйста, оцените Ваш прием у врача")
                .font(.subheadline)
                .padding()

            HStack(spacing: 5) {
                ForEach(0..<5, id: \.self) { index in
                    Image(systemName: index < selectedStars ? "star.fill" : "star")
                        .font(.title2)
                        .foregroundStyle(index < selectedStars ? .gold : .gray)
                        .onTapGesture {
                            selectedStars = index + 1
                            responseToTheStarRating()
                        }
                }
            }
            .padding()
            
            Text(text)
                .font(.subheadline)
                .padding()

            ZStack(alignment: .topLeading) {
                TextEditor(text: $review)
                    .padding(8)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(15)
                    .frame(width: width, height: UIScreen.main.bounds.width / 2)
                    .onChange(of: review) { newValue in
                        if newValue.count > maxCharacterLimit {
                            review = String(newValue.prefix(maxCharacterLimit))
                        }
                    }
                
                if review.isEmpty {
                    Text("Напишите комментарий")
                        .foregroundStyle(.gray)
                        .padding()
                }
            }

            Text("\(maxCharacterLimit - review.count) символов осталось")
                .font(.caption)
                .foregroundStyle(.gray)
                .padding(.top, 8)
                        
            Button {
                onSend(review, selectedStars)
                review = ""
                selectedStars = 0
                text = ""
            } label: {
                Text("Отправить")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: width / 2, height: 40)
                    .background(isButtonActive ? .blue : .gray)
                    .cornerRadius(15)
            }
            .disabled(!isButtonActive)
            .padding(.top, 30)
            
            Spacer()
        }
        .padding()
    }
    
    func responseToTheStarRating() {
        switch selectedStars {
        case 0...3:
            self.text = "Что Вас расстроило?"
        case 4:
            self.text = "Спасибо, что мы могли бы улучшить?"
        default:
            self.text = "Спасибо, мы очень рады!"
        }
    }
}

#Preview {
    WriteAReviewView(doctor: doctors[0]) { review, stars in }
        .environmentObject(ReviewsViewModel())
}
