//
//  Technical.swift
//  AR_13.4.1
//
//  Created by Дэвид Бердников on 08.01.2023.
//

import SwiftUI

struct Technical: View {
    
    private var elements = Element.getElement()
    
    var body: some View {
        HStack {
            VStack() {
                ForEach(elements, id: \.sort) { element in
                    Text("\(element.name)")
                        .font(fontLight16)
                        .lineLimit(10)
                        .minimumScaleFactor(0.90)
                        .foregroundColor(.blackAR)
                        .padding(.horizontal)
                }
                .frame(width: WIDTH/2, alignment: .leading)
                
            }
            VStack() {
                ForEach(elements, id: \.sort) { element in
                    Text("\(element.label)")
                        .font(fontLight16)
                        .lineLimit(10)
                        .minimumScaleFactor(0.90)
                        .foregroundColor(.blackAR)
                        .padding(.horizontal)
                }
                .frame(width: WIDTH/2, alignment: .trailing)
            }
        }
    }
}



struct Technical_Previews: PreviewProvider {
    static var previews: some View {
        Technical()
            .previewInterfaceOrientation(.portrait)
    }
}


