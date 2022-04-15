//
//  main.swift
//  6l_UlanBeishenkulov
//
//  Created by Ulan Beishenkulov on 12/4/22.
//

import Foundation

//MARK: - Создание Дженерик структуры
struct QueueInBank<T> {
    
    var inQueue = [T]()
    
    mutating func push(newClient: T) {
        inQueue.append(newClient)
    }
    /// Создание методов высшего порядка для моей коллекции
    /// (Я так и не втянул эту тему, те же клоужеры по моему проще)
    mutating func firstOut() {
        inQueue.removeFirst()
        print("Первый клиент уже закончил, на очереди следующий")
    }
    
    mutating func lastOut() {
        inQueue.removeLast()
        print("Эй! Ты куда? Ни уходи! Слабак!")
    }
}

//MARK: - создается Массив и в него добавляются новые имена
var names = QueueInBank(inQueue: ["Василий"])
names.push(newClient: "Сергей")
names.push(newClient: "Елена")
names.push(newClient: "Улан")
names.push(newClient: "Юрий")
names.push(newClient: "Евгений")
names.push(newClient: "Олеся")
names.push(newClient: "Шарик")
names.push(newClient: "Мурзик")
names.push(newClient: "Линдеманн")

print("Очередь в банк: \(names.inQueue)")

names.firstOut()
print("Очередь в банк: \(names.inQueue)")

names.lastOut()
print("Очередь в банк: \(names.inQueue)")

//MARK: - Subscription
struct FullModelName {
    
    let brand = "Motorola"
    let series = "RAZR"
    let model = "V3"
    
    subscript(index: Int) -> String? {
        get {
            switch index {
            case 0:
                return brand
            case 1:
                return series
            case 3:
                return model
            case 4:
                return brand + " " + series + " " + model
            default:
                return nil
            }
        }
    }
}


let phone = FullModelName()
print(phone[1] ?? 0)
print(phone[4] ?? 0)
print(phone[5] ?? 0)
