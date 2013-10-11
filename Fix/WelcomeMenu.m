//
//  WelcomeMenu.m
//  Fix
//
//  Created by Nicholas Barr on 10/11/13.
//  Copyright (c) 2013 Nicholas Barr. All rights reserved.
//

#import "WelcomeMenu.h"
#import "SpriteMyScene.h"

@interface WelcomeMenu ()
@property BOOL contentCreated;
@end

@implementation WelcomeMenu
- (void)didMoveToView: (SKView *) view
{
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

- (void)createSceneContents
{
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self addChild: [self newHero]];
}

-(SKSpriteNode *)newHero {
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"helloNode";
    hello.fontSize = 18;
    hello.text= @"Today";
    [testNode addChild:hello];
    testNode.zRotation=M_PI/2;
    testNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:hello.frame.size];
    testNode.physicsBody.dynamic = NO;
    testNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame));
    return testNode;
}

- (void)touchesBegan:(NSSet *) touches withEvent:(UIEvent *)event
{
    SKNode *helloNode = [self childNodeWithName:@"helloNode"];
    UITouch *touch = [touches anyObject];
    
    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
    for (SKNode *node in nodes) {
        if ((helloNode != nil) && (node == helloNode))
        {
                                  SKAction *moveintoplace = [SKAction moveByX: 0 y: -220 duration: 0.5];
                        [helloNode runAction: moveintoplace completion:^{
                            SKScene *spaceshipScene  = [[SpriteMyScene alloc] initWithSize:self.size];
                            [self.view presentScene:spaceshipScene];
                        }];    }
                }
}
@end
