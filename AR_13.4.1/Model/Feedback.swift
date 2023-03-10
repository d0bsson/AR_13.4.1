//
//  Feedback.swift
//  AR_13.4.1
//
//  Created by Дэвид Бердников on 12.01.2023.
//

import Foundation

struct Feedback: Codable {
    var id = UUID().uuidString
    var date = Date().rusDateShort()
    var sort: String
    var userName: String = ""
    var idName: String = ""
    var rating: Int = 1
    var description: String = ""
}

extension Feedback {
    static func getFeedbacks() -> [Feedback] {
        [
            Feedback(id: "id1", date: "date1", sort: "1", userName: "Vasiliy", idName: "idName1", rating: 5, description: "Best"),
            Feedback(id: "id2", date: "date2", sort: "2", userName: "Vitaliy", idName: "idName2", rating: 4, description: "Great"),
            Feedback(id: "id3", date: "date3", sort: "3", userName: "Alex", idName: "idName3", rating: 3, description: "All right")
        ]
    }
}
