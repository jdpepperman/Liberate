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
	let advanceTime: NSTimeInterval = 3 //seconds
	let enemyStartCoordinate: CGPoint
	
	var background = SKSpriteNode()
	
	var groundPieces = [SKSpriteNode]()
	let groundSpeed: CGFloat
	var moveGroundAction: SKAction!
	var moveGroundActionForever: SKAction!
	
	var ceilingPieces = [SKSpriteNode]()
	let ceilingSpeed: CGFloat
	var moveCeilingAction: SKAction!
	var moveCeilingActionForever: SKAction!
	
	var wallPieces = [SKSpriteNode]()
	let wallSpeed: CGFloat
	var moveWallAction: SKAction!
	var moveWallActionForever: SKAction!
	
	var moveEnemyAction: SKAction!
	var moveEnemyActionForever: SKAction!
	
	let backgroundResetCoordinate: CGFloat = 0
	
	var enemyStopCoordinate: CGPoint
	var stop: Bool = false
	
	var hero = Hero()
	var enemy = Thug()
   
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
		///his x coordinate is goint to be the number of seconds he has to travel times 250, so he will move250 pixels per second. Then we add the number of pixels of the position we want him to end in,so he will stay in the same spot relative to the ground.
		enemyStartCoordinate = CGPoint(x: CGFloat(advanceTime)*250 + (size.width / 3)*2, y: -(size.height / 3)*2)
		enemyStopCoordinate = CGPoint(x: (size.width / 3)*2, y: -(size.height / 3)*2)
		
		groundSpeed = CGFloat(advanceTime)*250
		ceilingSpeed = CGFloat(advanceTime)*400
		wallSpeed = CGFloat(advanceTime)*125
		
		
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
		addChild(enemy.sprite)
		enemy.load(enemyStartCoordinate)
	}
	
	/**
		Moves the background.
	*/
	func moveBackground()
	{
		moveGroundAction = SKAction.moveByX(-groundSpeed, y: 0, duration: advanceTime)
		moveGroundActionForever = SKAction.repeatActionForever(SKAction.sequence([moveGroundAction]))
		
		moveCeilingAction = SKAction.moveByX(-ceilingSpeed, y: 0, duration: advanceTime)
		moveCeilingActionForever = SKAction.repeatActionForever(SKAction.sequence([moveCeilingAction]))
		
		moveWallAction = SKAction.moveByX(-wallSpeed, y: 0, duration: advanceTime)
		moveWallActionForever = SKAction.repeatActionForever(SKAction.sequence([moveWallAction]))
		
		moveEnemyAction = SKAction.moveTo(enemyStopCoordinate, duration: advanceTime)
		moveEnemyActionForever = SKAction.repeatActionForever(SKAction.sequence([moveEnemyAction]))
		
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
		
		enemy.sprite.runAction(moveEnemyAction)
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
		This will advance the background, make the hero run, and bring the next enemy into view.
	*/
	func advance()
	{
		moveBackground()
		hero.run(advanceTime)
	}
	
	/**
		Starts the game animations.
	*/
	func startGame()
	{
		hero.stand()
		enemy.stand()

		/*
			TO-DO:	Make tapping the screen punch the enemy, taking away health until he is defeated.
			Then move everything until a new enemy is at the same spot and repeat.
		*/
	}
}
