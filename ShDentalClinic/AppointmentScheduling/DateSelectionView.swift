//
//  DateSelectionView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 22.05.2025.
//

import SwiftUI

struct DateSelectionView: View {
    @Binding var selectedDate: Date

    private static let daysCount = 30
    private static let calendar = Calendar.current
    
    // Список дат на ближайшие 30 дней
    private var dates: [Date] {
        let today = Date().startOfDay
        return (0..<Self.daysCount).compactMap {
            Self.calendar.date(byAdding: .day, value: $0, to: today)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "calendar.badge.clock")
                    .foregroundStyle(.blue)
                Text(selectedDate.formatted(date: .numeric, time: .omitted))
                    .foregroundStyle(.blue)
                    .font(.callout.bold())
                Spacer()
            }
            .padding([.horizontal, .top])

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(dates, id: \.self) { date in
                        Button(action: {
                            selectedDate = date
                        }) {
                            VStack(spacing: 4) {
                                Text(formattedDay(date: date))
                                    .font(.headline)
                                Text(formattedWeekDay(date: date))
                                    .font(.caption)
                            }
                            .frame(width: 40, height: 50)
                            .background(selectedDate.isSameDay(as: date) ? Color.blue : Color.white)
                            .foregroundStyle(selectedDate.isSameDay(as: date) ? .white : .blue)
                            .cornerRadius(8)
                            .shadow(radius: selectedDate.isSameDay(as: date) ? 3 : 1)
                        }
                    }
                }
                .padding(.vertical, 1)
                .padding(.horizontal)
            }
        }
    }

    // Формат dd ("21")
    private func formattedDay(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter.string(from: date)
    }

    // Формат "Пн", "Вт", "Ср" (короткий день недели RU)
    private func formattedWeekDay(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.setLocalizedDateFormatFromTemplate("EE")
        return formatter.string(from: date)
    }
}

// MARK: - Extensions для дат
extension Date {
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
    func isSameDay(as other: Date) -> Bool {
        Calendar.current.isDate(self, inSameDayAs: other)
    }
}

#Preview {
    DateSelectionView(selectedDate: .constant(Date()))
}
