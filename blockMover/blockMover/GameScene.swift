//
//  GameScene.swift
//  blockMover
//
//  Created by Jude Willis on 29/07/2020.
//  Copyright © 2020 Jude Willis. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {
    
    var blockPink: SKSpriteNode!
    var storagePink : SKSpriteNode!
    var blockBlue: SKSpriteNode!
    var storageBlue : SKSpriteNode!
    var blockYellow : SKSpriteNode!
    var storageYellow : SKSpriteNode!
    var touchesLocation = CGPoint()
    let timeLabel = SKLabelNode(fontNamed: "Chalkduster")
    var timeNow = 0
    var runningTime = 0
    
    
   
    
    override func didMove(to view: SKView) {
        var X : [Int] = []
        var Y : [Int] = []
        for _ in 1...3{
            let randomPointX = Int.random(in: -200..<200)
            X.append(randomPointX)
            let randomPointY = Int.random(in: -300..<300)
            Y.append(randomPointY)
        }
        
        
        blockPink = self.childNode(withName: "dragBlockPink") as? SKSpriteNode
        storagePink = self.childNode(withName: "storageBlockPink") as? SKSpriteNode
        blockBlue = self.childNode(withName: "dragBlockBlue") as? SKSpriteNode
        storageBlue = self.childNode(withName: "storageBlockBlue") as? SKSpriteNode
        blockYellow = self.childNode(withName: "dragBlockYellow") as? SKSpriteNode
        storageYellow = self.childNode(withName: "storageBlockYellow") as? SKSpriteNode
    
        
        storagePink.position = CGPoint(x: X[0], y: Y[0])
        storageBlue.position = CGPoint(x: X[1], y: Y[1])
        storageYellow.position = CGPoint(x: X[2], y: Y[2])
        
        if(storagePink.frame.contains(storageBlue.frame) || storagePink.frame.contains(storageYellow.frame)){
            storagePink.position = CGPoint(x: 0, y: 100)
        }
        
        if(storageBlue.frame.contains(storagePink.frame) || storageBlue.frame.contains(storageYellow.frame)){
            storageBlue.position = CGPoint(x: 0, y: 0)
        }
        
        if(storageYellow.frame.contains(storageBlue.frame) || storageYellow.frame.contains(storagePink.frame)){
            storageYellow.position = CGPoint(x: 0, y: -100)
        }
        
        
        
        //TIME LABEL
        timeLabel.fontSize = 30
        timeLabel.position = CGPoint(x: 0, y: 350)
        addChild(timeLabel)
        print("We're running baby")
    }
    
    override func update(_ currentTime: TimeInterval) {
      
        //TIME FUNCTION
        timeNow += 1
        if (timeNow == 60){
            runningTime += 1
            timeNow = 0
        }
        timeLabel.text = String(runningTime)
    }
    
    override func  touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            touchesLocation = touch.location(in: self)
            print(touchesLocation)
           // touchesLocationSquare = touchesLocation
            if(blockPink.frame.contains(touchesLocation)){
                blockPink?.position.x = touchesLocation.x
                blockPink?.position.y = touchesLocation.y
            }
            else if(blockBlue.frame.contains(touchesLocation)){
                blockBlue?.position.x = touchesLocation.x
                blockBlue?.position.y = touchesLocation.y
            }
            else if(blockYellow.frame.contains(touchesLocation)){
                blockYellow?.position.x = touchesLocation.x
                blockYellow?.position.y = touchesLocation.y
            }
            
        }
        if(storagePink.frame.contains(blockPink.frame) && storageBlue.frame.contains(blockBlue.frame) && storageYellow.frame.contains(blockYellow.frame))
        {
            self.resetGame()
        }
    }
    
    func resetGame(){
        guard let newScene = SKScene(fileNamed: "endScene") else { return print("error") }
        let animation = SKTransition.fade(withDuration: 1.0)
        view?.presentScene(newScene, transition: animation)
        
       // newScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        //newScene.scaleMode = self.scaleMode
       // self.view?.presentScene(newScene, transition: animation)
    }
}
