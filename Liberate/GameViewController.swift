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
	var panPointReference: CGPoint?
	var hero: Hero!
	
    override func viewDidLoad()
	{
        super.viewDidLoad()
		
		let skView = view as SKView
		skView.multipleTouchEnabled = false
		
		scene = GameScene(size: skView.bounds.size)
		scene.scaleMode = .AspectFill
		
		hero = scene.hero
		
		skView.presentScene(scene)
    }
	
    override func prefersStatusBarHidden() -> Bool
	{
        return true
    }
	
	@IBAction func didTap(sender: UITapGestureRecognizer)
	{
		println("Tap Recieved")
		hero.run()
		scene.moveGround()
	}
	
	@IBAction func swipeRight(sender: UISwipeGestureRecognizer) {
		println("Swipe Right Recieved")
	}
	
	@IBAction func swipeLeft(sender: UISwipeGestureRecognizer) {
		println("Swipe Left Recieved")
	}
}
