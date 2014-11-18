//
//  Thug.swift (a.k.a. Ryan)
//  Liberate
//
//  Created by Joshua Pepperman on 11/10/14.
//  Copyright (c) 2014 Joshua Pepperman. All rights reserved.
//

import SpriteKit

class Bat: Character
{
	/**
	Creates the Thug and places him on the screen.
	*/
	init()
	{
		super.init(standing1: "batStanding1", standing2: "batStanding2")
		
		sprite = SKSpriteNode(imageNamed: standing1)
		sprite.position = CGPoint(x:300, y: -176)
		sprite.setScale(1.5)
	}
	
	/**
	Loads the Thug in relation to the screen. Call this once after the sprite has been added to the scene.
	
	:param: position the place on the screen to add the thug
	*/
	func load(position: CGPoint)
	{
		sprite.position = position
	}
	
	func die()
	{
		//sprite.scene?.removeChildrenInArray([Thug()])
		sprite.removeFromParent()
	}
}