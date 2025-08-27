//
//  View+Extensions.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 27.08.2025.
//

import SwiftUI

// Скрытие клавиатуры по тапу вне текстового поля
extension View {
    func hideKeyboardOnTap() -> some View {
        self.onTapGesture {
            UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil,
                from: nil,
                for: nil
            )
        }
    }
}
