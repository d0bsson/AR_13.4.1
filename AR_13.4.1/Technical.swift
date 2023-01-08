//
//  Technical.swift
//  AR_13.4.1
//
//  Created by Дэвид Бердников on 08.01.2023.
//

import SwiftUI

struct Technical: View {
    
    private let leadingInfo = "Текст слева"
    private let trailingInfo = "Текст справа"
    
    var body: some View {
        VStack() {
            HStack {
                Text(leadingInfo)
                    .font(fontLight16)
                    .lineLimit(10)
                    .minimumScaleFactor(0.90)
                    .foregroundColor(.blackAR)
                Spacer()
                Text(trailingInfo)
                    .font(fontLight16)
                    .lineLimit(10)
                    .minimumScaleFactor(0.90)
                    .foregroundColor(.blackAR)
            }
            .padding(.horizontal)
        }
    }
}
    
    struct Technical_Previews: PreviewProvider {
        static var previews: some View {
            Technical()
        }
    }
