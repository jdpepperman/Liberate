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
	
//	var heroHealthLabel: SKLabelNode = SKLabelNode(fontNamed: "OpenSans-Bold")
//	var heroAttackLabel: SKLabelNode = SKLabelNode(fontNamed: "OpenSans-Bold")
//	var heroDefenseLabel: SKLabelNode = SKLabelNode(fontNamed: "OpenSans-Bold")
//	
//	var enemyHealthLabel: SKLabelNode = SKLabelNode(fontNamed: "OpenSans-Bold")
//	var enemyAttackLabel: SKLabelNode = SKLabelNode(fontNamed: "OpenSans-Bold")
//	var enemyDefenseLabel: SKLabelNode = SKLabelNode(fontNamed: "OpenSans-Bold")
	
	var gameState: String = "starting"
   
    override func update(currentTime: CFTimeInterval)
	{
        /* Called before each frame is rendered */
		checkBackgroundMovement()
		checkHealth()
		
		runGame()
    }
	
	required init(coder aDecoder: NSCoder)
	{
		fatalError("NSCoder not supported.")
	}
	
	override init(size: CGSize)
	{
		///his x coordinate is goint to be the number of seconds he has to travel times 250, so he will move 250 pixels per second. Then we add the number of pixels of the position we want him to end in,so he will stay in the same spot relative to the ground.
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
		loadEnemy()
		
		loadCeiling()
	}
	
	/**
		Adds the background images, places, and sizes it. Should be called once while setting up the scene.
	*/
	private func loadBackground()
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
	private func loadGround()
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
	private func loadCeiling()
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
	private func loadWallDetails()
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
	private func loadHero()
	{
		addChild(hero)
		hero.load()
		//setUpHeroStatsLabels()
	}
	
	/**
		Adds the thug to the screen.
	*/
	private func loadEnemy()
	{
		addChild(enemy)
		enemy.load(enemyStartCoordinate)
		enemy.stand()
		//setUpEnemyStatsLabels()
	}
	
	/**
		Moves the background and the enemy.
	*/
	private func moveBackground()
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
		
		enemy.runAction(moveEnemyAction)
	}
	
	/**
		Checks to see if one of the background images has gone off the screen. Should be called in update as this needs to be done continuously.
	*/
	private func checkBackgroundMovement()
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
	
	var prevHealth: Int = 0
	private func checkHealth()
	{
		if enemy.health != prevHealth
		{
//			enemyHealthLabel.removeFromParent()
//			enemyAttackLabel.removeFromParent()
//			enemyDefenseLabel.removeFromParent()
//			
//			setUpEnemyStatsLabels()
		}

		if enemy.health <= 0
		{
			enemy.die()
//			
//			enemyHealthLabel.removeFromParent()
//			enemyAttackLabel.removeFromParent()
//			enemyDefenseLabel.removeFromParent()
//			
			var enemy2 = Thug()
			enemy = enemy2
			loadEnemy()
//			setUpEnemyStatsLabels()
		}
		prevHealth = enemy.health
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
	private func startGame()
	{
		hero.stand()
//		setUpHeroStatsLabels()
//		setUpEnemyStatsLabels()
	}
	
//	/**
//		Creates a health label.
//	
//		:param: health the text to be put in the label
//	*/
//	func setUpHeroStatsLabels()
//	{
////		let healthLabel = SKLabelNode(fontNamed: "OpenSans-Bold")
//		heroHealthLabel.name = "health"
//		heroHealthLabel.fontSize = 12
//		heroHealthLabel.fontColor = UIColor(red: 0.0, green: 0.47, blue: 0.0, alpha: 1.0)
//		heroHealthLabel.text = "Health: " + String(hero.health)
//		heroHealthLabel.position = CGPointMake(25, size.height - 100)
//		
//		heroAttackLabel.name = "attack"
//		heroAttackLabel.fontSize = 12
//		heroAttackLabel.fontColor = UIColor(red: 0.0, green: 0.47, blue: 0.0, alpha: 1.0)
//		var attack: Int = hero.stats["attack"]!
//		heroAttackLabel.text = String(attack)
//		heroAttackLabel.position = CGPointMake(25, size.height - 80)
//
//		heroDefenseLabel.name = "defense"
//		heroDefenseLabel.fontSize = 12
//		heroDefenseLabel.fontColor = UIColor(red: 0.0, green: 0.47, blue: 0.0, alpha: 1.0)
//		var defense: Int = hero.stats["defense"]!
//		heroDefenseLabel.text = String(defense)
//		heroDefenseLabel.position = CGPointMake(25, size.height - 60)
//		
//		addChild(heroHealthLabel)
//		addChild(heroAttackLabel)
//		addChild(heroDefenseLabel)
//	}
//	
//	func setUpEnemyStatsLabels()
//	{
////		let enemyStatsLabel = SKLabelNode(fontNamed: "OpenSans-Bold")
//		enemyHealthLabel.name = "health"
//		enemyHealthLabel.fontSize = 12
//		enemyHealthLabel.fontColor = UIColor(red: 0.0, green: 0.47, blue: 0.0, alpha: 1.0)
//		enemyHealthLabel.text = "Health: " + String(hero.health)
//		enemyHealthLabel.position = CGPoint(x: size.width - 25, y: size.height - 100)
//		
//		enemyAttackLabel.name = "attack"
//		enemyAttackLabel.fontSize = 12
//		enemyAttackLabel.fontColor = UIColor(red: 0.0, green: 0.47, blue: 0.0, alpha: 1.0)
//		var attack: Int = hero.stats["attack"]!
//		enemyAttackLabel.text = String(attack)
//		enemyAttackLabel.position = CGPoint(x: size.width - 25, y: size.height - 80)
//		
//		enemyDefenseLabel.name = "defense"
//		enemyDefenseLabel.fontSize = 12
//		enemyDefenseLabel.fontColor = UIColor(red: 0.0, green: 0.47, blue: 0.0, alpha: 1.0)
//		var defense: Int = hero.stats["defense"]!
//		enemyDefenseLabel.text = String(defense)
//		enemyDefenseLabel.position = CGPoint(x: size.width - 25, y: size.height - 60)
//		
//		addChild(enemyHealthLabel)
//		addChild(enemyAttackLabel)
//		addChild(enemyDefenseLabel)
//	}
	
	func tap()
	{
		println("Tap Recieved")
	}
	
	func swipeUp()
	{
		println("Swipe Up Recieved")
		if gameState == "battling" { hero.doMove(0) }
	}
	
	func swipeRight()
	{
		println("Swipe Right Recieved")
		if gameState == "battling"
		{
			hero.doMove(1)
			enemy.health -= 5
			println(enemy.health)
		}

	}
	
	func swipeDown()
	{
		println("Swipe Down Recieved")
		if gameState == "battling" { hero.doMove(2) }
	}
	
	func swipeLeft()
	{
		println("Swipe Left Recieved")
		if gameState == "battling" { hero.doMove(3) }
	}
	
	private func runGame()
	{
		if (floor(enemy.position.x)) != floor(enemyStopCoordinate.x) && (gameState != "advancing")
		{
			gameState = "advancing"
			println(gameState)
			advance()
		}
		if floor(enemy.position.x) == floor(enemyStopCoordinate.x) && gameState != "battling"
		{
			gameState = "battling"
			println(gameState)
		}
		
		/*
		TO-DO:	Make tapping the screen punch the enemy, taking away health until he is defeated.
		Then move everything until a new enemy is at the same spot and repeat.
		*/

	}
}
