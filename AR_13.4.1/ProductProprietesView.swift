//
//  ProductProprietesView.swift
//  GreenFence
//
//  Created by Александр Панин on 03.12.2022.
//

import SwiftUI
// MARK: - глобальные переменные и методы из проекта (справочно для совместимости)
// глобальные константы в проекте
let WIDTH = UIScreen.main.bounds.width
let scaleWidth = WIDTH / 320
let fontLight16 = Font.system(size: scaleWidth * 16, weight: .light)
// перечисление типов свойств
enum PropretesCard: Codable, CaseIterable {
    case technical
    case reviews
    case vendor
    var label: String {
        switch self {
        case .technical:
            return "Характеристики"
        case .reviews:
            return "Отзывы"
        case .vendor:
            return "Производитель"
        }
    }
}
// расширение цветов - цвета из проекта - дальше тоже понадобяться
extension Color {
    static let greenAR = Color(#colorLiteral(red: 0.2196078431, green: 0.6901960784, blue: 0, alpha: 1))
    static let darkGreenAR = Color(#colorLiteral(red: 0.1911668777, green: 0.3707632422, blue: 0.2023646832, alpha: 1))
    static let blackAR = Color(#colorLiteral(red: 0.1285863519, green: 0.1285863519, blue: 0.1285863519, alpha: 1)).opacity(0.8)
    static let grayAR = Color(#colorLiteral(red: 0.6658725142, green: 0.6658725142, blue: 0.6658724546, alpha: 1))
    static let ligthGrayAR = Color(#colorLiteral(red: 0.7530785203, green: 0.7530786395, blue: 0.7530786395, alpha: 1))
    static let brownAR = Color(#colorLiteral(red: 0.6679978967, green: 0.4751212597, blue: 0.2586010993, alpha: 1)).opacity(0.1)
    static let ligthBrownAR = Color(#colorLiteral(red: 0.6679978967, green: 0.4751212597, blue: 0.2586010993, alpha: 1)).opacity(0.05)
    static let darkBrownAR = Color(#colorLiteral(red: 0.6679978967, green: 0.4751212597, blue: 0.2586010993, alpha: 1)).opacity(0.4)
    static let cyanAR = Color(#colorLiteral(red: 0, green: 0.7377668619, blue: 0.8324059844, alpha: 1))
    static let ligthCyanAR = Color(#colorLiteral(red: 0.8169445992, green: 0.9721707702, blue: 0.9813576341, alpha: 1))
    static let redAR = Color(#colorLiteral(red: 0.9989674687, green: 0.5950558186, blue: 0.595369339, alpha: 1))
    static let whiteAR = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
}
// приведение даты к российскому стандарту
extension Date {
    func rusDateShort() -> String {
        let date = self.formatted(Date.FormatStyle()
            .day(.twoDigits)
            .month(.twoDigits)
            .year(.twoDigits)
            .locale(Locale(identifier: "ru_RU"))
        )
        return String(date)
    }
}

// элемент коллекции
struct Element: Codable {
    // сортировка элемента внутри коллекции
    var sort: Int = 0
    // наименование элемента из коллекции
    var name: String = ""
    var label: String = ""
}
// элемент отзыв
struct Feedback: Codable {
    var id = UUID().uuidString
    var date = Date().rusDateShort()
    var sort: String
    var userName: String = ""
    var idName: String = ""
    var rating: String = ""
    var description: String = ""
}


//MARK: - основной блок для проработки окно вкладок
// вьюшка вкладок
struct ProductProprietesView: View {
    // переменная активной вкладки
    @State private var proprety: PropretesCard = .technical
    // массив технических характеристик
    let techProprietes: [Element]
    // массив отзывов для вывода и формирования новых
    @State private var feedbacks: [Feedback] = []
    // набор для вкладки производитель
    let logo: String
    let name: String
    let description: String
    let linkName: String
    let linkURL: String
    
    
    // временные надписи
    let technical = "Технические характеристики"
    let reviews = "Окно отвывов"
    let vendor = "Описание производителя"
    var body: some View {
        VStack(spacing: 5) {
            // Блок кнопок переключения вкладок
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
                            .padding(.horizontal, 10)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(self.proprety == proprety ? .cyanAR.opacity(0.1) : .whiteAR)
                                
                            )
                    }
                }
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 5)
            
            // Временный блок отрабоктки выбранной вкладки
            ZStack {
                switch proprety {
                case .technical:
                    Text(technical)
                        .font(fontLight16)
                        .lineLimit(10)
                        .minimumScaleFactor(0.90)
                        .foregroundColor(.blackAR)
                case .reviews:
                    Text(reviews)
                        .font(fontLight16)
                        .lineLimit(10)
                        .minimumScaleFactor(0.90)
                        .foregroundColor(.blackAR)
                case .vendor:
                    Text(vendor)
                        .font(fontLight16)
                        .lineLimit(10)
                        .minimumScaleFactor(0.90)
                        .foregroundColor(.blackAR)
                }
            }
            .padding(.horizontal)
        }
        
        
    }
}
