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
	init(scene: GameScene)
	{
		super.init(scene: scene, standing1: "enemyRyanStanding1", standing2: "enemyRyanStanding2")
		
		sprite = SKSpriteNode(imageNamed: standing1)
		sprite.position = CGPoint(x:300, y: -176)
		sprite.setScale(1.5)
	}
}