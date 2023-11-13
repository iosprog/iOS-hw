var infoFriendAddress = ["Nikita":"Prokofiev 142", "Vova": "Pushkina 33"]

print(infoFriendAddress)

infoFriendAddress["Nikita"] = "Prokofiev 140"

print(infoFriendAddress)

let oldvalue = infoFriendAddress.updateValue("Tastak-1", forKey: "Vova")

print(infoFriendAddress)

if let oldvalue = infoFriendAddress.updateValue("Tastak-1", forKey: "Vova")
{
    print("Старый адрес \(oldvalue)")
}
else
{
    print("Адрес не сохранился")
}

/*
 if let removedvalue = infoFriendAddress.removeValue(forKey: "Vova")
{
    print("Старый адрес \(removedvalue) удален")
}
else
{
    print("Адрес не найден")
}
*/

let users = Array(infoFriendAddress.keys)
let address = Array(infoFriendAddress.values)

print(users)
print(address)
