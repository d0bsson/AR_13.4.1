//
//  Feedback.swift
//  AR_13.4.1
//
//  Created by Дэвид Бердников on 08.01.2023.
//

import SwiftUI

struct Feedbacks: View {
    
    var body: some View {
        VStack{
            ScrollView(.horizontal) {
                HStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .frame(width: 250, height: 100, alignment: .bottom)
                        .foregroundColor(.whiteAR)
                        .addBorder(.red, width: 3, cornerRadius: 20)
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .frame(width: 250, height: 100, alignment: .bottom)
                        .foregroundColor(.whiteAR)
                        .addBorder(.red, width: 3, cornerRadius: 20)
                }
            }
        }
    }
}

struct Feedback_Previews: PreviewProvider {
    static var previews: some View {
        Feedbacks()
    }
}

extension View {
     public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
         let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
         return clipShape(roundedRect)
              .overlay(roundedRect.strokeBorder(content, lineWidth: width))
     }
 }
