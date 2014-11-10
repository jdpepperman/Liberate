//
//  Hero.swift
//  Liberate
//
//  Created by Joshua Pepperman on 11/6/14.
//  Copyright (c) 2014 Joshua Pepperman. All rights reserved.
//

import Foundation
import SpriteKit

class Hero: Character
{
	var sprite = SKSpriteNode()
	
	///Creates a new hero with the hero image, sets his position, and his scale.
	///Gives him a default health of 100 and an empty inventory.
	override init()
	{
		super.init()
		
		sprite = SKSpriteNode(imageNamed: "heroStanding1")
		sprite.position = CGPoint(x:30, y: -280)
		sprite.setScale(1.5)
	}
	
	///Animates the hero standing
	func stand()
	{
		let heroStandAnimation = SKAction.animateWithTextures([
			SKTexture(imageNamed: "heroStanding1"),
			SKTexture(imageNamed: "heroStanding2")
			], timePerFrame: 0.5)
		
		let stand = SKAction.repeatActionForever(heroStandAnimation)
		
		sprite.runAction(stand, withKey: "standing")
	}
	
	///Animates the hero walking
	func walk()
	{
		let heroWalkAnimation = SKAction.animateWithTextures([
			SKTexture(imageNamed: "heroWalking1"),
			SKTexture(imageNamed: "heroWalking2")
			], timePerFrame: 0.1)
		
		let walk = SKAction.repeatAction(heroWalkAnimation, count: 10)
		
		sprite.runAction(walk, withKey: "walking")
	}
	
	///Attacks an opponent with fists
	func punch()
	{
		//move the sprite forward a little and make a whack animation on the enemy (?)
	}
}