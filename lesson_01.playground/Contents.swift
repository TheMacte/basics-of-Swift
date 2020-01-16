import UIKit

print("Задание 1")
/*
  Решить квадратное уравнение
*/
class equation {
   func quadratics(a: Double, b: Double, c: Double) -> String{
     if a == 0{ // Проверка коэффициента а
       let x_aIsZero: Double = c / b
       return("x = \(x_aIsZero)")
     } else {
       let D: Double = pow(b,2) - 4 * a * c // Расчёт Дискриминанта
       if D>0{
         let x1 = (-1 * b + pow(D,(1/2))) / 2 * a
         let x2 = (-1 * b - pow(D,(1/2))) / 2 * a
         return("x1 = \(x1) , x2=\(x2)")
       } else if D==0{
         let x = -1 * b  / 2 * a
         return("x1 = \(x)")
       } else {
         // Решение для дискретных чисел (Решение квадратных уравнений с отрицательным дискриминантом)
         let sqRoot_modul_D: Double = pow((D*(-1)),(1/2))
         let sqRoot_D_digNum = String(sqRoot_modul_D) + "i"
         let x1_digitalNumber: String = "(\(b*(-1)) + \(sqRoot_D_digNum))/ \(2 * a)"
         let x2_digitalNumber: String = "(\(b*(-1)) - \(sqRoot_D_digNum))/ \(2 * a)"
         return("x1 = \(x1_digitalNumber) , x2=\(x2_digitalNumber)")
       }
     }
   }
}

let myQuadratics = equation()
print(myQuadratics.quadratics(a: 1,b: -6,c: 1))

print("")

/*
  Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника
*/
print("Задание 2")

class triangle {
  let cathet1, cathet2: Double
  init(cathet1: Double, cathet2: Double) {
    self.cathet1 = cathet1
    self.cathet2 = cathet2
  }

   func area() -> Double{
     let half_perimeter: Double = perimeter()/2
     let area: Double = pow((half_perimeter * (half_perimeter - self.cathet1) * (half_perimeter - self.cathet2) * (half_perimeter - hypotenuse())), (1/2))
     return area
   }
   func perimeter() -> Double{
     let perimeter: Double = self.cathet1 + self.cathet2 + hypotenuse()
     return perimeter
   }
   func hypotenuse() -> Double{
     let hypotenuse: Double = pow((pow(self.cathet1,2) + pow(self.cathet2,2)),(1/2))
     return hypotenuse
   }
}

let mytriangle = triangle(cathet1: 8, cathet2: 7)
print(mytriangle.hypotenuse())
print(mytriangle.perimeter())
print(mytriangle.area())

print("")

/*
  Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
*/
class depositInBank {
    var deposit, interest: Double
    var years:Double = 5
    init(deposit:Double, interest:Double) {
        self.deposit = deposit
        self.interest = interest
    }
    func depositTime (){
      print("Вы положили \(self.deposit)руб. на \(years)лет под \(self.interest)%") // TODO красивое отображенеи цифр
      while years > 0{
        self.deposit =  (((self.deposit * ((self.interest/100)+1))*100).rounded())/100 //Узнать есть ли нормальный способ округления до сотых
        years -= 1
        if years == 0{
          print("Вклад закрыт, итоговая сумма: \(self.deposit)")
        } else {
        print("На конец года ваш депозит равен \(self.deposit), осталось \(years)лет")
        }
      }
    }
}

print("Задание 3")

print("Укажите сумму вклада")
let myDeposit:Double = Double(readLine() ?? "100")!
print("Укажите годовой процент")
let myInterest:Double = (Double(readLine() ?? "6")!)


if myDeposit > 0 { // Процент не проверяется, т.к. может быть отрицательным
    let newDeposit = depositInBank(deposit:myDeposit, interest:myInterest)
    //newDeposit.years = 10 // Как вариант смены
    newDeposit.depositTime()
}
