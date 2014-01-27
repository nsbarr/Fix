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
#import "Sentence.h"
#import "YesterdayScene.h"
#import "TomorrowScene.h"

@interface AgainMenu ()

@property BOOL contentCreated;
@end
@implementation AgainMenu

BOOL tomorrowLocked = YES;


- (void)didMoveToView: (SKView *) view
{
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
      
    }
    Sentence *sentence = [Sentence sharedSentence];
    if (sentence.level == 0){
        sentence.level = 1;
    }
}


//level1 node
-(SKSpriteNode *)newHero {
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"todayNode";
    testNode.size= CGSizeMake(self.size.width,self.size.height/5);
    hello.fontSize = 18;
    hello.text= @"Today";
    [testNode addChild:hello];
    UIColor *mid = [UIColor colorWithRed:16.0/255 green:23.0/255 blue:32.0/255 alpha:1];
    testNode.color = mid;
    testNode.zRotation= 0;
    testNode.physicsBody = 0;
    testNode.physicsBody.dynamic = NO;
    hello.physicsBody.collisionBitMask = 0;
    testNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame));
    return testNode;
}

//level2node
-(SKSpriteNode *)newYesterday {
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"yesterdayNode";
    testNode.size= CGSizeMake(self.size.width,self.size.height/5);
    UIColor *deep = [UIColor colorWithRed:21.0/255 green:28.0/255 blue:37.0/255 alpha:1];
    testNode.color = deep;
    hello.fontSize = 18;
    hello.text= @"Yesterday";
    Sentence *sentence = [Sentence sharedSentence];

    [testNode addChild:hello];
    testNode.zRotation = 0;
    testNode.physicsBody = 0;
    testNode.physicsBody.dynamic = NO;
    hello.physicsBody.collisionBitMask = 0;
    testNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame)+self.size.height/5);
    return testNode;
}


//level 3 node
-(SKSpriteNode *)newTomorrow {
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"Tomorrow";
    testNode.size= CGSizeMake(self.size.width,self.size.height/5);
    hello.fontSize = 18;
    hello.text= @"Tomorrow";
    UIColor *deep = [UIColor colorWithRed:11.0/255 green:17.0/255 blue:26.0/255 alpha:1];
    testNode.color = deep;
    Sentence *sentence = [Sentence sharedSentence];

    [testNode addChild:hello];
    testNode.zRotation=0;
    testNode.physicsBody = 0;
    testNode.physicsBody.dynamic = NO;
    hello.physicsBody.collisionBitMask = 0;
    testNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame)-self.size.height/5);
    return testNode;
}


//level 4 node
-(SKSpriteNode *)newPi {
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"piNode";
    testNode.size= CGSizeMake(self.size.width,self.size.height/5);
    hello.fontSize = 18;
    hello.text= @"π";
    [testNode addChild:hello];
    UIColor *deep = [UIColor colorWithRed:33.0/255 green:43.0/255 blue:53.0/255 alpha:1];
    testNode.color = deep;
    testNode.zRotation=0;
    testNode.physicsBody = 0;
    testNode.physicsBody.dynamic = NO;
    hello.physicsBody.collisionBitMask = 0;
    testNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame)+2*self.size.height/5);
    Sentence *sentence = [Sentence sharedSentence];

    return testNode;
}

//level4 node
-(SKSpriteNode *)newEmi {
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"emiNode";
    testNode.size= CGSizeMake(self.size.width,self.size.height/5);
    hello.fontSize = 18;
    hello.text = @"∞";
    [testNode addChild:hello];
    UIColor *deep = [UIColor colorWithRed:3.0/255 green:5.0/255 blue:13.0/255 alpha:1];
    testNode.color = deep;
    testNode.zRotation=0;
    testNode.physicsBody = 0;
    testNode.physicsBody.dynamic = NO;
    hello.physicsBody.collisionBitMask = 0;
    testNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame)-2*self.size.height/5);
    Sentence *sentence = [Sentence sharedSentence];

    return testNode;
}



