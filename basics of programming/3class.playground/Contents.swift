/*

var password = "qwerty123"

print(password.isEmpty)

if password.isEmpty {
    print("Введите пароль")
}
else
{
    print("Авторизация...")
}

//Соединение

let name = "Rakhat"

let surname = " Yerlan"

var fullName = name + surname

fullName += ", Hello!"

print(fullName)

//Принт перемен или констант

let name1 = "Рахат"
var age = 21
let city = "Алматы"

print("\(name1)y \(age). Он из города \(city).")


let a = 30
let b = 21

print("Если а = \(a) и b = \(b), тогда a - b = \(a-b).")


var login = "test2"
let pass1 = "Hello"
let enteredLogin = "test1"
let enteredPassword = "Hello"

if login == enteredLogin
    {
    print("Логины одинаковые.")
    }
else
    {
    print("Логины не совпадают")
    }
if pass1 == enteredPassword {
    print("Пароли одинаковые.")
    }
else
    {
    print("Пароли не совпадают")
    }

let name2 = "Rakhat Yerlan"
print(name2.lowercased())
print("RakHaT YerLaN".uppercased())

if name.lowercased() == "RakHaT YerLaN".lowercased()
{
print("Они одинаковые.")
}
 
*/

/*
let p1 = "Yerlan Rakhat Yerlanuly"
let p2 = "Abselemov Alan Yerlanuly"

if p1.hasPrefix("Yerlan") && p2.hasPrefix("Yerlan")
{
    print("Родственники")
}
else
{
    print("Не родственники")
}

print(p2.hasSuffix("Pitt"))

print(p1.hasSuffix("Wick"))
print(p2.hasSuffix("Pitt"))
 */

let greeting: String = "Hello World!"
if greeting.contains(String("World!")) {
    print("contains")
}
