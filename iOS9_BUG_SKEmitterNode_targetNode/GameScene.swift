//
//  GameScene.swift
//  iOS9_BUG_SKEmitterNode_targetNode
//
//  Created by Michael Kennedy on 9/17/15.
//  Copyright (c) 2015 Michael Kennedy. All rights reserved.
//


// When particle.targetNode property is set, it will ignore zPosition property 
// and render in zPosition = 0.

import SpriteKit

class GameScene: SKScene {
  
  let smoke:SKEmitterNode = SKEmitterNode(fileNamed: "FireParticle.sks")!
  let brokenSmoke:SKEmitterNode = SKEmitterNode(fileNamed: "FireParticle.sks")!
  let sprite = SKSpriteNode(imageNamed: "Spaceship")
  let bg = SKSpriteNode(color: UIColor.greenColor(), size: CGSize(width: 250, height: 250))
  
  
  override func didMoveToView(view: SKView) {
    /* Setup your scene here */
    
    let text = SKLabelNode(text: "tap to move ship")
    text.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMaxY(self.frame) - text.frame.height * 1.2)
    text.fontColor = UIColor.blackColor()
    self.addChild(text)
    
    //SPACESHIP
    sprite.name = "spaceship"
    sprite.zPosition = 10
    sprite.xScale = 0.25
    sprite.yScale = 0.25
    sprite.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
    self.addChild(sprite)
    
    //PARTICLES LEFT SIDE
    smoke.name = "fire"
    smoke.zPosition = 10
    smoke.position = CGPoint(x: -200.0, y: 0.0)
    sprite.addChild(smoke)
    
    //PARTICLES RIGHT SIDE - BROKEN
    brokenSmoke.name = "fire"
    brokenSmoke.zPosition = 10 //value is ignored when targetNode property is set
    brokenSmoke.targetNode = self //set value to nil and zPosition will be respected
    brokenSmoke.position = CGPoint(x: 200.0, y: 0.0)
    sprite.addChild(brokenSmoke)
    print("right side particles are on layer: \(brokenSmoke.zPosition)") //prints correct value to console, even though it's being rendered on layer 0
    
    //ADD BG
    bg.zPosition = 1 //temp fix is to set this <= -1
    bg.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
    self.addChild(bg)
    
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    /* Called when a touch begins */
    
    for touch in touches {
      let location = touch.locationInNode(self)
      
      //          smoke.runAction(SKAction.moveTo(location, duration: 1.0))
      sprite.runAction(SKAction.moveTo(location, duration: 1.0))
      
      
    }
  }
  
  override func update(currentTime: CFTimeInterval) {
    /* Called before each frame is rendered */
  }
}

