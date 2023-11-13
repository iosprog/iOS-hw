//Лабараторная 3

import Foundation

//Задание 1

print("Задание 1")

print("1.", 9 == 9)
print("2.", 9 != 9)
print("3.", 47 > 90)
print("4.", 47 < 90)
print("5.", 4 <= 4)
print("6.", 4 >= 5)
print("7.", (47 > 90) && (47 < 90))
print("8.", (47 > 90) || (47 < 90))
print("9.", !true, "\n")

//Задание 2

print("Задание 2")

var tenge = 450

if tenge <= 0
{
    print("Извини, но ты на мели")
}
else if tenge <= 400
{
    print("Вау, у тебя есть деньги на пирожки!")
}
else
{
    print("Ого, поедешь домой на такси", "\n")
}

//Задание 3

print("Задание 3")

let rest1 = ["Fish", "Pizza"]

let rest2 = ["Vegan"]

let rest3 = ["Fish", "Pizza", "Vegan"]

print("The menu for the 1st restaurant:")

    for menu1 in rest1
    {
        print("\(menu1)")
    }

print("The menu for the 2nd restaurant:")

    for menu2 in rest2
    {
        print("\(menu2)")
    }

print("The menu for the 3rd restaurant:")

    for menu3 in rest3
    {
        print("\(menu3)")
    }

if rest1.contains("Fish") && rest1.contains("Pizza")&&rest1.contains("Vegan")
{
    print("Let's go to the 1st restaurant!", "\n")
}
else if rest2.contains("Fish") && rest2.contains("Pizza")&&rest2.contains("Vegan")
{
    print("Let's go to the 3nd restaurant!", "\n")
}
else if rest3.contains("Fish") && rest3.contains("Pizza")&&rest3.contains("Vegan")
{
    print("Let's go to the 3rd restaurant!", "\n")
}
else{
    print("No, let's find another one")
}

 
//Задание 4

print("Задание 4")

let isNiceWeather = 23

let weather = "Rainy"

let weather2 = "Sunny"

    if isNiceWeather >= 27 && weather != "Rainy"
    {
        print("true1")
    }
    else if isNiceWeather >= 27 && weather2 == "Sunny"
    {
        print("true2")
    }
    else
    {
        print("Остаюсь дома :(")
    }
