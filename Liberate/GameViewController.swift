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
		updateLabels()
	}
	
	@IBAction func swipeDown(sender: UISwipeGestureRecognizer) {
		scene.swipeDown()
	}
	
	@IBAction func swipeLeft(sender: UISwipeGestureRecognizer) {
		scene.swipeLeft()
	}
	
	func updateLabels()
	{
		heroHealthLabel.text = "\(hero.health)"
		heroAttackLabel.text = String(hero.stats["attack"]!)
		heroDefenseLabel.text = String(hero.stats["defense"]!)
		
		enemyHealthLabel.text = "\(enemy.health)"
		enemyAttackLabel.text = String(enemy.stats["attack"]!)
		enemyDefenseLabel.text = String(enemy.stats["defense"]!)
	}
	
	@IBOutlet weak var heroHealthLabel: UILabel!
	@IBOutlet weak var heroAttackLabel: UILabel!
	@IBOutlet weak var heroDefenseLabel: UILabel!
	@IBOutlet weak var enemyHealthLabel: UILabel!
	@IBOutlet weak var enemyAttackLabel: UILabel!
	@IBOutlet weak var enemyDefenseLabel: UILabel!
}
