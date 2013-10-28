//
//  AgainMenu.m
//  Fix
//
//  Created by Nicholas Barr on 10/26/13.
//  Copyright (c) 2013 Nicholas Barr. All rights reserved.
//

#import "AgainMenu.h"
#import "SpriteMyScene.h"

@interface AgainMenu ()
@property BOOL contentCreated;
@end
@implementation AgainMenu


- (void)didMoveToView: (SKView *) view
{
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}


-(SKSpriteNode *)newHero {
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"todayNode";
    hello.fontSize = 14;
    hello.text= @"Today";
    [testNode addChild:hello];
    testNode.zRotation=0;
    testNode.physicsBody = 0;
    testNode.physicsBody.dynamic = NO;
    hello.physicsBody.collisionBitMask = 0;
    testNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame));
    return testNode;
}


- (void)touchesBegan:(NSSet *) touches withEvent:(UIEvent *)event
{
    
    
    UITouch *touch = [touches anyObject];
    
    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
    for (SKNode *node in nodes) {
        if ([node.name isEqualToString:@"todayNode"])
        {
            SKAction *moveintoplace = [SKAction sequence: @[
                                                            [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame),
                                                                                         80) duration:1],
                                                            [SKAction rotateByAngle:M_PI/2 duration:2]
                                                            ]];
            [node runAction: moveintoplace completion:^{
                SKScene *spaceshipScene  = [[SpriteMyScene alloc] initWithSize:self.size];
                [self.view presentScene:spaceshipScene];
            }];
        }
    }
}


- (void)createSceneContents
{
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self addChild:[self newHero]];
}
@end
