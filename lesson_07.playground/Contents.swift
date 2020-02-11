import Foundation

/*
1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.

2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.
*/
enum EngineActions{
    case start
    case stop
    case ckickDown
    case test
}

enum EngineErrors: Error{
    case a01A
    case a02A
    case a44C
    case dDD7
}

class Car {
    enum EngineStatus{
        case go
        case off
        case maximum
    }
    
    var oil:Int
    var gaz:Int
    var brack:Int
    var water:Int
    
    
    var name:String
    var number:String
    var engineStatus:EngineStatus = .off
    
    init(name:String, number:String, oil:Int = 10, gaz:Int = 10, brack:Int = 10, water:Int = 10) {
        self.name = name
        self.number = number
        self.oil = oil
        self.gaz = gaz
        self.brack = brack
        self.water = water
    }
    
    func engine(command:EngineActions) throws {
        switch command{
            case .start:
                engineStatus = .go
                print("Двигатель запущен")
            case .stop:
                engineStatus = .off
                print("Двигатель остановлен")
            case .ckickDown:
                engineStatus = .maximum
                print("Максимальный режим работы")
            case .test:
                print("Начало теста")
                engineStatus = .go
                do{
                    try carTest(oil:oil, gaz:gaz, brack:brack, water:water)
                } catch EngineErrors.a01A{
                    print("Долейте масла")
                }
                catch EngineErrors.a02A{
                    print("Долейте бензина")
                } catch EngineErrors.a44C{
                    print("Пора сменить колодки")
                } catch EngineErrors.dDD7{
                    print("Долейте жидкость омывателя")
                }
                engineStatus = .off
                print("конец теста")
        }
    }
    
    func carTest (oil:Int, gaz:Int, brack:Int, water:Int) throws  {
        guard oil > 3 else { throw EngineErrors.a01A }
        guard gaz > 3 else { throw EngineErrors.a02A }
        guard brack > 3 else { throw EngineErrors.a44C }
        guard water > 3 else { throw EngineErrors.dDD7 }

        do{
            try engine(command: .start)
            try engine(command: .ckickDown)
            try engine(command: .stop)
        }
    }
}

class UsedCar:Car {
    override init(name: String, number: String, oil: Int = 0, gaz: Int = 0, brack: Int = 0, water: Int = 0) {
        super.init(name: name, number: number, oil: oil, gaz: gaz, brack: brack, water: water)
        self.oil = Int.random(in: 0...9)
        self.oil = Int.random(in: 0...9)
        self.oil = Int.random(in: 0...9)
        self.oil = Int.random(in: 0...9)
    }
}

var oleg = Car(name: "Nissan", number: "x000xx00")
try oleg.engine(command: .test)

var kolya = UsedCar(name: "Mazda", number: "е99кх99")
try kolya.engine(command: .test)

