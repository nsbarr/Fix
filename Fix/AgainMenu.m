//
//  AgainMenu.m
//  Fix
//
//  Created by Nicholas Barr on 10/26/13.
//  Copyright (c) 2013 Nicholas Barr. All rights reserved.
//

#import "AgainMenu.h"
#import "SpriteMyScene.h"
#import "EmiScene.h"
#import "PiScene.h"

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
    testNode.size= CGSizeMake(100,100);
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

-(SKSpriteNode *)newYesterday {
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"todayNode";
    testNode.size= CGSizeMake(100,100);
    hello.fontSize = 14;
    hello.text= @"Yesterday";
    UIColor *gray = [UIColor grayColor];
    hello.fontColor = gray;
    [testNode addChild:hello];
    testNode.zRotation=0;
    testNode.physicsBody = 0;
    testNode.physicsBody.dynamic = NO;
    hello.physicsBody.collisionBitMask = 0;
    testNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame)+100);
    return testNode;
}

-(SKSpriteNode *)newTomorrow {
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"Tomorrow";
    testNode.size= CGSizeMake(100,100);
    hello.fontSize = 14;
    hello.text= @"Tomorrow";
    UIColor *gray = [UIColor grayColor];
    hello.fontColor = gray;
    [testNode addChild:hello];
    testNode.zRotation=0;
    testNode.physicsBody = 0;
    testNode.physicsBody.dynamic = NO;
    hello.physicsBody.collisionBitMask = 0;
    testNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame)-100);
    return testNode;
}

-(SKSpriteNode *)newPi {
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"piNode";
    testNode.size= CGSizeMake(100,100);
    hello.fontSize = 14;
    hello.text= @"3.";
    [testNode addChild:hello];
    testNode.zRotation=0;
    testNode.physicsBody = 0;
    testNode.physicsBody.dynamic = NO;
    hello.physicsBody.collisionBitMask = 0;
    testNode.position = CGPointMake(100,
                                    100);
    return testNode;
}

-(SKSpriteNode *)newEmi {
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"emiNode";
    testNode.size= CGSizeMake(100,100);
    hello.fontSize = 14;
    hello.text= @"Emi";
    [testNode addChild:hello];
    testNode.zRotation=0;
    testNode.physicsBody = 0;
    testNode.physicsBody.dynamic = NO;
    hello.physicsBody.collisionBitMask = 0;
    testNode.position = CGPointMake(self.frame.size.width-100,
                                    self.frame.size.height-80);
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
                                                                                         45) duration:1],
                                                            [SKAction rotateByAngle:M_PI/2 duration:2]
                                                            ]];
            [node runAction: moveintoplace completion:^{
                SKScene *spaceshipScene  = [[SpriteMyScene alloc] initWithSize:self.size];
                [self.view presentScene:spaceshipScene];
            }];
        }
        else if ([node.name isEqualToString:@"emiNode"])
        {
            SKAction *moveintoplace = [SKAction sequence: @[
                                                            [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame),
                                                                                         45) duration:1],
                                                            [SKAction rotateByAngle:M_PI/2 duration:2]
                                                            ]];
            [node runAction: moveintoplace completion:^{
                SKScene *spaceshipScene  = [[EmiScene alloc] initWithSize:self.size];
                [self.view presentScene:spaceshipScene];
            }];
        }
        else if ([node.name isEqualToString:@"piNode"])
        {
            SKAction *moveintoplace = [SKAction sequence: @[
                                                            [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame),
                                                                                         45) duration:1],
                                                            [SKAction rotateByAngle:M_PI/2 duration:2]
                                                            ]];
            [node runAction: moveintoplace completion:^{
                SKScene *spaceshipScene  = [[PiScene alloc] initWithSize:self.size];
                [self.view presentScene:spaceshipScene];
            }];
        }
        else if ([node.name isEqualToString:@"Tomorrow"])
        {
            [self lockedAlert];
        }


    }
}

-(void)lockedAlert{
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"Tomorrow";
    testNode.size= CGSizeMake(100,100);
    hello.fontSize = 14;
    hello.text= @"Complete Today to unlock Tomorrow";
    [testNode addChild:hello];
    testNode.zRotation=0;
    testNode.physicsBody = 0;
    testNode.physicsBody.dynamic = NO;
    hello.physicsBody.collisionBitMask = 0;
    testNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                    -50);
    [self addChild:testNode];
    SKAction *moveintoplace = [SKAction sequence: @[
                                                    [SKAction moveByX:0 y:70 duration:.3],
                                                    [SKAction waitForDuration:.8],
                                                    [SKAction moveByX:0 y:-70 duration:.5]
                                                    ]];
    [testNode runAction: moveintoplace];
    
}


- (void)createSceneContents
{
    self.scaleMode = SKSceneScaleModeAspectFit;
   [self addChild:[self newHero]];
    [self addChild:[self newYesterday]];
    [self addChild:[self newTomorrow]];

    [self addChild:[self newPi]];

   // [self addChild:[self newEmi]];

}
@end
