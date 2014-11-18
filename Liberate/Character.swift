//
//  Character.swift
//  Liberate
//
//  Created by Joshua Pepperman on 11/5/14.
//  Copyright (c) 2014 Joshua Pepperman. All rights reserved.
//

import SpriteKit

/**
	This class defines a Character. There should be no plain characters in the game, as this will just give the Hero and the
	enemies some basic things that they all need.
*/
class Character
{
	var currently: String
	
	var sprite: SKSpriteNode
	var standing1: String
	var standing2: String
	
	var inventory: Array<Item?> = []
	var moveSet: [Move] = []
	var stats: [String : Int]
	var health: Int
	
	let healthLabel = SKLabelNode(fontNamed: "OpenSans-Bold")
	
	var moveList: MoveList
	
//	init()
//	{
//		self.currently = "nothing"
//		self.moveList = MoveList()
//		
//		sprite = SKSpriteNode()
//		sprite.anchorPoint = CGPoint(x: 0.5, y: 0)
//		self.standing1 = ""
//		self.standing2 = ""
//		
//		self.inventory = []
//		self.stats = [
//			"health" : 20,
//			"attack" : 5,
//			"defense": 5
//		]
//		
//		self.health = self.stats["health"]!
//	}
	
	/**
		Sets up the character.
	
		:param: standing1 the string name of the file of the first standing animation for this character
		:param: standing2 the string name of the file of the second standing animation for this character
	*/
	init(standing1: String, standing2: String)
	{
		self.currently = "nothing"
		self.moveList = MoveList()
		
		sprite = SKSpriteNode()
		sprite.anchorPoint = CGPoint(x: 0.5, y: 0)
		self.standing1 = standing1
		self.standing2 = standing2
		
		self.inventory = []
		self.stats = [
			"health" : 20,
			"attack" : 5,
			"defense": 5
		]
		
		self.health = self.stats["health"]!
	}
	
	private func setUpMoves()
	{
		self.moveList = MoveList(attacker: self)
		moveSet.append(moveList.getMove("blank"))
		moveSet.append(moveList.getMove("punch"))
		moveSet.append(moveList.getMove("blank"))
		moveSet.append(moveList.getMove("kick"))
	}
	
	/**
		Sets up the character.
		
		:param: standing1 the string name of the file of the first standing animation for this character
		:param: standing2 the string name of the file of the second standing animation for this character
		:param: inventory the list of items this character has
		:param: stats this characters stats
	*/
	init(standing1: String, standing2: String, inventory: Array<Item?>, stats: [String : Int])
	{
		self.currently = "nothing"
		
		sprite = SKSpriteNode()
		self.standing1 = standing1
		self.standing2 = standing2

		self.inventory = inventory
		self.stats = stats
		
		self.moveList = MoveList()
		
		self.health = self.stats["health"]!
	}
	
	/**
		Animates the character standing.
	*/
	func stand()
	{
		let standAnimation = SKAction.animateWithTextures([
			SKTexture(imageNamed: standing1),
			SKTexture(imageNamed: standing2)
			], timePerFrame: 0.5)
		
		let stand = SKAction.repeatActionForever(standAnimation)
		
		sprite.runAction(stand, withKey: "standing")
		
		self.currently = "standing"
		
		self.setUpMoves()
	}
	
	/**
		Gets the position of the character.

		:returns: the position of the character in its scene as a CGPoint
	*/
	func getPosition() -> CGPoint
	{
		return sprite.position
	}
	
	/**
		Adds a move to the character's moveSet.
	
		:param: moveToAdd the Move to add to the moveSet
		:param: position the directions swipe for the move to be added in. 0- up, 1- right, 2- down, 3- left
	*/
	func changeMove(moveToAdd: Move, position: Int)
	{
		switch position {
		case 0:
			moveSet[0] = moveToAdd
			break
		case 1:
			moveSet[1] = moveToAdd
			break
		case 2:
			moveSet[2] = moveToAdd
			break
		case 3:
			moveSet[3] = moveToAdd
			break
		default:
			break
		}
	}
	
	/**
		Makes this character do the move specified. This can do any move from the moveList
	
		:param: moveToDo the name of the Move to do
	*/
	private func doMove(moveToDo: String)
	{
		moveList.moveList[moveToDo]?.animate()
	}
	
	/**
		Makes this character do the move specified from its moveSet.
	
		:param: direction the direction of the swipe move. 0- up, 1- right, 2- down, 3- left
	*/
	func doMove(direction: Int)
	{
		switch direction {
		case 0:
			moveSet[0].animate()
			break
		case 1:
			moveSet[1].animate()
			break
		case 2:
			moveSet[2].animate()
			break
		case 3:
			moveSet[3].animate()
			break
		default:
			break
		}
	}
	
	func toString() -> String
	{
		var characterString: String = ""
		
		characterString += "Health: \(health)\n"
		var attack: Int = stats["attack"]!
		characterString += "Attack: \(attack)\n"
		var defense: Int = stats["defense"]!
		characterString += "Defense: \(defense)\n"
		
		
//		for (key, value) in stats
//		{
//			characterString += key + ": " + String(value)
//		}
		
		return characterString
	}
}