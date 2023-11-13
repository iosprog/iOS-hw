/*
struct Shirt{
    var size: String
    var color: String
}

let myShirt = Shirt(size: "XL", color: "Blue")
let yourShirt = Shirt(size: "M", color: "Red")

print(myShirt.size, ",", myShirt.color)
*/

/*
struct Movie{
    var production: String
    var premiere: String
    var age: String
    var director: String
    
    func Film() {
        print("The production: \(production), release date: \(premiere), age: \(age), director: \(director)")
    }
}

let description = Movie(production: "USA, 2023", premiere: "12.10.2023", age: "16+", director: "Pierre Morel")


print("\(description.production), \(description.premiere), \(description.age), \(description.director)")
description.Film()
*/

struct Odometr {
    var count: Int = 0
}

let odometr = Odometr(count: 2)
print(odometr.count)

struct BankAccount {
    var accountNumber: Int
    var balance: Double = 0
}
let newAcc = BankAccount(accountNumber: 100, balance: 123)
print(newAcc.balance)
let trasferredAcc = BankAccount(accountNumber: 200, balance: 300)
print(trasferredAcc.balance)

struct Currency {
    var tenge: Double
    
    init(ten: Double) {
        self.tenge = ten
    }
    
    init(dollar: Double){
        tenge = dollar * 480
    }
        
        init(ru: Double){
            tenge = ru * 5
        
    }
    
}

let money = Currency(ten: 600)
let moneyDollar = Currency(dollar: 400)
let moneyRu = Currency(ru: 400)

print(money.tenge)
print(moneyDollar.tenge)
print(moneyRu.tenge)
