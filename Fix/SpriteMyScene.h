//
//  SpriteMyScene.h
//  Fix
//

//  Copyright (c) 2013 Nicholas Barr. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class SpriteViewController;

@interface SpriteMyScene : SKScene {
    
    SpriteViewController *aObj;

}


@property (nonatomic, weak) SpriteViewController *spriteViewController;


@end
