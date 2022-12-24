import Foundation

// MARK: - Protocols

protocol Coffee {
    var cost: Int { get }
    var description: String { get }
}

protocol CoffeeDecorator: Coffee {
    var baseCoffee: Coffee { get }
}

// MARK: - Coffee

final class SimpleCoffee: Coffee {
    private(set) var cost: Int

    var description: String {
        return "Prepared coffee for \(cost) c.u."
    }

    init(cost: Int = 200) {
        self.cost = cost
    }
}

// MARK: - CoffeeDecorator

final class WaterCoffee: CoffeeDecorator {
    var baseCoffee: Coffee

    var cost: Int {
        return baseCoffee.cost + 100
    }

    var description: String {
        return "Prepared coffee for \(cost) c.u."
    }

    init(baseCoffee: Coffee) {
        self.baseCoffee = baseCoffee
    }
}

final class MilkCoffee: CoffeeDecorator {
    var baseCoffee: Coffee

    var cost: Int {
        return baseCoffee.cost + 100
    }

    var description: String {
        return "Prepared coffee for \(cost) c.u."
    }

    init(baseCoffee: Coffee) {
        self.baseCoffee = baseCoffee
    }
}

final class WhipCoffee: CoffeeDecorator {
    var baseCoffee: Coffee

    var cost: Int {
        return baseCoffee.cost + 130
    }

    var description: String {
        return "Prepared coffee for \(cost) c.u."
    }

    init(baseCoffee: Coffee) {
        self.baseCoffee = baseCoffee
    }
}

final class SugarCofee: CoffeeDecorator {
    var baseCoffee: Coffee

    var cost: Int {
        return baseCoffee.cost + 50
    }

    var description: String {
        return "Prepared coffee for \(cost) c.u."
    }

    init(baseCoffee: Coffee) {
        self.baseCoffee = baseCoffee
    }
}

final class WhiskeyCoffee: CoffeeDecorator {
    var baseCoffee: Coffee

    var cost: Int {
        return baseCoffee.cost + 500
    }

    var description: String {
        return "Prepared coffee for \(cost) c.u."
    }

    init(baseCoffee: Coffee) {
        self.baseCoffee = baseCoffee
    }
}

final class SyropCoffee: CoffeeDecorator {
    var baseCoffee: Coffee

    var cost: Int {
        return baseCoffee.cost + 80
    }

    var description: String {
        return "Prepared coffee for \(cost) c.u."
    }

    init(baseCoffee: Coffee) {
        self.baseCoffee = baseCoffee
    }
}

// MARK: - Example using

var preparedCoffeeDrinks: [Coffee] = []

let espresso = SimpleCoffee()
preparedCoffeeDrinks.append(espresso)

let latte = MilkCoffee(baseCoffee: espresso)
let latteWithSugar = SugarCofee(baseCoffee: latte)
preparedCoffeeDrinks.append(latteWithSugar)

let cappuccino = MilkCoffee(baseCoffee: espresso)
let cappuccinoWithWhiskey = WhiskeyCoffee(baseCoffee: cappuccino)
preparedCoffeeDrinks.append(cappuccinoWithWhiskey)

let americano = WaterCoffee(baseCoffee: espresso)
let americanoWithSyrop = SyropCoffee(baseCoffee: americano)
let americanoWithSyropAndWhip = WhipCoffee(baseCoffee: americanoWithSyrop)
preparedCoffeeDrinks.append(americanoWithSyropAndWhip)

preparedCoffeeDrinks.forEach { coffee in
    print(coffee.description)
}

