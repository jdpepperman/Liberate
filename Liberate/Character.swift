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
	var health: Int
	
	
	init()
	{
		self.inventory = []
		self.health = 100
	}
	
	init(health: Int)
	{
		self.health = health
		self.inventory = []
	}
}