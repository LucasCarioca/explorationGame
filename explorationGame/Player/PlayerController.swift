//
//  PlayerController.swift
//  exporationGame
//
//  Created by Lucas Desouza on 9/22/21.
//

import Foundation
import SpriteKit

class PlayerController {
    
    var scene: SKScene
    var node: SKSpriteNode
    var directionState: Direction = .down
    var actionState: Action = .idle
    
    init(scene: SKScene) {
        self.scene = scene
        self.node = SKSpriteNode(texture: SKTexture.createTextureFromAtlas(named: "playerIdleDown"))
        self.node.position = CGPoint(x: self.scene.frame.midX, y: self.scene.frame.midY)
        self.node.xScale = 2
        self.node.yScale = 2
        self.scene.addChild(self.node)
        self.node.run(SKAction.repeatForever(SKAction.createAnimationFromAtlas(named: "playerIdleDown")))
    }
    
    func start() {
        
    }
    
    func update() {
        
    }
    
    func setAnimation(direction: Direction, action: Action){
        if direction != directionState || action != actionState {
            self.directionState = direction
            self.actionState = action
            animate()
        }
    }
    
    func attack() {
        if directionState == .down {
            node.run(SKAction.createAnimationFromAtlas(named: "playerAttackDown"))
        } else if directionState == .up {
            node.run(SKAction.createAnimationFromAtlas(named: "playerAttackUp"))
        } else if directionState == .left {
            node.run(SKAction.createAnimationFromAtlas(named: "playerAttackLeft"))
        } else if directionState == .right {
            node.run(SKAction.createAnimationFromAtlas(named: "playerAttackRight"))
        }
    }
    
    func animate() {
        if actionState == .walking {
            if directionState == .left {
                node.run(SKAction.repeatForever(SKAction.createAnimationFromAtlas(named: "playerWalkingLeft")))
            } else if directionState == .right {
                node.run(SKAction.repeatForever(SKAction.createAnimationFromAtlas(named: "playerWalkingRight")))
            } else if directionState == .up {
                node.run(SKAction.repeatForever(SKAction.createAnimationFromAtlas(named: "playerWalkingUp")))
            } else if directionState == .down {
                node.run(SKAction.repeatForever(SKAction.createAnimationFromAtlas(named: "playerWalkingDown")))
            }
        } else if actionState == .idle {
            if directionState == .left {
                node.run(SKAction.repeatForever(SKAction.createAnimationFromAtlas(named: "playerIdleLeft")))
            } else if directionState == .right {
                node.run(SKAction.repeatForever(SKAction.createAnimationFromAtlas(named: "playerIdleRight")))
            } else if directionState == .up {
                node.run(SKAction.repeatForever(SKAction.createAnimationFromAtlas(named: "playerIdleUp")))
            } else if directionState == .down {
                node.run(SKAction.repeatForever(SKAction.createAnimationFromAtlas(named: "playerIdleDown")))
            }
        }
    }

}
