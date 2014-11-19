//
//  MoveList.swift
//  Liberate
//
//  Created by Joshua Pepperman on 11/10/14.
//  Copyright (c) 2014 Joshua Pepperman. All rights reserved.
//

import SpriteKit

/**
	This class keeps the list of all moves useable by any character. The moves are created and set up in the initializer
	and then added there as well. Their animations are handled here so that any character can use them.
*/
class MoveList
{
	var moveList: [String: Move] = [:]
	let travelDist: CGFloat = 305
	
	init()
	{
		
	}
	
	/**
		Sets up MoveList by adding all available moves to the list.
	*/
	init(attacker: Character)
	{
		//blank
		func blank(){ }
		self.moveList.updateValue(Move(name: "blank", power: 5, description: "Does nothing.", animation: blank), forKey: "blank")
		
		//punch
		func punchAnimation()
		{
			var punchActionForward = SKAction.moveByX(travelDist, y: 0, duration: 0.1)
			var punchActionBackward = SKAction.moveByX(-travelDist, y: 0, duration: 0.2)
			
			attacker.runAction(punchActionForward)
			attacker.runAction(punchActionBackward)
			
		}
		self.moveList.updateValue(Move(name: "punch", power: 5, description: "Attacks the foe with fists.", animation: punchAnimation), forKey: "punch")
		
		//kick
		func kickAnimation()
		{
			var kickActionForward = SKAction.moveByX(travelDist, y: 50, duration: 0.1)
			var kickActionBackward = SKAction.moveByX(-travelDist, y: -50, duration: 0.2)
			
			attacker.runAction(kickActionForward)
			attacker.runAction(kickActionBackward)
		}
		self.moveList.updateValue(Move(name: "kick", power: 7, description: "Attacks the foe with feet.", animation: kickAnimation), forKey: "kick")
	}
	
	/**
		Gets the move with the name moveKey.
	
		:param: moveKey the name of the move to get
		:returns: the Move whose name is moveKey
	*/
	func getMove(moveKey: String) -> Move
	{
		return moveList[moveKey]!
	}
}

/**
	This class defines a Move. This is an attack that can be used by a character. It has a name, description, attack power, and animation.
*/
class Move
{
	var name: String
	var power: Int
	var description: String
	var animation: () -> ()
	
	/**
		Creates a Move. 
	
		:param: name the name of the move
		:param: power the power rating of the move
		:param: description the desctiprion of the move
		:param: animation the animation for the character doing the move
	*/
	init(name: String, power: Int, description: String, animation: () -> ())
	{
		self.name = name
		self.power = power
		self.description = description
		self.animation = animation
	}
	
	/**
		Animates the move on the character doing it.
	*/
	func animate()
	{
		animation()
	}
}
