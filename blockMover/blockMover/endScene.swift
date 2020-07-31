//
//  endScene.swift
//  blockMover
//
//  Created by Jude Willis on 31/07/2020.
//  Copyright © 2020 Jude Willis. All rights reserved.
//

import SpriteKit
import GameplayKit

class endScene: SKScene {
    
    var retryButton : SKSpriteNode!
    var menuButton : SKSpriteNode!
    
    override func didMove(to view: SKView) {
        retryButton = self.childNode(withName: "retryButton") as? SKSpriteNode
        menuButton = self.childNode(withName: "menuButton") as? SKSpriteNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
               guard let location = touch?.location(in: self) else { return print("error") }
               if(retryButton.frame.contains(location)){
                    guard let gameScene = SKScene(fileNamed: "GameScene") else { return print("error")
                    }
                    let animation = SKTransition.fade(withDuration: 1.0)
                    view?.presentScene(gameScene, transition: animation)
               }
                else if(menuButton.frame.contains(location)){
                    guard let startScene = SKScene(fileNamed: "startScene") else { return print("error")
                    }
                        let animation = SKTransition.fade(withDuration: 1.0)
                        view?.presentScene(startScene, transition: animation)
                }
        }
}
