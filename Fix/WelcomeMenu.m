//
//  WelcomeMenu.m
//  Fix
//
//  Created by Nicholas Barr on 10/11/13.
//  Copyright (c) 2013 Nicholas Barr. All rights reserved.
//

#import "WelcomeMenu.h"
#import "SpriteMyScene.h"
#import "SpriteViewController.h"

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
    SKAction *makeWord = [SKAction sequence: @[
                                               [SKAction performSelector:@selector(addWord) onTarget:self],
                                               [SKAction waitForDuration:0 withRange:0.25]
                                               ]];
    [self runAction: [SKAction repeatActionForever:makeWord]];

}

-(SKSpriteNode *)newHero {
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"helloNode";
    hello.fontSize = 18;
    hello.text= @"Today";
    [testNode addChild:hello];
    testNode.zRotation=M_PI/2;
    testNode.physicsBody = 0;
    testNode.physicsBody.dynamic = NO;
    hello.physicsBody.collisionBitMask = 0;
    testNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame));
    return testNode;
}

static inline CGFloat skRandf() {
    return rand() / (CGFloat) RAND_MAX;
}

static inline CGFloat skRand(CGFloat low, CGFloat high) {
    return skRandf() * (high - low) + low;
}

- (void)addWord
{
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.name = @"rain";
    hello.text = @";";
    hello.fontSize = 8;
    hello.alpha = 0.3;
    hello.position = CGPointMake(skRand(0, self.size.width), self.size.height+100);
    hello.physicsBody.dynamic = YES;
    hello.physicsBody.collisionBitMask = 0;

    hello.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:hello.frame.size];
   // SKAction *fall = [SKAction moveTo:CGPointMake(hello.position.x,-20) duration:4];
   // [hello runAction: fall];
    [self addChild: hello];


    
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

-(void)didSimulatePhysics
{
    [self enumerateChildNodesWithName:@"rain" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.y < 0){
            [node removeFromParent];
        }
    }];
    
    
    
}
@end
