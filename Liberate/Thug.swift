//
//  Thug.swift (a.k.a. Ryan)
//  Liberate
//
//  Created by Joshua Pepperman on 11/10/14.
//  Copyright (c) 2014 Joshua Pepperman. All rights reserved.
//

import SpriteKit

class Thug: Character
{
	/**
		Creates the Thug and places him on the screen.
	*/
	init()
	{
		super.init(standing1: "enemyRyanStanding1", standing2: "enemyRyanStanding2")
		
		sprite = SKSpriteNode(imageNamed: standing1)
		sprite.position = CGPoint(x:300, y: -176)
		sprite.setScale(1.5)
	}
	
	/**
		Loads the Thug in relation to the screen. Call this once after the sprite has been added to the scene.
	*/
	func load()
	{
		// two thirds across the screen
		sprite.position = CGPoint(x: (sprite.scene!.size.width / 3)*2, y: -(sprite.scene!.size.height / 3)*2)
	}
}