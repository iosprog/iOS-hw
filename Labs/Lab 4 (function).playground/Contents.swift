//Лабораторная 4

//Задание 1

print("Задание 1")

func introduceMyself() -> String
{
    "Hello, my name is Rakhat. I'm 21 y.o. I am a senior student at Kimep University"
}
print(introduceMyself())

print("\n")

//Задание 2(1)

print("Задание 2(1)")

var sum = 0

func incrementSteps(_ steps: Int)
{
    for _ in 0...steps
    {
        sum += 1
        print(sum)
    }
}
incrementSteps(3)

print("\n")

//Задание 2(2)

print("Задание 2(2)")

func progressUpdate(steps: Int, goal: Int)
{
    if steps<(goal/10)
    {
        print("У вас хорошее начало")
    }
    
    else if steps<(goal/2)
    {
        print("Вы почти на полпути!")
    }
    
    else if steps<=((goal/100) * 50)
    {
        print("Вы на полпути!")
    }
    
    else if steps<((goal/100) * 90) || steps<goal
    {
        print("Вы почти у цели!")
    }
    
    else if steps == goal
    {
        print("Вы достигли свою цель!")
    }
    
    else
    {
        print("Вы превзошли свою цель!")
    }
    
}
progressUpdate(steps: 3000, goal: 10000)

print("\n")

//Задание 3

print("Задание 3")

func introduction(_ name: String,_ home: String,_ age: Int)
{
    print("\(name), \(age) год(а), город \(home)")
}

introduction("Rakhat", "Almaty", 21)

print("\n")

//Задание 4(1)

print("Задание 4(1)")

progressUpdate(steps: 7000, goal: 10000)
progressUpdate(steps: 10000, goal: 20000)
progressUpdate(steps: 30001, goal: 30000)

print("\n")

//Задание 4(2)

print("Задание 4(2)")

func pacing(currentDistance: Double, totalDistance: Double, currentTime: Double, goalTime: Double)
{
    var pace: Double
    pace = currentTime/(currentDistance/totalDistance)
    
    if pace>goalTime
    {
        print("Так держать!")
    }
    else
    {
        print("Тебе нужно немного поднапрячься!")
    }
}
pacing(currentDistance: 50, totalDistance: 100,
       currentTime: 3.15, goalTime: 2)

print("\n")

//Задание 5(1)

print("Задание 5(1)")

func greeting(_ name: String) -> String
{
    "Привет, \(name), как твои дела?"
}
print(greeting("Рахат"))
print("\n")

//Задание 5(2)

print("Задание 5(2)")

func equation(a: Int, b: Int) -> Int
{
    a * b + 2
}
print(equation(a: 2, b: 2))
