let temperature = 70

    switch temperature{
        
    case ..<0:
        print("Слишком холодно")
        
    case 65...75:
        print("Температура идеальная")
        
    case 75...100:
        print("Слишком горячо")
        
default:
    print("Ошибка")
}

var largest: Int

let steak = 5000

let soup = 1500

largest = steak>soup ? steak:soup

print(largest)
