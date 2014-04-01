//
//  PiScene.h
//  Fix
//
//  Created by Nicholas Barr on 10/29/13.
//  Copyright (c) 2013 Nicholas Barr. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
@class SpriteViewController;


@import CoreMotion;

@interface PiScene : SKScene

@property (nonatomic, strong) SpriteViewController *spriteViewController;

@property (weak, nonatomic) CMMotionManager* motionManager;

@end
