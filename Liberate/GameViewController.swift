//
//  GameViewController.swift
//  Liberate
//
//  Created by Joshua Pepperman on 10/28/14.
//  Copyright (c) 2014 Joshua Pepperman. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController{
	var scene: GameScene!
	var panPointReference: CGPoint?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let skView = view as SKView
		skView.multipleTouchEnabled = false
		
		scene = GameScene(size: skView.bounds.size)
		scene.scaleMode = .AspectFill
		
		skView.presentScene(scene)
    }
	
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
	
	@IBAction func didTap(sender: UITapGestureRecognizer) {
		println("Tap Recieved")
		scene.heroWalk()
	}
	
	/**
	
	Velocity:
	up:		-y
	down:	+y
	left:	-x
	right:	+x
	
	*/
	@IBAction func didPan(sender: UIPanGestureRecognizer) {
		println("Pan Recieved")
		let currentPoint = sender.translationInView(self.view)
		if let originalPoint = panPointReference
		{
			println(sender.velocityInView(self.view))
		}
		else if sender.state == .Began
		{
			panPointReference = currentPoint
		}
	}
}
