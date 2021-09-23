//
//  SKActionExtensions.swift
//  exporationGame
//
//  Created by Lucas Desouza on 9/22/21.
//

import Foundation
import SpriteKit

extension SKAction {
    public static func createAnimationFromAtlas(named atlasName: String, timePerFrame: TimeInterval = 0.1, resize: Bool = false, restore: Bool = false) -> SKAction {
        let atlas = SKTextureAtlas(named: atlasName)
        var frames = [SKTexture]()
        for textureName in atlas.textureNames {
            frames.append(atlas.textureNamed(textureName))
        }
        return SKAction.animate(
            with: frames,
            timePerFrame: timePerFrame,
            resize: resize,
            restore: restore)
    }
}
