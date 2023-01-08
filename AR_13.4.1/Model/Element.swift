//
//  TechnicalFileManager.swift
//  AR_13.4.1
//
//  Created by Дэвид Бердников on 08.01.2023.
//

import Foundation

struct Element: Codable {
    // сортировка элемента внутри коллекции
    var sort: Int = 0
    // наименование элемента из коллекции
    var name: String = ""
    var label: String = ""
}

extension Element {
    
    static func getElement() -> [Element] {
        
        [
        Element(sort: 1, name: "запись слева 1", label: "запись справа 1"),
        Element(sort: 2, name: "запись слева 2", label: "запись справа 2"),
        Element(sort: 3, name: "запись слева 3", label: "запись справа 3")
        ]
        
    }
}
