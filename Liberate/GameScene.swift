//
//  GameScene.swift
//  Liberate
//
//  Created by Joshua Pepperman on 10/28/14.
//  Copyright (c) 2014 Joshua Pepperman. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
	
	var background = SKSpriteNode()
	var hero = SKSpriteNode()
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
	
	required init(coder aDecoder: NSCoder)
	{
		fatalError("NSCoder not supported.")
	}
	
	override init(size: CGSize)
	{
		super.init(size: size)
		
		anchorPoint = CGPoint(x: 0, y: 1.0)
		loadBackground()
		loadHero()
		heroStand()
	}
	
	///Adds the background image, places, and sizes it.
	///Should be called once while setting up the scene.
	func loadBackground()
	{
		background = SKSpriteNode(imageNamed: "caveWall")
		background.position = CGPoint(x: 0, y: 0)
		background.anchorPoint = CGPoint(x: 0, y: 1.0)
		background.size = size
		
		addChild(background)
	}
	
	///Adds the hero to the screen.
	func loadHero()
	{
		hero = SKSpriteNode(imageNamed: "hero2")
		hero.position = CGPoint(x:30, y: -280)
		
		addChild(hero)
	}
	
	///Animates the hero standing
	func heroStand()
	{
		let heroStandAnimation = SKAction.animateWithTextures([
			SKTexture(imageNamed: "heroStanding1"),
			SKTexture(imageNamed: "heroStanding2")
			], timePerFrame: 0.5)
		
		let stand = SKAction.repeatActionForever(heroStandAnimation)
		
		hero.runAction(stand, withKey: "standing")
	}
	
	func heroWalk()
	{
		let heroWalkAnimation = SKAction.animateWithTextures([
		SKTexture(imageNamed: "heroWalking1"),
		SKTexture(imageNamed: "heroWalking2")
			], timePerFrame: 0.5)
		
		let walk = SKAction.repeatAction(heroWalkAnimation, count: 5)
		
		hero.runAction(walk, withKey: "walking")
	}
}
