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
	var ground1 = SKSpriteNode()
	var ground2 = SKSpriteNode()
	var hero = Hero()
	var thug = Thug()
   
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
		loadThug()
		
		hero.stand()
		thug.stand()
	}
	
	/**
		Adds the background image, places, and sizes it. Should be called once while setting up the scene.
	*/
	func loadBackground()
	{
		background = SKSpriteNode(imageNamed: "caveWall")
		background.position = CGPoint(x: 0, y: 0)
		background.anchorPoint = CGPoint(x: 0, y: 1.0)
		background.size = size
		
		ground1 = SKSpriteNode(imageNamed: "caveFloor")
		ground1.position = CGPoint(x: 0, y: 0)
		ground1.anchorPoint = CGPoint(x: 0, y: 1.0)
		ground1.size = size
		
		ground2 = SKSpriteNode(imageNamed: "caveFloor")
		ground2.position = CGPoint(x: 0, y: 0)
		ground2.anchorPoint = CGPoint(x: 0, y: 1.0)
		ground2.size = size
		
		addChild(background)
		addChild(ground1)
	}
	
	/**
		Adds the hero to the screen.
	*/
	func loadHero()
	{
		addChild(hero.sprite)
		hero.load()
	}
	
	/**
		Adds the thug to the screen.
	*/
	func loadThug()
	{
		addChild(thug.sprite)
		thug.load()
	}
}
