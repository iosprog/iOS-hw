//Лабораторная 4

//Задание 1

print("Лабораторная 4\n")
print("Задание 1")

var name = "Рахат"

print("Имя:",name)

let favoriteQuote = "\"Трава всегда зеленее на другой стороне\""

print("Любимая цитата:", favoriteQuote)

let emptyString = " "

    if emptyString.isEmpty
    {
        print("Там ничего нет\n")
    }
    else
    {
        print("Кажется там что-то есть\n")
    }

print("Задание 2")

let city: String = "Алматы,"
let region: String = " Алматинская область"
let home = city+region
    
print("Home:",home)

var intro = "Я живу в "

intro += home

print("Intro:",intro)

let age: Int = 21

print("Меня зовут \(name), и на следующий год мне будет \(age+1)\n")

print("Задание 3")

let surname = " Ерлан"
let fullName = name + surname

print("Полное имя:", fullName)

var previousBest = 10000
var newBest = 20000

let congratulations = "Поздравляем, \(fullName)! Вы превзошли свой предыдущий рекорд в \(previousBest) шагов, сделав \(newBest) шагов вчера!"

print(congratulations, "\n")

print("Задание 4.1")

let nameInLower = "ерлан рахат"
let nameInCaps = "Ерлан Рахат"

    if nameInLower == nameInCaps
        {
            print("Эти две строки равны")
        }
        else
            {
                print("Эти две строки не равны")
            }

    if nameInLower.lowercased() == nameInCaps.lowercased()
        {
            print("Имена \(nameInCaps) и \(nameInLower) совпадают\n")
        }
        else
            {
                print("Имена \(nameInCaps) и \(nameInLower) не совпадают\n")
            }

print("Задание 4.2")

let fullNameJr = "Robert Downey Sr."
let fullNameJr1 = "Robert Downey Jr."

    if fullNameJr.hasSuffix("Jr.")
    {
        print("Это имя используется второе поколение")
    }
        else
            {
            print("Это имя используется не второе поколение")
            }
    if fullNameJr1.hasSuffix("Jr.")
    {
        print("Это имя используется второе поколение\n")
    }
        else
            {
                print("Это имя используется не второе поколение\n")
            }

print("Задание 4.3")

let textToSearchThrough = "быть или не быть вот в чём вопрос"
let textToSearchFor = "быть или не быть"


if textToSearchThrough.contains(textToSearchFor)
    {
        print("Я нашел!\n")
    }
    else
        {
            print("Я не нашел\n")
}

print("Задание 4.4")

print(name.count)
