//
//  Feedback.swift
//  AR_13.4.1
//
//  Created by Дэвид Бердников on 08.01.2023.
//

import SwiftUI

struct Feedbacks: View {
    private let feedbacks = Feedback.getFeedbacks()
    
    var body: some View {
        VStack{
            Spacer()
            ScrollView(.vertical) {
                VStack {
                    ForEach(feedbacks, id: \.sort) { feedback in
                        Text("\(feedback.userName)")
                            .font(Font.headline.weight(.bold))
                        StarsView(rating: feedback.rating, maxRating: 5)
                        Divider()
                    }
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

struct StarsView: View {
    var rating: Int
    var maxRating: Int

    var body: some View {
        let stars = HStack(spacing: 0) {
            ForEach(0..<maxRating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }

        stars.overlay(
            GeometryReader { g in
                let width = CGFloat(rating) / CGFloat(maxRating) * g.size.width
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: width)
                        .foregroundColor(.yellow)
                }
            }
            .mask(stars)
        )
        .foregroundColor(.gray)
    }
}

