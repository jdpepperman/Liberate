//
//  Character.swift
//  Liberate
//
//  Created by Joshua Pepperman on 11/5/14.
//  Copyright (c) 2014 Joshua Pepperman. All rights reserved.
//

import Foundation

class Character
{
	var inventory: Array<Item?>
	//var moveSet: Array<Move?>
	var stats: [String : Int]
	
	
	init()
	{
		self.inventory = []
		self.stats = [
			"health" : 20,
			"attack" : 5,
			"defense": 5
		]
	}
	
	init(inventory: Array<Item?>, stats: [String : Int])
	{
		self.inventory = inventory
		self.stats = stats
	}

}