import UIKit
/*
 Objective
    . Create a base protocol with common properties or methods for monsters.
    . Derive two child protocols for specific monster types.
    . Create four classes (two flying and two water monsters) conforming to these child protocols.
    . Write a function that accepts a collection of Monster objects and prints details about each.
 
 Instructions
 
 Step 1: Define the Base Protocol
    . Monster with:
        - var name: String { get }
        - func roar() -> String
 
 Step 2: Define Child Protocols
    . FlyingMonster with:
        - var wingSpan: Double { get }
        - func fly() -> String
    . WaterMonster with:
        - var swimSpeed: Int { get }
        - func swim() -> String
 
 Step 3: Create Four Classes
    . Dragon and Gryphon conforming to FlyingMonster.
    . Kraken and Merfolk conforming to WaterMonster.
 
 Step 4: Create a Function to Handle Monsters
    . printMonsterDetails(monsters: [Monster]) to print information for each monster, using polymorphism to call appropriate methods based on their type.

 */
// =======================================>
// ===== Base Protocol =====.
protocol Monster {
    var name: String { get }
    
    func roar() -> String
} //Monster
// =======================================>
// ===== Child protocols =====.
protocol FlyingMonster: Monster {
    var wingSpan: Double { get }
    
    func fly() -> String
} // Flying Monster

protocol WaterMonster: Monster {
    var swimSpeed: Int { get }
    
    func swim() -> String
} // Water Monster

// =======================================>
// ===== Classes =====>
class Dragon: FlyingMonster {
    var name: String
    var wingSpan: Double
    
    init(name: String, wingSpan: Double) {
        self.name = name
        self.wingSpan = wingSpan
    }
    
    func fly() -> String {
        return "\(name) spreads its \(wingSpan)-meter wings and takes to the sky!"
    }
    func roar() -> String {
        return "\(name) roars fiercely, shaking the ground!"
    }
} // Dragon

class Gryphon: FlyingMonster {
    var name: String
    var wingSpan: Double
    
    init(name: String, wingSpan: Double) {
        self.name = name
        self.wingSpan = wingSpan
    }
    
    func fly() -> String {
        return "\(name) soars high with its majestic \(wingSpan)-meter wings!"
    }
    func roar() -> String {
        return "\(name) screeches with a piercing cry!"
    }
} // Gryphon

class Kraken: WaterMonster {
    var name: String
    var swimSpeed: Int
    
    init(name: String, swimSpeed: Int) {
        self.name = name
        self.swimSpeed = swimSpeed
    }
    
    func swim() -> String {
        return  "\(name) glides through the water at \(swimSpeed) knots!"
    }
    func roar() -> String {
       return "\(name) bellows from the deep, causing waves to crash!"
    }
} // Kraken

class Merfolk: WaterMonster {
    var name: String
    var swimSpeed: Int
    
    init(name: String, swimSpeed: Int) {
        self.name = name
        self.swimSpeed = swimSpeed
    }
    
    func swim() -> String {
        return "\(name) swims gracefully at \(swimSpeed) knots!"
    }
    func roar() -> String {
        return "\(name) sings an enchanting melody that stirs the seas!"
    }
} // Merfolk

// =======================================>
// ===== Function to Handle Monsters =====>
func printMonsterDetails(monsters: [Monster]) {
    for monster in monsters {
        print(monster.roar())
        
        if let flyingMonster = monster as? FlyingMonster {
            print(flyingMonster.fly())
        }
        else if let waterMonster = monster as? WaterMonster {
            print(waterMonster.swim())
        }
        print("-----------------------")
    }
}

// ================================================================>
// ===== Instantiating instances of each monster class =====>
var fireDrake = Dragon(name: "Fire Drake", wingSpan: 15.0)
var skyHunter = Gryphon(name: "Sky Hunter", wingSpan: 12.0)
var seaTerror = Kraken(name: "Sea Terror", swimSpeed: 20)
var coralQueen = Merfolk(name: "Coral Queen", swimSpeed: 10)

var monsters: [Monster] = [fireDrake, skyHunter, seaTerror, coralQueen] // Array of monsters

// Calling the function to print details for each monster
printMonsterDetails(monsters: monsters)
