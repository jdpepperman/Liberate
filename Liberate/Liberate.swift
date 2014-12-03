//
//  Liberate.swift
//  Liberate
//
//  Created by Joshua Pepperman on 11/21/14.
//  Copyright (c) 2014 Joshua Pepperman. All rights reserved.
//

protocol LiberateDelegate
{
	func gameDidBegin(liberate: Liberate)
}

class Liberate
{
	var enemy: Enemy?
	var hero: Hero!
	
	var delegate: LiberateDelegate?
	
	init()
	{
		
	}
}