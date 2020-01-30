import Foundation

/*
1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.
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

// MARK: п.1
// Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
class Car {
  // общие параметры
  var cost: Int
  var color: String
  var brand: Brand
  var engineStatus: EngineСondition
  var windowsStatus: WindowsСondition

  enum Actions { // Общие действия
      case chengeStatusEngine(EngineСondition)
      case chengeStatusWindows(WindowsСondition)
      case ckickDown
  }

  init(cost: Int, brand: Brand, color: String, engineStatus:EngineСondition = .stop, windowsStatus: WindowsСondition = .close) {
    self.cost = cost
    self.color = color
    self.brand = brand
    self.engineStatus = engineStatus
    self.windowsStatus = windowsStatus
  }

  func action (_ action: Actions){ // Общий метод действий
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
      default:
          print("ничего")

    }
  }
}

// MARK: п.2
// Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
class trunkCar: Car{

  enum ActionsTrunk { // Особенные действия
  case trunkUpload(Int)
  case trunkUnload(Int)
  }

  var carryingCapacity: Int // Отличительное свойство, вместимость для загрузки
  init(cost: Int, brand: Brand, color: String, engineStatus:EngineСondition = .stop, windowsStatus: WindowsСondition = .close, carryingCapacity: Int){
    self.carryingCapacity = carryingCapacity
    super.init(cost: cost, brand: brand, color: color, engineStatus: .stop, windowsStatus: .open)
  }

  func action (_ action: ActionsTrunk){ // Личный метод действий
    switch action {
      case .trunkUpload(let upload):
        carryingCapacity += upload
        print("Загружено", upload)
      case .trunkUnload(let unload):
        carryingCapacity -= unload
        print("Выгружено", unload)

    }
  }
}


class sportCar: Car{

  var clearance: Int // Отличительное свойство, дорожный просвет
  init(cost: Int, brand: Brand, color: String, engineStatus:EngineСondition = .stop, windowsStatus: WindowsСondition = .close, clearance: Int){
    self.clearance = clearance
    super.init(cost: cost, brand: brand, color: color, engineStatus: .stop, windowsStatus: .open)
  }

  override func action (_ action: Actions){ // Общий метод, переопределение
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
      case .ckickDown:
          print("На взлё-ёт!")
    }
  }

  func clearanceChange(size: Int){ // Уникальынй метод, только у спортивной машины
    self.clearance += size
  }
}


// Олег купил грузовик
var oleg = trunkCar(cost: 500_000, brand: .Man, color: "Blue",carryingCapacity:100)
oleg.action(.chengeStatusEngine(.work)) // Завёл двигатель
oleg.action(.trunkUpload(300)) // Загрузился
oleg.action(.ckickDown) // Выполнил то, что не предназначено для грузовиков
print(oleg.carryingCapacity)// Посмотрел в кузов

// Коля купил спортивный автомобиль
var kolya = sportCar(cost: 1_000_000, brand: .Nissan, color: "Red", engineStatus: .stop, windowsStatus: .open, clearance: 10) // Сразу с открытыми окнами
kolya.action(.chengeStatusEngine(.work)) // Завёл двигатель
kolya.action(.ckickDown) // Уехал в даль и больше его ни кто не видел
