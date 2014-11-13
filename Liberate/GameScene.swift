//
//  GameScene.swift
//  Liberate
//
//  Created by Joshua Pepperman on 10/28/14.
//  Copyright (c) 2014 Joshua Pepperman. All rights reserved.
//

import SpriteKit

class GameScene: SKScene
{
	var background = SKSpriteNode()
	
	var groundPieces = [SKSpriteNode]()
	let groundSpeed: CGFloat = 500
	var moveGroundAction: SKAction!
	var moveGroundActionForever: SKAction!
	
	var ceilingPieces = [SKSpriteNode]()
	let ceilingSpeed: CGFloat = 800
	var moveCeilingAction: SKAction!
	var moveCeilingActionForever: SKAction!
	
	var wallPieces = [SKSpriteNode]()
	let wallSpeed: CGFloat = 250
	var moveWallAction: SKAction!
	var moveWallActionForever: SKAction!
	
	let backgroundResetCoordinate: CGFloat = 0
	
	var hero = Hero()
	var enemey = Thug()
   
    override func update(currentTime: CFTimeInterval)
	{
        /* Called before each frame is rendered */
		checkBackgroundMovement()
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
	
	override func didMoveToView(view: SKView)
	{
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
		loadWallDetails()
		loadGround()
		
		loadHero()
		loadThug()
		
		loadCeiling()
	}
	
	/**
		Adds the background images, places, and sizes it. Should be called once while setting up the scene.
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
			groundSprite.size.height = size.height
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
		Adds the ceiling and prepares it to loop.
	*/
	func loadCeiling()
	{
		for var i = 0; i < 2; i++
		{
			var ceilingSprite = SKSpriteNode(imageNamed: "caveCeiling")
			ceilingSprite.size.height = size.height
			ceilingSprite.anchorPoint = CGPoint(x: 1.0, y: 1.0)
			ceilingPieces.append(ceilingSprite)
			
			var widthSpace = (ceilingSprite.size.width / 2)
			var heightSpace = (ceilingSprite.size.height / 2)
			
			if i == 0
			{
				ceilingSprite.position = CGPointMake(0, 0)
			}
			else
			{
				ceilingSprite.position = CGPointMake((widthSpace*2) + ceilingPieces[i - 1].position.x, ceilingPieces[i - 1].position.y)
			}
			
			self.addChild(ceilingSprite)
		}
	}
	
	/**
	Adds the wall details and prepares it to loop.
	*/
	func loadWallDetails()
	{
		for var i = 0; i < 2; i++
		{
			var wallSprite = SKSpriteNode(imageNamed: "caveWallDetails")
			wallSprite.size.height = size.height
			wallSprite.anchorPoint = CGPoint(x: 1.0, y: 1.0)
			wallPieces.append(wallSprite)
			
			var widthSpace = (wallSprite.size.width / 2)
			var heightSpace = (wallSprite.size.height / 2)
			
			if i == 0
			{
				wallSprite.position = CGPointMake(0, 0)
			}
			else
			{
				wallSprite.position = CGPointMake((widthSpace*2) + wallPieces[i - 1].position.x, wallPieces[i - 1].position.y)
			}
			
			self.addChild(wallSprite)
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
		addChild(enemey.sprite)
		enemey.load()
	}
	
	/**
		Moves the background.
	*/
	func moveBackground()
	{
		moveGroundAction = SKAction.moveByX(-groundSpeed, y: 0, duration: 2)
		moveGroundActionForever = SKAction.repeatActionForever(SKAction.sequence([moveGroundAction]))
		
		moveCeilingAction = SKAction.moveByX(-ceilingSpeed, y: 0, duration: 2)
		moveCeilingActionForever = SKAction.repeatActionForever(SKAction.sequence([moveCeilingAction]))
		
		moveWallAction = SKAction.moveByX(-wallSpeed, y: 0, duration: 2)
		moveWallActionForever = SKAction.repeatActionForever(SKAction.sequence([moveWallAction]))
		
		for sprite in ceilingPieces
		{
			sprite.runAction(moveCeilingAction)
		}
		
		for sprite in groundPieces
		{
			sprite.runAction(moveGroundAction)
		}
		
		for sprite in wallPieces
		{
			sprite.runAction(moveWallAction)
		}
	}
	
	/**
		Checks to see if one of the background images has gone off the screen. Should be called in update as this needs to be done continuously.
	*/
	func checkBackgroundMovement()
	{
		//check ceiling
		for var i = 0; i < ceilingPieces.count; i++
		{
			if ceilingPieces[i].position.x <= backgroundResetCoordinate
			{
				if i != 0
				{
					ceilingPieces[i].position = CGPointMake(ceilingPieces[i - 1].position.x + ceilingPieces[i].size.width, ceilingPieces[i].position.y)
				}
				else
				{
					ceilingPieces[i].position = CGPointMake(ceilingPieces[ceilingPieces.count - 1].position.x + ceilingPieces[i].size.width, ceilingPieces[i].position.y)
				}
			}
		}
		
		//check ground details
		for var i = 0; i < groundPieces.count; i++
		{
			if groundPieces[i].position.x <= backgroundResetCoordinate
			{
				if i != 0
				{
					groundPieces[i].position = CGPointMake(groundPieces[i - 1].position.x + groundPieces[i].size.width, groundPieces[i].position.y)
				}
				else
				{
					groundPieces[i].position = CGPointMake(groundPieces[groundPieces.count - 1].position.x + groundPieces[i].size.width, groundPieces[i].position.y)
				}
			}
		}
		
		//check wall details
		for var i = 0; i < wallPieces.count; i++
		{
			if wallPieces[i].position.x <= backgroundResetCoordinate
			{
				if i != 0
				{
					wallPieces[i].position = CGPointMake(wallPieces[i - 1].position.x + wallPieces[i].size.width, wallPieces[i].position.y)
				}
				else
				{
					wallPieces[i].position = CGPointMake(wallPieces[wallPieces.count - 1].position.x + wallPieces[i].size.width, wallPieces[i].position.y)
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
		enemey.stand()

		/*
			TO-DO:	Make tapping the screen punch the enemy, taking away health until he is defeated.
			Then move everything until a new enemy is at the same spot and repeat.
		*/
	}
}
