var names : [String] = ["Rakhat", "Alan", "Vova"]

print(names)

var array = [String](repeating: "Almaty", count: 5)
print(array)

print(array.count)

print(array.isEmpty)

if names.isEmpty
{
    print("Еще никто не пришел")
}
else
{
    print("Вас ожидают")
}

print(names[1])

names[2] = "Aidar"

print(names)

names.append("Vova")
names.insert("Ainur", at: 0)

print(names)

names.remove(at: 0)

print(names)

names.removeLast()

print(names)

var name = ["Rakhat"]
var surname = ["Yerlan"]
let splitArray = name + surname

print(splitArray)

let array1 = [1,2,3]
let array2 = [4,5,6]
let array3 = [7,8,9]

let containerArray = [array1, array2, array3]
let firstArray = containerArray[2][2]

print(firstArray)
