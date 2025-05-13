//
//  AboutTheDoctorEducationView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 11.05.2025.
//

import SwiftUI

struct AboutTheDoctorEducationView: View {
    let education: String
    let certificate: String
    let continuingEducation: String
    let professionalSkills: String
    
    var body: some View {
        VStack {
            createSectionTitle(text: "Образование:")
            createSectionContent(text: education)
            
            createSectionTitle(text: "Сертификат специалиста:")
            createSectionContent(text: certificate)
            
            createSectionTitle(text: "Повышение квалификации:")
            createSectionContent(text: continuingEducation)
            
            createSectionTitle(text: "Профессиональные навыки:")
            createSectionContent(text: professionalSkills)
        }
        .padding(.top, 7)
        .frame(width: UIScreen.main.bounds.width)
        .background(.gray .opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    func createSectionTitle(text: String) -> some View {
        Text(text)
            .font(.callout.bold())
            .frame(width: UIScreen.main.bounds.width - 32, alignment: .leading)
            .padding(.bottom, 5)
            .padding(.leading, 3)
    }
    
    func createSectionContent(text: String) -> some View {
        Text(text)
            .font(.callout)
            .padding(.leading, 12)
            .frame(width: UIScreen.main.bounds.width - 32, alignment: .leading)
            .padding(.bottom, 5)
    }
}

#Preview {
    AboutTheDoctorEducationView(education: doctors[6].education, certificate: doctors[6].certificate, continuingEducation: doctors[6].continuingEducation, professionalSkills: doctors[6].professionalSkills)
}
