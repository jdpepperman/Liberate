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
		
		self.position = CGPoint(x: 160, y: -176)
		self.setScale(1.5)
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	/**
		Animates the hero running.
	
		:param: time the time for the animation to play
	*/
	func run(time: NSTimeInterval)
	{
		var tpf = 0.1
		let heroRunAnimation = SKAction.animateWithTextures([
			SKTexture(imageNamed: "heroRunning1"),
			SKTexture(imageNamed: "heroRunning2")
			], timePerFrame: tpf)
		
		var repitions = Int(time / tpf) / 2
		
		let run = SKAction.repeatAction(heroRunAnimation, count: repitions)
		
		self.runAction(run, withKey: "running")
	}
	
	/**
		Loads the Hero in relation to the screen. Call this once after the sprite has been added to the scene.
	*/
	func load()
	{
		self.position = CGPoint(x: self.scene!.size.width / 3, y: -(self.scene!.size.height / 3)*2)
	}
}