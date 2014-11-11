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
	var sprite: SKSpriteNode
	var standing1: String
	var standing2: String
	
	var inventory: Array<Item?>
	//var moveSet: Array<Move?>
	var stats: [String : Int]
	
	
	/**
		Sets up the character.
	
		:param: scene the scene the character belongs to
		:param: standing1 the string name of the file of the first standing animation for this character
		:param: standing2 the string name of the file of the second standing animation for this character
	*/
	init(standing1: String, standing2: String)
	{
		sprite = SKSpriteNode()
		self.standing1 = standing1
		self.standing2 = standing2
		
		self.inventory = []
		self.stats = [
			"health" : 20,
			"attack" : 5,
			"defense": 5
		]
	}
	
	/**
		Sets up the character.
		
		:param: scene the scene the character belongs to
		:param: standing1 the string name of the file of the first standing animation for this character
		:param: standing2 the string name of the file of the second standing animation for this character
		:param: inventory the list of items this character has
		:param: stats this characters stats
	*/
	init(standing1: String, standing2: String, inventory: Array<Item?>, stats: [String : Int])
	{
		sprite = SKSpriteNode()
		self.standing1 = standing1
		self.standing2 = standing2

		self.inventory = inventory
		self.stats = stats
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
	}


}