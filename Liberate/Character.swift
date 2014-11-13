//
//  Character.swift
//  Liberate
//
//  Created by Joshua Pepperman on 11/5/14.
//  Copyright (c) 2014 Joshua Pepperman. All rights reserved.
//

import SpriteKit

class Character
{
	var currently: String
	
	var sprite: SKSpriteNode
	var standing1: String
	var standing2: String
	
	var inventory: Array<Item?> = []
	var moveSet: Array<Move?> = []
	var stats: [String : Int]
	
	var moveList: MoveList
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
	}
	
	func setUpMoves()
	{
		self.moveList = MoveList(character: self)
		moveSet.append(moveList.getMove("punch"))
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
		var pos: CGPoint = sprite.position
		return pos
	}
	
	func addMove(moveToAdd: Move)
	{
		self.moveSet.append(moveToAdd)
	}
	
	func doMove(moveToDo: String)
	{
		//moveList.moveList[moveToDo]?.animate(self)
		moveList.moveList[moveToDo]?.animate()
	}
}