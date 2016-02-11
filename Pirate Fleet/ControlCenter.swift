//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}



struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
    
}



class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 0, y: 1), isVertical: false)
        let smallShip1 = Ship(length: 2, location: GridLocation(x: 0, y: 2), isVertical: false)
        let largeShip1 = Ship(length: 4, location: GridLocation(x: 0, y: 3), isVertical: false)
        let extralargeShip1 = Ship(length: 5, location: GridLocation(x: 0, y: 4), isVertical: false)
        //Mines
        let mine1 = Mine(location: GridLocation(x:6, y:3), explosionText: "Boom" )
        let mine2 = Mine(location: GridLocation(x:6, y:4), explosionText: "Boom" )
        
         human.addShipToGrid(mediumShip1)
         human.addShipToGrid(mediumShip2)
         human.addShipToGrid(smallShip1)
         human.addShipToGrid(largeShip1)
         human.addShipToGrid(extralargeShip1)
         human.addMineToGrid(mine1)
         human.addMineToGrid(mine2)
        
        
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int = 0
        let totalHumanShips: Int = 5
        let totalEnemyShips: Int = 5
        
        let enemyShipsSunk = totalEnemyShips - gameStats.enemyShipsRemaining
        let humanShipsRemaining = totalHumanShips - gameStats.humanShipsSunk
        let numberOfGuesses = gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman
        
        
        finalScore = (enemyShipsSunk * gameStats.sinkBonus) + (humanShipsRemaining * gameStats.shipBonus) - (numberOfGuesses * gameStats.guessPenalty)
        
        
        return finalScore
    }
}