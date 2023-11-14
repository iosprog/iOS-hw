//Лабораторная 8

//Задание 1

print("Задание 1")
class Spaceship
{
    var name = ""
    var health = 0
    var position = 0
    
    init(name: String, health: Int, position: Int)
    {
        self.name = name
        self.health = health
        self.position = position
    }
    
    func moveLeft()
    {
        position -= 1
        print("Сдвиг на 1 позицию влево = \(position)")
    }
     
    func moveRight()
    {
        position += 1
        print("Сдвиг на 1 позицию вправо = \(position)")
    }
    
    func wasHit()
    {
        health -= 5
        if health <= 0
        {
            print("Извините, ваш корабль был сбит слишком много раз. Хотите сыграть еще раз?")
        }
    }
   
}
let falcon = Spaceship(name: "Falcon", health: 10, position: 10)

for _ in 0...1
{
    falcon.moveLeft()
}
falcon.moveRight()
falcon.wasHit()

print("Name: \(falcon.name)")
print("Health: \(falcon.health)")
print("Position: \(falcon.position)\n")

//Задание 2

print("Задание 2")

class Fighter: Spaceship
{
    var weapon = ""
    var remainingFirePower = 5
    
    init(weapon: String, remainingFirePower: Int, name: String, health: Int, position: Int)
    {
        self.weapon = weapon
        self.remainingFirePower = remainingFirePower
        super.init(name: name, health: health, position: position)
    }
    
    func fire()
    {
        if remainingFirePower > 0
        {
            remainingFirePower -= 1
            print("Кол-во уменьшилось на 1 единицу")
        }
        else if remainingFirePower <= 0
        {
            print("У вас больше нет оружейной мощности")
        }
    }
}

let destroyer = Fighter(weapon: "Laser", remainingFirePower: 10, name: "Destroyer", health: 15, position: 15)

destroyer.name = "Destroyer"
print("Position: \(destroyer.position)")

destroyer.moveRight()

print("Position: \(destroyer.position)")

//falcon.weapon - weapon находится не в родительском классе

for _ in 0...destroyer.remainingFirePower
{
    print(destroyer.remainingFirePower)
    destroyer.fire()
}

//Задание 3

print("\nЗаданиe 3")

class ShieldedShip: Fighter
{
    var shieldStrength = 25
    
    init(shieldStrength: Int, weapon: String, remainingFirePower: Int, name: String, health: Int, position: Int)
    {
        self.shieldStrength = shieldStrength
        super.init(weapon: weapon, remainingFirePower: remainingFirePower, name: name, health: health, position: position)
    }
    
    override func wasHit() {
        if shieldStrength > 0
        {
            shieldStrength -= 5
        }
        else
        {
            super.wasHit()
        }
    }
}

let defender = ShieldedShip(shieldStrength: 25, weapon: "Cannon", remainingFirePower: 15, name: "Defender", health: 20, position: 20)

defender.moveRight()
print("Position: \(defender.position)")

defender.fire()
print("Fire Power: \(defender.remainingFirePower)")

defender.wasHit()
print("Shield Strength = \(defender.shieldStrength)")
print("Health = \(defender.health)\n")

//Задание 4

print("Заданиe 4")

let sameShip = falcon

print(sameShip.position)
print(falcon.position)

sameShip.moveLeft()

print(sameShip.position)
print(falcon.position, "\n")

print("В случае class, sameShip напрямую ссылается на falcon, соответственно имеет одно и то же значение. В случае struct, данные хранятся по значению, а не по ссылке. Когда мы создаем копию структуры, мы копируем ее значения, а не ссылку на оригинальную структуру.")
