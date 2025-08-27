//
//  FormattedPhoneNumber.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 28.05.2025.
//

import Foundation

func extractDigits(_ text: String) -> String {
    text.filter { $0.isNumber }
}

func formattedPhoneNumber(_ phoneNumber: String) -> String {
    let digits = extractDigits(phoneNumber)
    guard !digits.isEmpty else { return "" }
    
    var processed = digits
    if processed.first == "8" {
        processed.removeFirst()
        processed = "7" + processed
    } else if processed.hasPrefix("7") {
    } else if processed.hasPrefix("9") && processed.count == 10 {
        processed = "7" + processed
    }
    
    var result = "+7"
    if processed.count > 1 {
        let start = processed.index(processed.startIndex, offsetBy: 1)
        let end = processed.index(start, offsetBy: min(3, processed.count - 1), limitedBy: processed.endIndex) ?? processed.endIndex
        result += " \(processed[start..<end])"
    }
    if processed.count > 4 {
        let start = processed.index(processed.startIndex, offsetBy: 4)
        let end = processed.index(start, offsetBy: min(3, processed.count - 4), limitedBy: processed.endIndex) ?? processed.endIndex
        result += " \(processed[start..<end])"
    }
    if processed.count > 7 {
        let start = processed.index(processed.startIndex, offsetBy: 7)
        let end = processed.index(start, offsetBy: min(2, processed.count - 7), limitedBy: processed.endIndex) ?? processed.endIndex
        result += " \(processed[start..<end])"
    }
    if processed.count > 9 {
        let start = processed.index(processed.startIndex, offsetBy: 9)
        let end = processed.index(start, offsetBy: min(2, processed.count - 9), limitedBy: processed.endIndex) ?? processed.endIndex
        result += " \(processed[start..<end])"
    }
    return result
}
