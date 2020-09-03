//
//  GameScene.swift
//  DemoSpriteKit
//
//  Created by IgorMiyamoto on 02/09/20.
//  Copyright © 2020 IgorMiyamoto. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation


class GameScene: SKScene, SKPhysicsContactDelegate {
    //Variável para a action do som
    var contato : SKAction!
    private var BGM = AVAudioPlayer()
    
    //Função chamada quando a Scene é carregada
    override func didMove(to view: SKView) {
        //Define o delegate de contato
        physicsWorld.contactDelegate = self
        
        
        // Cria uma constante com a caminho do arquivo de audio no projeto.
        let BGMPath = Bundle.main.url(forResource: "grilos", withExtension: "wav")
        
        // Tenta carregar o arquivo no player.
        do {
            BGM = try AVAudioPlayer(contentsOf: BGMPath!, fileTypeHint: "wav")
        }
        // Se falhar, imprime o erro no console.
        catch {
            print(error)
        }
        
        // Define quantas vezes a música deve tocar, utilize qualquer valor negativo para configurar um loop infinito.
        BGM.numberOfLoops = -1
        // Começa a tocar a música.
        BGM.play()
        
        
        //Instancio a SKAction
        contato = SKAction.playSoundFileNamed("Hit.wav", waitForCompletion: false)
    }
    
    //Quando o Delegate falar "Aconteceu um contato" ele roda essa função
    func didBegin(_ contact: SKPhysicsContact) {
        //Executa a action
        self.run(contato)
    }

}
