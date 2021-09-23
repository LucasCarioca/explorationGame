//
//  SKTexture.swift
//  exporationGame
//
//  Created by Lucas Desouza on 9/22/21.
//

import Foundation
import SpriteKit

extension SKTexture {
    public static func createTextureFromAtlas(named atlasName: String, index: Int = 0) -> SKTexture {
        let atlas = SKTextureAtlas(named: atlasName)
        return atlas.textureNamed(atlas.textureNames[index])
    }
}
