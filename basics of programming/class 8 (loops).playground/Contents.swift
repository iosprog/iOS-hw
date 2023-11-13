for index in 1...7
{
    print("Эта цифра \(index)")
}

let cities = ["Amsterdam", "Paris", "Barcelona"]
for city in cities
{
    print("Я был в \(city)e")
}

for (index, letter) in "RAKHAT".enumerated()
{
    print("\(index). \(letter)")
}

let info = ["Вова": "Тастак-1", "Дима": "ЖК Сакура"]

for (name, address) in info
{
    print("\(name) живет в \(address)")
}

var age = 0
var kid = true

while kid {

    print("Ребенку \(age).")
    age += 1
    
    if age <= 2 {
        print("Еще младенец.\n")
    }
    else if age <= 6 {
        print("Ребенок ходит в садик.\n")
    }
    else if age <= 18 {
        print("Ребенок ходит в школу.\n")
    }
    else{
        print("Юноша ходит в университет.")
        kid = false
    }
}
