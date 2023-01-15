//
//  ContentView.swift
//  AR_13.4.1
//
//  Created by Дэвид Бердников on 08.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var proprety: PropretesCard = .technical
    
    private let vendor = "Описание производителя"
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 1) {
                ForEach(PropretesCard.allCases, id: \.self ) { proprety in
                    Button {
                        self.proprety = proprety
                    } label: {
                        Text(proprety.label)
                            .font(fontLight16)
                            .lineLimit(1)
                            .minimumScaleFactor(0.90)
                            .foregroundColor(self.proprety == proprety ? .cyanAR : .blackAR)
                            .padding(.vertical, 10)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(self.proprety == proprety ? .cyanAR.opacity(0.1) : .whiteAR)
                            )
                    }
                    .padding(.horizontal, 5)
                }
            }
            .padding(.vertical, 1)
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



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
