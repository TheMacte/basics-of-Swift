//import UIKit
import Foundation

// Обшие (для легковых и грузовых машин) перечисления
enum Brand {
    case BMW
    case Toyota
    case Lada
    case Nissan
    case Man
    case Ford
}

enum EngineСondition {
    case work
    case stop
    case emergencyWork
    case emergencyStop
    case broken
    case absent
}

enum WindowsСondition {
    case open
    case close
    case broken
    case absent
}

enum trunkStatus {
    case full
    case empty
}

// MARK: п.1.
// Описать несколько структур – любой легковой автомобиль и любой грузовик (Тут легковой)

typealias Truck = Car // Так как грузовики имеют теже своства, что и легковые, то просто создаю псевдоним

struct Car{
    
//MARK: п.2
// Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
    let brand: Brand
    let yearOfIssue: Int
    let trunkVolume: Double
    var litersInTank: Double
    var engineStatus: EngineСondition
    var windowsStatus: WindowsСondition
    var trunkfull: Double

//MARK: п.3
// Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
    enum Actions {
        case chengeStatusEngine(EngineСondition)
        case chengeStatusWindows(WindowsСondition)
        case trunkUpload(Double)
        case trunkUnload(Double)
    }
    
    init(brand: Brand, yearOfIssue: Int, trunkVolume: Double, litersInTank: Double, engineStatus: EngineСondition = .stop, windowsStatus: WindowsСondition = .close, trunkfull:Double = 0){
        self.brand = brand
        self.yearOfIssue = yearOfIssue
        self.trunkVolume = trunkVolume
        self.litersInTank = litersInTank
        self.engineStatus = engineStatus
        self.windowsStatus = windowsStatus
        self.trunkfull = trunkfull
    }
    
// MARK: п.4
// Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    
    mutating func action (_ argument: Actions){
        switch argument {
            case .chengeStatusEngine(let statusEn):
                if (self.engineStatus != .broken && self.engineStatus != .absent){
                    self.engineStatus = statusEn
                    print("ДВС", self.engineStatus)
                } else {
                    print("Вам нужно на СТО. ДВС", self.engineStatus)
                }
            
            case .chengeStatusWindows(let statusWin):
                if (self.windowsStatus != .absent && self.windowsStatus != .broken){
                    self.windowsStatus = statusWin
                    print("Окна", self.windowsStatus)
                } else {
                    print("Вам нужно на СТО. Окна", self.windowsStatus)
                }
            
            case .trunkUpload(let value):
                if (self.trunkfull + value) <= self.trunkVolume {
                    self.trunkfull += value
                    print("Свободно \(self.trunkVolume - self.trunkfull)")
                } else {
                    print("Нет места")
                }
            case .trunkUnload(let value):
                if (self.trunkfull - value) >= 0 {
                    self.trunkfull -= value
                    print("Выгружено на \(value) свободно \(self.trunkVolume - self.trunkfull)")
                } else {
                    print("Хм... столько нету")
                }
        }
    }
}

// MARK: п.5. п.6
// Инициализировать несколько экземпляров структур. Применить к ним различные действия.
// Вывести значения свойств экземпляров в консоль.
var oleg = Car(brand: .Nissan, yearOfIssue: 2009, trunkVolume: 100, litersInTank: 13) // Олег купил нормальную машину
var kolya = Car(brand: .Toyota, yearOfIssue: 2020, trunkVolume: 7, litersInTank: 54, windowsStatus: .absent) // Коля купил машину БЕЗ ОКОН
var vasya = Truck(brand: .Man, yearOfIssue: 1999, trunkVolume: 25000, litersInTank: 200) // Вася купил грузовик

oleg.action(.chengeStatusEngine(.work)) // Запустили мотор
oleg.action(.chengeStatusEngine(.stop)) // Остановили мотор
oleg.action(.chengeStatusWindows(.open)) // Открываем исправные окна
kolya.action(.chengeStatusWindows(.close)) // Пытаемся открыть окна которых нет
vasya.action(.trunkUpload(20000)) // Загрузился почти до верха
vasya.action(.trunkUpload(5000)) // Догрузил до полного
vasya.action(.trunkUpload(20000)) // Попытался загрузить ещё, не влезло
vasya.action(.trunkUnload(20000)) // Выгрузил 20000
vasya.action(.trunkUnload(5000)) // Выгрузил оставшееся

