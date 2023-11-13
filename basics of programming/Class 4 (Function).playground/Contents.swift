func triple(value:Double)
{
    let result = value / 3
    print("Если разделить \(value) на 3, мы получим \(result).")
}

triple(value: 7)

func divide(firstNum: Double, secondNumb: Double)
{
    let result = firstNum / secondNumb
    print("Результат будет = \(result)")
}

divide(firstNum: 10, secondNumb: 2)


func add(_ firstNumber: Double, _ secondNumber: Double) -> String
{
    "firstNumber + secondNumber"
}
let total = add(14,8)

print(add(6, 7))

func display(_ teamName: String,_ score: Int = 2)
{
    print("\(teamName): \(score)")
}
display("Test", 5)
display("Test2")
