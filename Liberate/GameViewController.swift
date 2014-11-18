//
//  GameViewController.swift
//  Liberate
//
//  Created by Joshua Pepperman on 10/28/14.
//  Copyright (c) 2014 Joshua Pepperman. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController
{
	var scene: GameScene!
	var hero: Hero!
	var enemy: Thug!
	
    override func viewDidLoad()
	{
        super.viewDidLoad()
		
		let skView = view as SKView
		skView.multipleTouchEnabled = false
		
		scene = GameScene(size: skView.bounds.size)
		scene.scaleMode = .AspectFill
		
		hero = scene.hero
		enemy = scene.enemy
		
		skView.presentScene(scene)
    }
	
    override func prefersStatusBarHidden() -> Bool
	{
        return true
    }
	
	@IBAction func didTap(sender: UITapGestureRecognizer)
	{
		scene.tap()
	}
	
	
	//		0
	//	3 --+-- 1
	//		2
	@IBAction func swipeUp(sender: UISwipeGestureRecognizer) {
		scene.swipeUp()
	}
	
	@IBAction func swipeRight(sender: UISwipeGestureRecognizer) {
		scene.swipeRight()
	}
	
	@IBAction func swipeDown(sender: UISwipeGestureRecognizer) {
		scene.swipeDown()
	}
	
	@IBAction func swipeLeft(sender: UISwipeGestureRecognizer) {
		scene.swipeLeft()
	}
}
