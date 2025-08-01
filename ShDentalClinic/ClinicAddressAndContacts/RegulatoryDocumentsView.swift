//
//  RegulatoryDocumentsView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 13.05.2025.
//

import SwiftUI

struct RegulatoryDocument {
    let title: String
    let url: String
}

struct RegulatoryDocumentsView: View {

    let documents: [RegulatoryDocument] = [
        RegulatoryDocument(
            title: "Федеральный закон РФ от 21.11.2011 № 323-ФЗ Об основах охраны здоровья граждан в Российской Федерации",
            url: "https://www.consultant.ru/document/cons_doc_LAW_121895"
        ),
        RegulatoryDocument(
            title: "Федеральный закон от 29.11.2010 г. № 326-ФЗ \"Об обязательном медицинском страховании в Российской Федерации\"",
            url: "https://www.consultant.ru/document/cons_doc_LAW_107289"
        ),
        RegulatoryDocument(
            title: "Закон РФ от 07.02.1992 N 2300-1 \"О защите прав потребителей\"",
            url: "https://www.consultant.ru/document/cons_doc_LAW_305"
        )
    ]

    var body: some View {
        ScrollView {
            Text("Нормативные документы на осуществление предпринимательской деятельности")
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundStyle(.blue)
                .padding(.bottom)

            VStack(alignment: .leading, spacing: 16) {
                ForEach(documents, id: \.url) { document in
                    if let url = URL(string: document.url) {
                        Link(destination: url) {
                            HStack {
                                Image(systemName: "text.book.closed")
                                    .font(.title2)
                                Text(document.title)
                                    .multilineTextAlignment(.leading)
                                    .foregroundStyle(.blue)
                            }
                        }
                    } else {
                        HStack {
                            Image(systemName: "text.book.closed")
                                .font(.title2)
                            Text(document.title)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    RegulatoryDocumentsView()
}
