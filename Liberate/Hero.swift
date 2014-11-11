//
//  Hero.swift
//  Liberate
//
//  Created by Joshua Pepperman on 11/6/14.
//  Copyright (c) 2014 Joshua Pepperman. All rights reserved.
//

import SpriteKit

class Hero: Character
{
	/**
		Creates a new hero with the hero image, sets his position, and his scale.
		
		:param: scene the scene the Hero belongs to
	*/
	init()
	{
		super.init(standing1: "heroStanding1", standing2: "heroStanding2")
		
		sprite = SKSpriteNode(imageNamed: standing1)
		sprite.position = CGPoint(x: 160, y: -176)
		sprite.setScale(1.5)
	}
	
	/**
		Animates the hero walking
	*/
	func run()
	{
		let heroWalkAnimation = SKAction.animateWithTextures([
			SKTexture(imageNamed: "heroWalking1"),
			SKTexture(imageNamed: "heroWalking2")
			], timePerFrame: 0.1)
		
		let walk = SKAction.repeatAction(heroWalkAnimation, count: 10)
		
		sprite.runAction(walk, withKey: "walking")
	}
	
	/**
		Attacks an opponent with fists
	*/
	func punch()
	{
		//move the sprite forward a little and make a whack animation on the enemy (?)
	}
	
	/**
		Loads the Hero in relation to the screen. Call this once after the sprite has been added to the scene.
	*/
	func load()
	{
		sprite.position = CGPoint(x: sprite.scene!.size.width / 3, y: -(sprite.scene!.size.height / 3)*2)
	}
}