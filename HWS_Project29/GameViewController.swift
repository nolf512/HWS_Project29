//
//  GameViewController.swift
//  HWS_Project29
//
//  Created by J on 2021/05/17.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var currentGame: GameScene!
    
    //UI
    @IBOutlet var angelSlider: UISlider!
    @IBOutlet var angelLabel: UILabel!
    
    @IBOutlet var velocitySlider: UISlider!
    @IBOutlet var velocityLabel: UILabel!
    
    @IBOutlet var launchButton: UIButton!
    
    @IBOutlet var playerNumber: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        angelChanged(angelSlider)
        velocityChanged(velocitySlider)
        
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
                
                currentGame = scene as? GameScene
                currentGame.viewController = self
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func angelChanged(_ sender: Any) {
        
        angelLabel.text = "Angel: \(Int(angelSlider.value))"
        
    }
    
    
    
    @IBAction func velocityChanged(_ sender: Any) {
        
        velocityLabel.text = "Velocity: \(Int(velocitySlider.value))"
        
    }
    
    
    @IBAction func launch(_ sender: Any) {
        
        angelSlider.isHidden = true
        angelLabel.isHidden = true
        
        velocitySlider.isHidden = true
        velocityLabel.isHidden = true
        
        launchButton.isHidden = true
    
        currentGame.launch(angel: Int(angelSlider.value), velocity: Int(velocitySlider.value))
        
    }
    
 
    func activatePlayer(number: Int){
        if number == 1 {
            playerNumber.text = "<<< PLAYER ONE"
        } else {
            playerNumber.text = "PLAYER TWO >>>"
        }
        
        angelSlider.isHidden = false
        angelLabel.isHidden = false
        
        velocitySlider.isHidden = false
        velocitySlider.isHidden = false
        
        launchButton.isHidden = false
        
    }
    
}
