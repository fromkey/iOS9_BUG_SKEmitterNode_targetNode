# iOS9_BUG_SKEmitterNode_targetNode
When the targetNode property is set on a SKEmitterNode it will ALWAYS render at zPosition = 0, regardless of what you have set it to. 

All the magic happens in the GameScene.swift
https://github.com/fromkey/iOS9_BUG_SKEmitterNode_targetNode/blob/master/iOS9_BUG_SKEmitterNode_targetNode/GameScene.swift
