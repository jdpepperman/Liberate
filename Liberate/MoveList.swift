//
//  MoveList.swift
//  Liberate
//
//  Created by Joshua Pepperman on 11/10/14.
//  Copyright (c) 2014 Joshua Pepperman. All rights reserved.
//

import SpriteKit

/**
This should have a list of moves with their names, descriptions, and attack powers.
*/
class MoveList
{
	var moveList: [String: Move] = [:]
	
	init()
	{
		
	}
	
	/**
		Sets up MoveList by adding all available moves to the list.
	*/
	init(character: Character)
	{
		//punch
		func punchAnimation()
		{
			var punchActionForward = SKAction.moveByX(300, y: 0, duration: 0.1)
			var punchActionBackward = SKAction.moveByX(-300, y: 0, duration: 0.2)
			
			character.sprite.runAction(punchActionForward)
			character.sprite.runAction(punchActionBackward)
			
		}
		
		self.moveList.updateValue(Move(name: "punch", power: 5, description: "Attacks the foe with fists.", animation: punchAnimation) , forKey: "punch")
		
		//kick
		func kickAnimation()
		{
			
		}
	}
	
	/**
		Makes the character do the animation for the move it is doing.
		
		:param: character the character doing the move
		:param: moveKey the name of the move to be done
	*/
//	func doMove(character: Character, moveKey: String)
//	{
//		moveList[moveKey]!.animate(character)
//	}
	
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

class Move
{
	var name: String
	var power: Int
	var description: String
	var animation: () -> ()
	
	init(name: String, power: Int, description: String, animation: () -> ())
	{
		self.name = name
		self.power = power
		self.description = description
		self.animation = animation
	}
	
	
	func animate()
	{
		animation()
	}
}
