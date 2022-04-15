//
//  main.swift
//  7l_UlanBeishenkulov
//
//  Created by Ulan Beishenkulov on 15/4/22.
//

import Foundation

/// Продажа Авиабилетов
//MARK: - Создание enum для error
enum FlyTicketsError: Error {
    case error
    case errorAvailableCountryName
    case errorCount
    case errorMoneyOnAccount
}

//MARK: - Струкутар для названия страны
struct TargetCountry {
    
    var country: String
    
}

//MARK: - Класс для заполнения базы данных по свободным билетам
final class FlyTickets {
    
    let placeClass: String
    let price: Int
    var count: Int
    let country: TargetCountry
    
    init(placeClass: String,
         price: Int,
         count: Int,
         country: TargetCountry)
    {
        self.placeClass = placeClass
        self.price = price
        self.count = count
        self.country = country
    }
}

//MARK: - Класс первый. Ошибки обрабатываем через guard
final class FlySeller {
    
    private var availableTickets = ["Malaysia": FlyTickets(placeClass: "Business", price:                                   34500, count: 27, country: TargetCountry(country:                                   "Malaysia")),
                                    "France": FlyTickets(placeClass: "Econom", price: 17000, count: 12, country: TargetCountry(country: "France")),
                                    "USA": FlyTickets(placeClass: "Standart", price: 23000, count: 4, country: TargetCountry(country: "USA")),
                                    "Turkey": FlyTickets(placeClass: "Econom", price: 7300, count: 34, country: TargetCountry(country: "Turkey")),
                                    "Russia": FlyTickets(placeClass: "Business", price: 42000, count: 0, country: TargetCountry(country: "Russia"))]
    
    public var moneyOnAccount = 0
    
    func checkTicket(_ country: String) -> TargetCountry? {
        
        guard let ticket = availableTickets[country],
              ticket.count > 0,
              ticket.price <= moneyOnAccount else
        {
            print("Error! Ката! Ошибка! Fehler! خطأ! エラー! Qagh!")
            return nil
            
        }
        
        let newTicket = ticket
        newTicket.count -= 1
        availableTickets[country] = newTicket
        print("Мои поздравления! Вы купили билет в \(country)")
        
        return newTicket.country
    }
}

var ticketOne = FlySeller()
ticketOne.moneyOnAccount = 10000
ticketOne.checkTicket("France")

//MARK: - Класс второй. Ошибки обрабатываем через guard. Добавился enum с error
final class FlySellerTwo {

    private var availableTickets = ["Malaysia": FlyTickets(placeClass: "Business", price:                                   34500, count: 27, country: TargetCountry(country:                                   "Malaysia")),
                                    "France": FlyTickets(placeClass: "Econom", price: 17000, count: 12, country: TargetCountry(country: "France")),
                                    "USA": FlyTickets(placeClass: "Standart", price: 23000, count: 4, country: TargetCountry(country: "USA")),
                                    "Turkey": FlyTickets(placeClass: "Econom", price: 7300, count: 34, country: TargetCountry(country: "Turkey")),
                                    "Russia": FlyTickets(placeClass: "Business", price: 42000, count: 0, country: TargetCountry(country: "Russia"))]

    public var moneyOnAccount = 0

    func checkTicket(ticketName country: String) -> (TargetCountry?, FlyTicketsError?) {

        guard let ticket = availableTickets[country],
                ticket.count > 0,
              ticket.price <= moneyOnAccount else
        {
            print("Error! Ката! Ошибка! Fehler! خطأ! エラー! Qagh!")
            return (nil, FlyTicketsError.error)
        }

        let newTicket = ticket
        newTicket.count -= 1
        availableTickets[country] = newTicket
        print("Мои поздравления! Вы купили билет в \(country)")

        return (newTicket.country, nil)
    }
}

var ticketTwo = FlySeller()
ticketTwo.moneyOnAccount = 10000
ticketTwo.checkTicket("Russia")

//MARK: - Класс третий. Guard, enum, Throws
final class FlySellerThree {

    private var availableTickets = ["Malaysia": FlyTickets(placeClass: "Business", price:                                   34500, count: 27, country: TargetCountry(country:                                   "Malaysia")),
                                    "France": FlyTickets(placeClass: "Econom", price: 17000, count: 12, country: TargetCountry(country: "France")),
                                    "USA": FlyTickets(placeClass: "Standart", price: 23000, count: 4, country: TargetCountry(country: "USA")),
                                    "Turkey": FlyTickets(placeClass: "Econom", price: 7300, count: 34, country: TargetCountry(country: "Turkey")),
                                    "Russia": FlyTickets(placeClass: "Business", price: 42000, count: 0, country: TargetCountry(country: "Russia"))]

    public var moneyOnAccount = 0

    func checkTicket(ticketName country: String) throws -> TargetCountry {
        
        guard let ticket = availableTickets[country] else { throw FlyTicketsError.errorAvailableCountryName}
        guard ticket.count > 0 else { throw FlyTicketsError.errorCount}
        guard ticket.price <= moneyOnAccount else {throw FlyTicketsError.errorMoneyOnAccount}
        
        let newTicket = ticket
        newTicket.count -= 1
        availableTickets[country] = newTicket
        print("Мои поздравления! Вы купили билет в \(country)")
        
        return newTicket.country
    }
}

var firstTicketBuy = FlySellerThree()
firstTicketBuy.moneyOnAccount = 2000000

do {
    let ticket = try firstTicketBuy.checkTicket(ticketName: "Malaysia")
    print("Кто то летит \(ticket.country)")
} catch {
    print(error)
}

