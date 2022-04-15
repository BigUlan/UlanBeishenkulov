//
//  main.swift
//  5l_UlanBeishenkulov
//
//  Created by Ulan Beishenkulov on 8/4/22.
//

import Foundation

//MARK: - Создание перечислений для методов с протоколами CustomStringConvertible
enum CarCondition: CustomStringConvertible {
    case new
    case used
    
    var description: String {
        switch self {
        case .new:
            return "Новая"
        case .used:
            return "Поддержаная"
        }
    }
}

enum DoorState: CustomStringConvertible {
    case open
    case closed
    
    var description: String {
        switch self {
        case .open:
            return "Двери открыты"
        case .closed:
            return "Двери закрыты"
        }
    }
}

enum WindowsState: CustomStringConvertible {
    case open
    case closed
    
    var description: String {
        switch self {
        case .open:
            return "Окна открыты"
        case .closed:
            return "Окна закрыты"
        }
    }
}

enum EngineState: CustomStringConvertible {
    case started
    case off
    
    var description: String {
        switch self {
        case .started:
            return "Двигатель запущен"
        case .off:
            return "Двигатель заглушен"
        }
    }
}

enum Fuel: CustomStringConvertible {
    case full
    case empty
    
    var description: String {
        switch self {
        case .full:
            return "Бак полон"
        case .empty:
            return "Бак пуст"
        }
    }
}

//MARK: - Создание протокола
protocol CarProtocol {
    
    var brand: String { get set }
    var color: String { get set }
    var condition: CarCondition { get set }
    var engineCapacity: Double { get set }
    var fuelConsumption: Fuel { get set }
    var engineStatus: EngineState { get set }
    var doorStatus: DoorState { get set }
    var windowsStatus: WindowsState { get set }
    
    func printAttention(attentionToPrint: String)
}

//MARK: - Создание расширения с методами для протокола CarProtocol
extension CarProtocol {
    
    func getDoor(to: DoorState) {
        switch to {
        case.open:
            print("Двери открыты")
        case.closed:
            print("Двери закрыты")
        }
    }
    
    func getWindow(to: WindowsState) {
        switch to {
        case.open:
            print("Окна открыты")
        case.closed:
            print("Окна закрыты")
        }
    }
    
    func getEngine(to: EngineState) {
        switch to {
        case.started:
            print("Машина заведена")
        case.off:
            print("Машина заглушена")
        }
    }
    
    func getFuel(to: Fuel) {
        switch to {
        case.full:
            print("Полный бак")
        case.empty:
            print("Пустой бак")
        }
    }
}

//MARK: - Создание классов
/// Класс Тягачей
final class TrunkCar: CarProtocol {
    
    var brand: String
    var color: String
    var condition: CarCondition
    var engineCapacity: Double
    var fuelConsumption: Fuel
    var engineStatus: EngineState
    var doorStatus: DoorState
    var windowsStatus: WindowsState
    /// Три нижние переменные, это отличительные свойства "Тягача"
    /// Грузоподъемность, количество осей, объем цистерны
    var loadCapacity: Int
    var numberOfAxles: Int
    var tunkVolume: Int
    
    init(brand: String,
         color: String,
         condition: CarCondition,
         engineCapacity: Double,
         loadCapacity: Int,
         numberOfAxles: Int,
         tunkVolume: Int,
         fuelConsumption: Fuel,
         engineStatus: EngineState,
         doorStatus: DoorState,
         windowsStatus: WindowsState) {
        self.brand = brand
        self.color = color
        self.condition = condition
        self.engineCapacity = engineCapacity
        self.loadCapacity = loadCapacity
        self.numberOfAxles = numberOfAxles
        self.tunkVolume = tunkVolume
        self.fuelConsumption = fuelConsumption
        self.engineStatus = engineStatus
        self.doorStatus = doorStatus
        self.windowsStatus = windowsStatus
    }
    
    func printAttention(attentionToPrint: String) {
        print("Тачка есть!")
    }
}

//Класс спортивной машины
final class SportCar: CarProtocol {
    
    var brand: String
    var color: String
    var condition: CarCondition
    var engineCapacity: Double
    var fuelConsumption: Fuel
    var engineStatus: EngineState
    var doorStatus: DoorState
    var windowsStatus: WindowsState
    /// Три нижние переменные, это отличительные свойства "Спортивной машины"
    /// Разгон, максимальная скорость, количество передач
    var acceleration: Double
    var maxSpeed: Int
    var numberOfGears: Int
    
