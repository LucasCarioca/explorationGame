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
                player?.setAnimation(direction: .right, movement: .walking)
            }
            
            if atPoint(location).name == "left" {
                player?.setAnimation(direction: .left, movement: .walking)
            }
            
            if atPoint(location).name == "up" {
                player?.setAnimation(direction: .up, movement: .walking)
            }
            
            if atPoint(location).name == "down" {
                player?.setAnimation(direction: .down, movement: .walking)            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if atPoint(location).name == "right" {
                player?.setAnimation(direction: .right, movement: .idle)
            }
            
            if atPoint(location).name == "left" {
                player?.setAnimation(direction: .left, movement: .idle)
            }
            
            if atPoint(location).name == "up" {
                player?.setAnimation(direction: .up, movement: .idle)
            }
            
            if atPoint(location).name == "down" {
                player?.setAnimation(direction: .down, movement: .idle)
            }
        
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func update(_ currentTime: TimeInterval) {
        player?.update()
    }
}
