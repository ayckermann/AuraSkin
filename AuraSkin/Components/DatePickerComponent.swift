//
//  DatePickerComponent.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 20/05/24.
//

import SwiftUI

struct DatePickerComponent: View {
    @Binding var expiredDate: Date

    var body: some View {
        HStack {
            Text(getDate(from: expiredDate))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)

            Image(systemName: "calendar")
                .font(.title)
                .overlay {
                    DatePicker("", selection: $expiredDate, displayedComponents: .date)
                        .blendMode(.destinationOver)
                }
                .foregroundStyle(.gray)
        }
        .frame(height: 45)
        .padding([.leading, .trailing], 15)
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 1))
    }

    func getDate(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"

        return dateFormatter.string(from: date)
    }
}

#Preview {
    @State var expiredDate: Date = Date.now
    return DatePickerComponent(expiredDate: $expiredDate)
}
