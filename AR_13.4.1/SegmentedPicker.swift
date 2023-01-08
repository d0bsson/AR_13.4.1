//
//  SegmentedPicker.swift
//  AR_13.4.1
//
//  Created by Дэвид Бердников on 08.01.2023.
//

import SwiftUI

struct SegmentedPicker: View {
    @State private var proprety: PropretesCard = .technical
    
    private let technical = "Технические характеристики"
    private let reviews = "Окно отвывов"
    private let vendor = "Описание производителя"
    
    var body: some View {
        VStack(spacing: 5) {
            HStack() {
                ForEach(PropretesCard.allCases, id: \.self ) { proprety in
                    Button {
                        self.proprety = proprety
                    } label: {
                        Text(proprety.label)
                            .font(fontLight16)
                            .lineLimit(1)
                            .minimumScaleFactor(0.70)
                            .foregroundColor(self.proprety == proprety ? .cyanAR : .blackAR)
                            .padding(.vertical, 10)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(self.proprety == proprety ? .cyanAR.opacity(0.1) : .whiteAR)
                            )
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.vertical, 15)
            switch proprety {
            case .technical:
                Technical()
            case .reviews:
                Feedbacks()
            case .vendor:
                Text(vendor)
                    .font(fontLight16)
                    .lineLimit(10)
                    .minimumScaleFactor(0.90)
                    .foregroundColor(.blackAR)
            }
        }
    }
}


struct train_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedPicker()
    }
}
