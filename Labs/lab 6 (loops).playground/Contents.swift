//Лабораторная 6

import Foundation

//Задание 1

print("Задание 1.1")

for i in 1...100
{
    print(i)
}

print("\n")
print("Задание 1.2")

let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

for (index, letter) in alphabet.enumerated()
{
    print("\(index+1). \(letter)")
}

print("\n")
print("Задание 1.3")

let dictionary: [String: String] = ["Столица Нидерландов": "Амстердам", "Столица Италии": "Рим", "Столица Франции": "Париж"]

for (dictKeys, dictValues) in dictionary
{
    print("\(dictKeys) - \(dictValues)")
}

print("\n")
print("Задание 2")

let exercises = ["Упражнения для бега", "Упражнения для ходьбы", "Плавание"]

let movements = ["Упражнения для ходьбы": 110, "Упражнения для бега": 160, "Плавание": 140]

for exercise in exercises {
    if let pulse = movements[exercise] {
        print("Вы выполняете упражнение: \"\(exercise)\". Средний пульс составляет \(pulse) ударов в минуту.")
    } else {
        print("Нет данных о среднем пульсе для упражнения \(exercise).")
    }
}

print("\n")
print("Задание 3")

var cube = 0

while cube != 1
{
    cube = Int.random(in: 1...6)
    print("Куб со значением = \(cube)")
}

print("Единица выпала! Игра окончена.")

print("\n")
print("Задание 4")

let cadence = 20
var testSteps = 0

var count = 0

while count<10
{
    print("\(count+1).Сделайте шаг")
    count += 1
    Thread.sleep(forTimeInterval: TimeInterval(60/cadence))
}

print("\n")
count = 0

repeat
{
    print("\(count+1).Сделайте шаг")
    count += 1
    Thread.sleep(forTimeInterval: TimeInterval(60/cadence))
}

while count<10

print("\n")
print("Задание 5")

let citiesWithCapLet: [String: String] = ["Almaty": "ALA", "Astana": "NQZ", "Aktobe": "АКХ", "Kyzylorda": "KZO"]

for (city, abbreviation) in citiesWithCapLet {
    
print("В городе \(city) заглавная буква - \(abbreviation).")
            
        if city == "Almaty"
        {
            print("Я нашел свой город!")
            break
        }
    }

print("\n")
print("Задание 6")

let lowHR = 80
let highHR = 150

let movementHeartRates = ["Walking": 120, "Running": 160, "Cycling": 130, "Swimming": 140, "Yoga": 80]

for (movement, heartRate) in movementHeartRates {
    if heartRate >= lowHR && heartRate <= highHR {
        print("Вы могли бы сделать \(movement).")
    }
}


print("\n")
print("Задание 8")

let array = [0, 1, 2, 3, 4, 1, 5, 6, 2, 1]

var countNumbers = 0
for i in array
{
    if i == 1
    {
        countNumbers += 1
    }
}
print("Всего количество цифр \"1\" в массиве array = \(countNumbers)")

