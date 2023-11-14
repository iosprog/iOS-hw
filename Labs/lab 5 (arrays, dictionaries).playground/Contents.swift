//Лабораторная 5

//Задание 1

print("Задание 1")

var registrationList = [String]()

registrationList.append("Sara")

print(registrationList)

registrationList += ["Max", "Michael", "Jack", "Nicole"]

print(registrationList)

registrationList.insert("Almas", at: 1)

print(registrationList)

registrationList[5] = "Alua"

print(registrationList)

let deletedItem = registrationList.removeLast()

print("Deleted item from registrationList: \(deletedItem)")
print(registrationList, "\n")

//Задание 2

print("Задание 2")

var exercise1: [String] = ["Упражнения для бега", "Упражнения по гимнастике"]

var exercise2: [String] = ["Упражнения для ходьбы", "Силовые упражнения"]

var challenges = [exercise1, exercise2]

print(challenges[1][0])

challenges.removeAll()

var exercise3: [String] = ["Балансировочные упражнения"]

    if exercise3.isEmpty
    {
        print("Начнем делать упражнения?")
    }
    else if exercise3.count == 1
    {
        print("Вы выбрали задание \"\(exercise3[0])\" \n")
    }
    else
    {
        print("Вы выбрали несколько заданий \n")
    }

//Задание 3

print("Задание 3")

var dictionary: [String: Int] = ["January": 31, "February": 28, "March": 31]

print(dictionary)

dictionary["April"] = 30

print(dictionary)

dictionary.updateValue(29, forKey: "February")

print(dictionary)

    if let qDays = dictionary.updateValue(31, forKey: "January")
    {
        print("January has \(qDays) days \n")
    }

//Задание 4

print("Задание 4")

let shapesArray = ["Circle", "Square", "Triangle"]
let colorsArray = ["Red", "Green", "Blue"]

var newDict: [String: [String]] = ["Shapes": shapesArray , "Colors": colorsArray]

print(newDict)

    if let lastColor = newDict["Colors"]?.last
    {
        print("Последний элемент в массиве Colors: \(lastColor) \n")
    }
    else
    {
        print("Массив Colors пуст или не существует в словаре. \n")
    }

//Задание 5

print("Задание 5")

var dictSteps: [String: Double] = ["Easy": 10.0, "Medium": 8.0, "Fast": 6.0]

print(dictSteps)

dictSteps["Sprint"] = 4.0

print(dictSteps)

dictSteps.updateValue(7.5, forKey: "Medium")
dictSteps.updateValue(5.8, forKey: "Fast")

print(dictSteps)

dictSteps.removeValue(forKey: "Sprint")

print(dictSteps)

var selectedPace = "Medium"

if let speedPace = dictSteps[selectedPace]
{
    print("Хорошо! Я буду поддерживать вас в темпе \"\(speedPace)\" минута в милю")
}
else
{
    print("Вы не выбрали уровень")
}
