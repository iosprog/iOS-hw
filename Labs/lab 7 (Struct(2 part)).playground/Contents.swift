//Лабораторная 7

//Задание 1

print("Задание 1")
struct GPS
{
    var latitute = 0.0
    var longitude = 0.0
}

var sPlace = GPS()
print(sPlace.latitute)
print(sPlace.longitude)

sPlace.latitute = 51.514004
print("Latitute: \(sPlace.latitute)")

sPlace.longitude = 0.125226
print("Longitude: \(sPlace.longitude)\n")

//Задание 2

print("Задание 2")

struct Book
{
    var title = ""
    var author = ""
    var page = 0
    var price = 0.0
}

var favBook = Book(title: "Преступление и наказание", author: "Ф. Достоевский", page: 672, price: 800.0)

print("Моя любимая книга: \"\(favBook.title)\", автор: \(favBook.author), страниц: \(favBook.page), стоимость: \(favBook.price) тг. \n")

//Задание 3

print("Задание 3")

struct RunningWorkout
{
    var distance = 0.0
    var time = 0.0
    var elevation = 0.0
}

var firstRun = RunningWorkout()

(firstRun.distance = 2534)
firstRun.time = 15.3
firstRun.elevation = 94

print("Distance: \(firstRun.distance)")
print("Time: \(firstRun.time)")
print("Elevation: \(firstRun.elevation)\n")

//Задание 4

print("Задание 4")

struct GPS1
{
    var latitute: Double
    var longitude: Double
}

let somePlace = GPS1(latitute: 51.514004, longitude: 0.125226)

print("Latitute: \(somePlace.latitute)")
print("Longitude: \(somePlace.longitude)\n")

//Задание 5

print("Задание 5")

struct Book1
{
    var title: String
    var author: String
    var page: Int
    var price: Double
}

var favouriteBook = Book(title: "Преступление и наказание", author: "Ф. Достоевский", page: 672, price: 800.0)

print("Моя любимая книга: \"\(favouriteBook.title)\", автор: \(favouriteBook.author), страниц: \(favouriteBook.page), стоимость: \(favouriteBook.price) тг. \n")

//Задание 6

print("Задание 6")

struct Laptop
{
    var screenSize: Int = 13
    var repairCount: Int = 0
    var yearPurchased: Int
}

var personLaptop = Laptop(yearPurchased: 2023)

print("Screen size: \(personLaptop.screenSize)")
print("Repair count: \(personLaptop.repairCount)")
print("Year purchased: \(personLaptop.yearPurchased)\n")

//Задание 7

print("Задание 7")

struct Height
{
    var heightInInches: Double
    var heightInCentimeters: Double
    
    init(heightInCentimeters: Double)
    {
        self.heightInCentimeters = heightInCentimeters
        self.heightInInches = heightInCentimeters / 2.54
      
    }
    init(heightInInches: Double)
    {
        self.heightInInches = heightInInches
        self.heightInCentimeters = heightInInches * 2.54
    }
}

var someonesHeight = Height(heightInInches: 66)

print("Height in inches: \(someonesHeight.heightInInches)")
print("Height in centimeters: \(someonesHeight.heightInCentimeters)\n")
    
//Задание 8

print("Задание 8")

struct User
{
    var name: String
    var age: Int
    var height: Double
    var weight: Double
    var activityLevel: Int
    
    var Rakhat: String
    {
     "My name is \(name). I am \(age) y.o. My height is about \(height) cm, and weight \(weight) kg. My activity level is \(activityLevel)."
    }
}

var userInfo = User(name: "Rakhat", age: 21, height: 176, weight: 61, activityLevel: 10)

print(userInfo.Rakhat, "\n")

//Задание 9

print("Задание 9")

struct Distance
{
    var meters: Double
    var feet: Double
    
    init(meters: Double)
    {
        self.meters = meters
        self.feet = meters * 3.28084
      
    }
    init(feet: Double)
    {
        self.feet = feet
        self.meters = feet / 3.28084
    }
}

var mile = Distance(meters: 1600)

