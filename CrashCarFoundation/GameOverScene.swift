//
//  GameOverScene.swift
//  CrashCarFoundation
//
//  Created by Foundation-016 on 28/06/24.
//

import UIKit
import SpriteKit


class GameOverScene : SKScene {
    
    var gameOverLabel: SKLabelNode!
    var restartLabel: SKLabelNode?
    
    override func didMove(to view: SKView) {
        restartLabel = self.childNode(withName: "//restartLabel") as? SKLabelNode
        
        gameOverLabel = SKLabelNode(text: "Game Over")
        gameOverLabel.fontSize = 50
        gameOverLabel.position = .zero
        
        addChild(gameOverLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
        
        if self.atPoint(location) == restartLabel {
            restartGame()
        }
        
        
    }
    
    func restartGame(){
        if let scene = SKScene(fileNamed: "GameScane") {
            scene.scaleMode = .aspectFill
            
            let transition = SKTransition.doorway(withDuration: 1)
            view?.presentScene(scene, transition: transition)
        }
    }
}
