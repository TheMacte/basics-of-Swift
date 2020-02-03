import Foundation

/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 3. Создать два класса, имплементирующих протокол «Car» - TrunkCar и SportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести сами объекты в консоль.
 */

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

enum GeneralActions { // Общие действия
    case chengeStatusEngine(EngineСondition)
    case chengeStatusWindows(WindowsСondition)
}
enum Actions { // Общие действия
    case trunkUpload(Int)
    case trunkUnload(Int)
    case ckickDown
}

// MARK: п.1
// Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
protocol Car {
    var cost: Int {get set}
    var color: String {get set}
    var brand: Brand {get set}
    var engineStatus: EngineСondition {get set}
    var windowsStatus: WindowsСondition {get set}
    func action (_ action: Actions) // Общий метод действий
}

// MARK: п.2
// Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
extension Car {
    mutating func generalAction (_ action: GeneralActions){ // Общий метод действий
        switch action {
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
        }
    }
}

// MARK: п.3
// Создать два класса, имплементирующих протокол «Car» - TrunkCar и SportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
class TrunkCar: Car{
    func action(_ action: Actions) {
        switch action {
          case .trunkUpload(let upload):
            carryingCapacity += upload
            print("Загружено", upload)
          case .trunkUnload(let unload):
            carryingCapacity -= unload
            print("Выгружено", unload)
          default:
            print("Нет такой функции")
        }
    }
    
    var cost: Int
    var color: String
    var brand: Brand
    var engineStatus: EngineСondition
    var windowsStatus: WindowsСondition
    var carryingCapacity: Int // Отличительное свойство, вместимость для загрузки
    
    init(cost: Int, brand: Brand, color: String = "black", engineStatus: EngineСondition = .stop, windowsStatus: WindowsСondition = .close, carryingCapacity: Int){
        self.cost = cost
        self.carryingCapacity = carryingCapacity
        self.cost = cost
        self.brand = brand
        self.windowsStatus = windowsStatus
        self.engineStatus = engineStatus
        self.color = color
    }
       
}

class SportСar: Car{
    var cost: Int
    var color: String
    var brand: Brand
    var engineStatus: EngineСondition
    var windowsStatus: WindowsСondition
    var ckickDown: Bool = false // Отличительное свойство, вместимость для загрузки
    
    init(cost: Int, brand: Brand, color: String = "red", engineStatus: EngineСondition = .stop, windowsStatus: WindowsСondition = .close){
        self.cost = cost
        self.cost = cost
        self.brand = brand
        self.windowsStatus = windowsStatus
        self.engineStatus = engineStatus
        self.color = color
    }
    func action(_ action: Actions) {
        switch action {
          case .ckickDown:
            ckickDown = true
            print("Ракета!!!")
            ckickDown = false
          default:
            print("Нет такой функции")
        }
    }
    
    
}

// MARK: п.4
// Для каждого класса написать расширение, имплементирующее протокол
extension TrunkCar: CustomStringConvertible{
    var description: String {
        return("Грузовик, его можно загрузжать тоннами груза trunkUpload(Тонны) и trunkUnload(Тонны)")
    }
}
extension SportСar: CustomStringConvertible{
    var description: String {
        return("Супер кар, умеет ускоряться ckickDown")
    }
}

// MARK: п.5
//Создать несколько объектов каждого класса. Применить к ним различные действия.
var oleg = TrunkCar(cost: 500_000, brand: .Man, color: "Blue",carryingCapacity:100)
oleg.generalAction(.chengeStatusEngine(.work)) // Завёл двигатель
oleg.action(.trunkUpload(300)) // Загрузился
oleg.action(.ckickDown) // Выполнил то, что не предназначено для грузовиков

var kolya = SportСar(cost: 1_000_000_000, brand: .Toyota)
kolya.generalAction(.chengeStatusWindows(.open)) // Открыл окно
kolya.action(.ckickDown) // Супер ускорение


// MARK: п.6
//Вывести сами объекты в консоль.
print(oleg)
print(kolya)
