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
	var name: String
	var health: Int
	
	
	init()
	{
		self.name = ""
		self.inventory = []
		self.health = 0
	}
	
	init(name: String, health: Int)
	{
		self.name = name
		self.health = health
		self.inventory = []
	}
}