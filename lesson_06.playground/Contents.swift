import Foundation
/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */

//MARK: п.1
// Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.


struct Queue<T> {
    private var queue:[T]=[]
    
    mutating func push(_ newElement: T){
        queue.append(newElement)
    }
    
    mutating func pop() -> T?{
        guard !queue.isEmpty else { return nil }
        return queue.removeFirst()
    }
    
//MARK: п.2
// Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
    private let longitude: (String) -> Int = {$0.count}
    private func countElements(queue:[Int], ownLongitude: (String) -> Int ) -> [String]{
        var arrLongitude = [String]()
        for element in queue {
            let strElement = String(element)
            let newElement = String(ownLongitude(strElement))
            arrLongitude.append(newElement)
        }
        return arrLongitude
    }
    
    //Кривой метод, работает только для INTEGR, так ине смог вывернутьдаже для Double
    func sizer() -> [String] {
        guard let intQueue = self.queue as? [Int] else { return ["Только для Integer"] }
        return countElements(queue: intQueue, ownLongitude: longitude)
    }

//MARK: п.3
//Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу

        subscript(index: Int) -> Int? { // Просто предлагаю элемент как массив
            guard self.queue is [Int] else { return nil } //Понятия не имею что за конструкция, Xcode предложил
            return self.queue[index] as? Int
        }

}


var queueToGoogle = Queue<Int>()
var queueToYandex = Queue<Double>()

queueToGoogle.push(12)
queueToGoogle.push(117)
queueToGoogle.push(1123417)

queueToYandex.push(12.1)
queueToYandex.push(117.2)
queueToYandex.push(1123417.3)
//queueToGoogle.longitude()
print(queueToGoogle.sizer())
print(queueToYandex.sizer())
//print(queueToGoogle)
print(queueToYandex[1] as Any)
print(queueToGoogle[1] as Any)

