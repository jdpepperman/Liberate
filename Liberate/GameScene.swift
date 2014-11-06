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
	var hero = Hero()
	//var hero = SKSpriteNode()
   
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
		
		hero.stand()
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
//		hero = SKSpriteNode(imageNamed: "heroStanding1")
//		hero.position = CGPoint(x:30, y: -280)
//		hero.setScale(1.5)
		
		addChild(hero.sprite)
	}
	
	
	
	
}