    init(brand: String,
         color: String,
         condition: CarCondition,
         acceleration: Double,
         maxSpeed: Int,
         numberOfGears: Int,
         engineCapacity: Double,
         fuelConsumption: Fuel,
         engineStatus: EngineState,
         doorStatus: DoorState,
         windowsStatus: WindowsState) {
        self.brand = brand
        self.color = color
        self.condition = condition
        self.acceleration = acceleration
        self.maxSpeed = maxSpeed
        self.numberOfGears = numberOfGears
        self.engineCapacity = engineCapacity
        self.fuelConsumption = fuelConsumption
        self.engineStatus = engineStatus
        self.doorStatus = doorStatus
        self.windowsStatus = windowsStatus
    }
    
    func printAttention(attentionToPrint: String) {
        print("Тачка есть!")
    }
}

//MARK: - Создание расширений для классов
extension TrunkCar: CustomStringConvertible {
    
    var description: String {
        return "Брэнд: \(brand), Цвет: \(color), Состояние машины: \(condition), Объем двигателя: \(engineCapacity), Грузоподъемность: \(loadCapacity), Количество осей: \(numberOfAxles), Объем цистерны: \(tunkVolume), Топливо: \(fuelConsumption), Работа двигателя: \(engineStatus), Состояние дверей: \(doorStatus), Состояние окон: \(windowsStatus)"
    }
}

extension SportCar: CustomStringConvertible {
    
    var description: String {
        return "Брэнд: \(brand), Цвет: \(color), Состояние машины: \(condition), Объем двигателя: \(engineCapacity), Ускорение от 0 до 100: \(acceleration), Максимальная скорость: \(maxSpeed), Количество передач: \(numberOfGears), Топливо: \(fuelConsumption), Работа двигателя: \(engineStatus), Состояние дверей: \(doorStatus), Состояние окон: \(windowsStatus)"
    }
}

//MARK: - Объявление машин
var modelFmx = TrunkCar(brand: "Volvo",
                        color: "Черный",
                        condition: .new,
                        engineCapacity: 15,
                        loadCapacity: 7000,
                        numberOfAxles: 4,
                        tunkVolume: 6000,
                        fuelConsumption: .full,
                        engineStatus: .started,
                        doorStatus: .closed,
                        windowsStatus: .open)

var modelCargo = TrunkCar(brand: "Ford",
                          color: "Белый",
                          condition: .used,
                          engineCapacity: 13,
                          loadCapacity: 5500,
                          numberOfAxles: 6,
                          tunkVolume: 5000,
                          fuelConsumption: .empty,
                          engineStatus: .off,
                          doorStatus: .open,
                          windowsStatus: .closed)

var modelGallardo = SportCar(brand: "Lamborghini",
                             color: "Желтый",
                             condition: .new,
                             acceleration: 3.3,
                             maxSpeed: 320,
                             numberOfGears: 6,
                             engineCapacity: 5.5,
                             fuelConsumption: .full,
                             engineStatus: .started,
                             doorStatus: .closed,
                             windowsStatus: .open)

var modelCayman = SportCar(brand: "Porche",
                           color: "Зеленый",
                           condition: .used,
                           acceleration: 4.1,
                           maxSpeed: 280,
                           numberOfGears: 5,
                           engineCapacity: 4.7,
                           fuelConsumption: .empty,
                           engineStatus: .off,
                           doorStatus: .open,
                           windowsStatus: .closed)

/// Вывод свойств в консоль
print(modelGallardo)
print(modelCargo)
print(modelFmx)
print(modelCayman)

//MARK: - Применение методов
///Методы для Porsche Cayman
modelCayman.getDoor(to: .closed)
modelCayman.getFuel(to: .full)
modelCayman.getWindow(to: .open)
modelCayman.getEngine(to: .started)

///Методы для Lamborghini Gallardo
modelGallardo.getDoor(to: .open)
modelGallardo.getFuel(to: .empty)
modelGallardo.getWindow(to: .open)
modelGallardo.getEngine(to: .started)

///Методы для Volvo FMX
modelFmx.getDoor(to: .open)
modelFmx.getFuel(to: .empty)
modelFmx.getWindow(to: .open)
modelFmx.getEngine(to: .started)

///Методы для Ford Cargo
modelCargo.getDoor(to: .open)
modelCargo.getFuel(to: .empty)
modelCargo.getWindow(to: .open)
modelCargo.getEngine(to: .started)
