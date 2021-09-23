//
//  GameScene.swift
//  exporationGame
//
//  Created by Lucas Desouza on 9/22/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    private var player: PlayerController?
    
    override func didMove(to view: SKView) {
        createPlayer()
    }
    
    func createPlayer() {
        player = PlayerController(scene: self)
    }
    
    func touchDown(atPoint pos : CGPoint) {}
    
    func touchMoved(toPoint pos : CGPoint) {}
    
    func touchUp(atPoint pos : CGPoint) {}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if atPoint(location).name == "right" {
                player?.setAnimation(direction: .right, action: .walking)
            }
            
            if atPoint(location).name == "left" {
                player?.setAnimation(direction: .left, action: .walking)
            }
            
            if atPoint(location).name == "up" {
                player?.setAnimation(direction: .up, action: .walking)
            }
            
            if atPoint(location).name == "down" {
                player?.setAnimation(direction: .down, action: .walking)
            }
            
            if atPoint(location).name == "attack" {
                player?.attack()
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if atPoint(location).name == "right" {
                player?.setAnimation(direction: .right, action: .idle)
            }
            
            if atPoint(location).name == "left" {
                player?.setAnimation(direction: .left, action: .idle)
            }
            
            if atPoint(location).name == "up" {
                player?.setAnimation(direction: .up, action: .idle)
            }
            
            if atPoint(location).name == "down" {
                player?.setAnimation(direction: .down, action: .idle)
            }
        
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func update(_ currentTime: TimeInterval) {
        player?.update()
    }
}
