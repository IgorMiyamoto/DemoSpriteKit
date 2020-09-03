//
//  GameScene.swift
//  DemoSpriteKit
//
//  Created by IgorMiyamoto on 02/09/20.
//  Copyright © 2020 IgorMiyamoto. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene, SKPhysicsContactDelegate {
    //Variável para a action do som
    var contato : SKAction!
    
    //Função chamada quando a Scene é carregada
    override func didMove(to view: SKView) {
        //Define o delegate de contato
        physicsWorld.contactDelegate = self
        
        //Instancio a SKAction
        contato = SKAction.playSoundFileNamed("Hit.wav", waitForCompletion: false)
    }
    
    //Quando o Delegate falar "Aconteceu um contato" ele roda essa função
    func didBegin(_ contact: SKPhysicsContact) {
        //Executa a action
        self.run(contato)
    }

}