- (void)touchesBegan:(NSSet *) touches withEvent:(UIEvent *)event
{
    
    Sentence *sentence = [Sentence sharedSentence];
 
    UITouch *touch = [touches anyObject];
    
    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
    for (SKSpriteNode *node in nodes) {
        if ([node.name isEqualToString:@"todayNode"])
        {
            if (sentence.level > 0){
            node.zPosition = 1000;
            node.size = CGSizeMake(4000,4000);
            SKAction *moveintoplace = [SKAction sequence: @[
                                                            [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame),
                                                                                         45) duration:1],
                                                            [SKAction scaleTo:0.7778 duration:1],
                                                            [SKAction rotateByAngle:M_PI/2 duration:2]
                                                            ]];
            [node runAction: moveintoplace completion:^{
                SKScene *spaceshipScene  = [[SpriteMyScene alloc] initWithSize:self.size];
                [self.view presentScene:spaceshipScene];
            }];
            }
        }
        else if ([node.name isEqualToString:@"yesterdayNode"])
        {
            if (sentence.level > 0) {
            node.zPosition = 1000;
            node.size = CGSizeMake(4000,4000);
            SKAction *moveintoplace = [SKAction sequence: @[
                                                            [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame),
                                                                                         45) duration:1],
                                                            [SKAction scaleTo:0.7778 duration:1],
                                                            [SKAction rotateByAngle:M_PI/2 duration:2]
                                                            ]];
            [node runAction: moveintoplace completion:^{
                SKScene *spaceshipScene  = [[YesterdayScene alloc] initWithSize:self.size];
                [self.view presentScene:spaceshipScene];
            }];
        }
        }

        else if ([node.name isEqualToString:@"emiNode"])
        {
            if (sentence.level >0){
            node.zPosition = 1000;
            node.size = CGSizeMake(4000,4000);
            SKAction *moveintoplace = [SKAction sequence: @[
                                                            [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame),
                                                                                         45) duration:1],
                                                            [SKAction scaleTo:0.7778 duration:1],
                                                            [SKAction rotateByAngle:M_PI/2 duration:2]
                                                            ]];
            [node runAction: moveintoplace completion:^{
                SKScene *spaceshipScene  = [[EmiScene alloc] initWithSize:self.size];
                [self.view presentScene:spaceshipScene];
            }];
            }
        }
        else if ([node.name isEqualToString:@"piNode"])
        {
            if (sentence.level >0){
            node.zPosition = 1000;
            node.size = CGSizeMake(4000,4000);
            SKAction *moveintoplace = [SKAction sequence: @[
                                                            [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame),
                                                                                         45) duration:1],
                                                            [SKAction scaleTo:0.7778 duration:1],
                                                            [SKAction rotateByAngle:M_PI/2 duration:2]
                                                            ]];
            [node runAction: moveintoplace completion:^{
                SKScene *spaceshipScene  = [[PiScene alloc] initWithSize:self.size];
                [self.view presentScene:spaceshipScene];
            }];
            }
        }
        else if ([node.name isEqualToString:@"Tomorrow"])
        {
            if (sentence.level >0) {
            node.zPosition = 1000;
            node.size = CGSizeMake(4000,4000);
         //   Sentence *sentence = [Sentence sharedSentence];
          //  if ([sentence.gameLevel isEqualToString:@"foobie"]){
          
                SKAction *moveintoplace = [SKAction sequence: @[
                                                                [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame),
                                                                                             45) duration:1],
                                                                [SKAction scaleTo:0.7778 duration:1],
                                                                [SKAction rotateByAngle:M_PI/2 duration:2]
                                                                ]];
                [node runAction: moveintoplace completion:^{
                    SKScene *spaceshipScene  = [[TomorrowScene alloc] initWithSize:self.size];
                    [self.view presentScene:spaceshipScene];
                }];
            }
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

   [self addChild:[self newEmi]];

}
@end
