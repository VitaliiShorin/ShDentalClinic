//
//  WriteAReviewView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 14.05.2025.
//

import SwiftUI

struct WriteAReviewView: View {
    let doctor: Doctor
    var onSend: (String, Int) -> Void

    @State private var hintText = ""
    @State private var selectedStars = 0
    @State private var review = ""
    
    private let maxCharacterLimit = 400
    
    private var isButtonActive: Bool {
        !review.isEmpty && selectedStars > 0
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack(spacing: 20) {
                Image(doctor.imageName)
                    .resizable()
                    .frame(width: 140, height: 140)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                VStack(alignment: .leading) {
                    Text(doctor.surname)
                        .font(.callout.bold())
                    Text(doctor.name)
                        .font(.callout.bold())
                    Text(doctor.patronymic)
                        .font(.callout.bold())
                    Text(doctor.speciality)
                        .font(.subheadline)
                        .padding(.top, 5)
                }
                Spacer()
            }
            .padding(.horizontal)

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
            
            Text(hintText)
                .font(.subheadline)
                .padding()

            ZStack(alignment: .topLeading) {
                TextEditor(text: $review)
                    .padding(8)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(15)
                    .frame(maxWidth: .infinity, minHeight: 200)
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
                hintText = ""
            } label: {
                Text("Отправить")
                    .foregroundStyle(.white)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 12)
                    .background(isButtonActive ? .blue : .gray)
                    .cornerRadius(15)
            }
            .disabled(!isButtonActive)
            .padding(.top, 30)
            
            Spacer()
        }
        .padding()
        .hideKeyboardOnTap()
    }
    
    func responseToTheStarRating() {
        switch selectedStars {
        case 0...3:
            self.hintText = "Что Вас расстроило?"
        case 4:
            self.hintText = "Спасибо, что мы могли бы улучшить?"
        default:
            self.hintText = "Спасибо, мы очень рады!"
        }
    }
}

#Preview {
    WriteAReviewView(doctor: doctors[0]) { review, stars in }
        .environmentObject(ReviewViewModel())
}