print("Meters: \(mile.meters)")
print("Feet: \(mile.feet)\n")

var distanceFeet = Distance(feet: 6000)

print("Feet: \(distanceFeet.feet)")
print("Meters: \(distanceFeet.meters)\n")

//Задание 10

print("Задание 10")

struct Book2
{
    var title: String
    var author: String
    var page: Int
    var price: Double
    var facts: String
}

var myBook = Book2(title: "Преступление и наказание", author: "Ф. Достоевский", page: 672, price: 800.0, facts: "Достоевский мог бы вообще не написать этот роман, его чуть не казнили" )

print("Моя любимая книга: \"\(myBook.title)\", автор: \(myBook.author), факты о книге: \(myBook.facts), страниц: \(myBook.page), стоимость: \(myBook.price) тг. \n")

//Задание 11

print("Задание 11")

struct Post
{
    var message: String
    var likes: Int
    var numberOfComments: Int
    
    mutating func Like() {
       likes += 1
     }
}

var post = Post(message: "Hello", likes: 0, numberOfComments: 0)
print("Likes before: \(post.likes)")

post.Like()
print("Likes after: \(post.likes)\n")

//Задание 12

print("Задание 12")

struct runningWorkout
{
    var distance: Double
    var time: Double
    var elevation: Double
    
    func postWorkoutStats()
    {
            print("Distance: \(distance)")
            print("Time: \(time)")
            print("Elevation: \(elevation)\n")
    }
}

var myWorkout = runningWorkout(distance: 5.0, time: 30.0, elevation: 50.0)

myWorkout.postWorkoutStats()

//Задание 13

print("Задание 13")

struct Steps
{
    var steps: Int
    var goal: Int
    
    mutating func takeStep()
    {
        steps += 1
    }
}

var steps = Steps(steps: 0, goal: 10000)
print("Steps before: \(steps.steps)")

steps.takeStep()
print("Steps after: \(steps.steps)\n")

//Задание 14

print("Задание 14")

struct Rectangle {
  var width: Double
  var height: Double

  func areaRectangle() -> Double
    {
    width * height
  }
}

var rectangle = Rectangle(width: 12.0, height: 3.0)

let area = rectangle.areaRectangle()

print("Площадь прямоугольника: \(area)\n")

//Задание 15

print("Задание 15")

struct Height1 {
    var heightInInches: Double {
        didSet{
            let inCm = heightInInches*2.54
            if heightInCentimeters != inCm {
                heightInCentimeters = inCm
                print("Поменяли значение")
            }
        }
    }
    
    var heightInCentimeters: Double {
        
        didSet{
            let inInch = heightInCentimeters/2.54
            if heightInInches != inInch {
                heightInInches = inInch
            }
        }
    }
     
    
    init(heightInInches: Double) {
        self.heightInInches = heightInInches
        self.heightInCentimeters = heightInInches*2.54
    }
    
    init(heightInCentimeters: Double) {
        self.heightInCentimeters = heightInCentimeters
        self.heightInInches = heightInCentimeters/2.54
    }
}

var height = Height(heightInCentimeters: 70)
height.heightInCentimeters = 76
print(height.heightInInches)

//Задание 16

print("Задание 16")

struct runningWorkout1 {
    
    var distance: Double
    var time: Double
    var elevation: Double
    
    func averageMileTime() -> Double
    {
        time/distance
    }
}

var runWorkout = runningWorkout1(distance: 30.0, time: 5.0, elevation: 20.0)

var avgMileTime = runWorkout.averageMileTime()

print("Average mile time: \(avgMileTime)\n")

var runWorkout2 = runningWorkout1(distance: 40.0, time: 6.0, elevation: 18.0)

var avgMileTime2 = runWorkout2.averageMileTime()

print("Average mile time: \(avgMileTime2)\n")

//Задание 17

print("Задание 17\n")

//Задание 18

print("Задание 18")

struct User1 {
    
    var userName: String
    var email: String
    var age: Int
    
    func currentUser ()
    {
        
    }
}


