//
//  Enemy.swift
//  Liberate
//
//  Created by Joshua Pepperman on 11/21/14.
//  Copyright (c) 2014 Joshua Pepperman. All rights reserved.
//

import SpriteKit

class Enemy: Character
{
	
	
	override init(standing1: String, standing2: String)
	{
		super.init(standing1: standing1, standing2: standing2)
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}