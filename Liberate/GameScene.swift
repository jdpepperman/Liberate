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
	
	var groundPieces = [SKSpriteNode]()
	let groundSpeed: CGFloat = 500
	var moveGroundAction: SKAction!
	var moveGroundForeverAction: SKAction!
	let groundResetXCoord: CGFloat = 0
	
	var hero = Hero()
	var thug = Thug()
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
		checkGroundMovement()
    }
	
	required init(coder aDecoder: NSCoder)
	{
		fatalError("NSCoder not supported.")
	}
	
	override init(size: CGSize)
	{
		super.init(size: size)
		
		anchorPoint = CGPoint(x: 0, y: 1.0)
	}
	
	override func didMoveToView(view: SKView) {
		/* Setup your scene here */
		loadGame()
		
		startGame()
	}
	
	/**
		Loads all the images into the game that are needed in the beginning.
	*/
	func loadGame()
	{
		loadBackground()
		loadGround()
		
		loadHero()
		loadThug()
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
		
		self.addChild(background)
	}
	
	/**
		Adds the ground and prepares it to loop.
	*/
	func loadGround()
	{
		for var i = 0; i < 2; i++
		{
			var groundSprite = SKSpriteNode(imageNamed: "caveFloor")
			groundSprite.size = size
			groundSprite.anchorPoint = CGPoint(x: 1.0, y: 1.0)
			groundPieces.append(groundSprite)
			
			var widthSpace = (groundSprite.size.width / 2)
			var heightSpace = (groundSprite.size.height / 2)
			
			if i == 0
			{
				groundSprite.position = CGPointMake(0, 0)
			}
			else
			{
				groundSprite.position = CGPointMake((widthSpace*2) + groundPieces[i - 1].position.x, groundPieces[i - 1].position.y)
			}
			
			self.addChild(groundSprite)
		}

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
	
	func moveGround()
	{
		moveGroundAction = SKAction.moveByX(-groundSpeed, y: 0, duration: 2)
		//moveGroundForeverAction = SKAction.repeatActionForever(SKAction.sequence([moveGroundAction]))
		
		for sprite in groundPieces
		{
			sprite.runAction(moveGroundAction)
		}
	}
	
	func checkGroundMovement()
	{
		for var i = 0; i < groundPieces.count; i++
		{
			if groundPieces[i].position.x <= groundResetXCoord
			{
				if i != 0
				{
					groundPieces[i].position = CGPointMake(groundPieces[i - 1].position.x + groundPieces[i].size.width, groundPieces[i].position.y)
				}
				else
				{
					groundPieces[i].position = CGPointMake(groundPieces[groundPieces.count - 1].position.x + groundPieces[i].size.width,groundPieces[i].position.y)
				}
			}
		}
	}
	
	/**
		Starts the game animations.
	*/
	func startGame()
	{
		hero.stand()
		thug.stand()
	}
}
