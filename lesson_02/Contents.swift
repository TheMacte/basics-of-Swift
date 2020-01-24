import Foundation

/*
1. Написать функцию, которая определяет, четное число или нет.
*/
func isEven(_ number:Int) -> Bool {
  return number % 2 == 0 ? true : false
}

/*
2. Написать функцию, которая определяет, делится ли число без остатка на 3.
*/
func multipleOfThree(_ number:Int) -> Bool {
  return number % 3 == 0 ? true : false
}

/*
3. Создать возрастающий массив из 100 чисел.
*/
var arr: [Int] = Array(1...100)

/*
4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
*/
for i in arr where isEven(i) || multipleOfThree(i) {
    arr.remove(at: arr.firstIndex(of: i)!)
}

/*
5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
*/
func fibonacci(arr: inout [Float80]) -> [Float80] {
  var firstNumber:Float80 = 1
  var secondNumber:Float80 = 1
  var newNumber:Float80
  arr.append(firstNumber)
  arr.append(secondNumber)
  while (arr.count) < 100 {
    newNumber = firstNumber + secondNumber
    arr.append(newNumber)
    secondNumber = firstNumber
    firstNumber = newNumber
  }
  return arr
}

/*
var arr2:[Float80]=[]
print(fibonacci(arr: &arr2))
*/

/*
6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
    a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
    b. Пусть переменная p изначально равна двум — первому простому числу.
    c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа, кратные p: 2p, 3p, 4p, ...).
    d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
    e. Повторять шаги c и d, пока возможно.
*/

/*

НЕДАЛОСЬ... Явно нехватает знаний по работе с массивами. TODO прочитать больше про массивы и их свойства.

func prime(count:Int) -> [Int] {
  let n:Int = 10
  var nums:[Int] = Array(2...n) //a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
  var p:Int = 2 //b. Пусть переменная p изначально равна двум — первому простому числу.
  //var del:[Int] = [] // для отладки
  repeat {
    for i in stride(from: 2 * p, through: n, by: p) {// c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа, кратные p: 2p, 3p, 4p, ...).
      nums.remove(at: nums.firstIndex(of: i)!)
    }
   p = 
 } while p < nums.last! // d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.

  return nums
}
*/
