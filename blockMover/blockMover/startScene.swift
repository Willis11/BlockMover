//
//  startScene.swift
//  blockMover
//
//  Created by Jude Willis on 31/07/2020.
//  Copyright © 2020 Jude Willis. All rights reserved.
//

import SpriteKit
import GameplayKit

class startScene: SKScene{
    
    var touchesLocation = CGPoint()
    var startButton : SKSpriteNode!
    var titleLabel = SKLabelNode(fontNamed: "chalkduster")
   
    override func didMove(to view: SKView) {
        startButton = self.childNode(withName: "startButton") as? SKSpriteNode
        
        titleLabel.text = "Block Mover"
        titleLabel.fontSize = 50
        titleLabel.position = CGPoint(x: 0, y: 250)
        addChild(titleLabel)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        guard let location = touch?.location(in: self) else { return print("error") }
        if(startButton.frame.contains(location)){
          guard let newScene = SKScene(fileNamed: "GameScene") else { return print("error") }
          let animation = SKTransition.fade(withDuration: 1.0)
          view?.presentScene(newScene, transition: animation)
        }
       
       
       
    }
}
