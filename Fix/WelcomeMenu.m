//
//  WelcomeMenu.m
//  Fix
//
//  Created by Nicholas Barr on 10/11/13.
//  Copyright (c) 2013 Nicholas Barr. All rights reserved.
//

#import "WelcomeMenu.h"
#import "SpriteMyScene.h"
#import "AgainMenu.h"
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
  //  SKAction *makeWord = [SKAction sequence: @[
   //                                            [SKAction performSelector:@selector(addWord) onTarget:self],
   //                                            [SKAction waitForDuration:0 withRange:0.25]
    //                                           ]];
  //  [self runAction: [SKAction repeatActionForever:makeWord]];
   // [self addChild: [self newHero]];

    [self addChild: [self skipButton]];
    [self addChild: [self sentenceOne]];
   // [self addChild: [self sentenceTwo]];
  //  [self addChild: [self sentenceThree]];
   // [self addChild: [self sentenceFour]];
   // [self addChild: [self sentenceFive]];
   // [self addChild: [self sentenceSix]];
   // [self addChild: [self sentenceSeven]];
   // [self addChild: [self sentenceEight]];
   // [self addChild: [self sentenceNine]];
   // [self addChild: [self sentenceTen]];


  
}

-(SKSpriteNode *)skipButton {
    
    SKSpriteNode *parentNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.fontSize = 14;
    parentNode.size = CGSizeMake(200,200);
    parentNode.name = @"skipButton";
    hello.text = @"Skip";
    hello.position = CGPointMake(self.frame.size.width-40,
                                 40);
    [parentNode addChild:hello];
    return parentNode;

}



-(SKLabelNode *)sentenceOne {
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.fontSize = 18;
    hello.name = @"sentenceOne";
    hello.text = @"Our mission seems strange.";
    hello.position = CGPointMake(CGRectGetMidX(self.frame),
                                 CGRectGetMidY(self.frame));
    return hello;

}

-(SKLabelNode *)sentenceTwo {
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.fontSize = 18;
    hello.name = @"sentenceTwo";
    hello.text = @"We broadcast radio waves.";
    hello.position = CGPointMake(CGRectGetMidX(self.frame),
                                 CGRectGetMidY(self.frame));
    return hello;
    
}

-(SKLabelNode *)sentenceThree {
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.fontSize = 18;
    hello.name = @"sentenceThree";
    hello.text = @"Large primes. Tweets.";
    hello.position = CGPointMake(CGRectGetMidX(self.frame),
                                 CGRectGetMidY(self.frame));
    return hello;
    
}

-(SKLabelNode *)sentenceFour {
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.fontSize = 18;
    hello.name = @"sentenceFour";
    hello.text = @"That sort of thing.";
    hello.position = CGPointMake(CGRectGetMidX(self.frame),
                                 CGRectGetMidY(self.frame));
    return hello;
    
}

-(SKLabelNode *)sentenceFive {
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.fontSize = 18;
    hello.name = @"sentenceFive";
    hello.text = @"They call us spammers.";
    hello.position = CGPointMake(CGRectGetMidX(self.frame),
                                 CGRectGetMidY(self.frame));
    return hello;
    
}

-(SKLabelNode *)sentenceSix {
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.fontSize = 18;
    hello.name = @"sentenceSix";
    hello.text = @"But near Alpha Centauri,";
    hello.position = CGPointMake(CGRectGetMidX(self.frame),
                                 CGRectGetMidY(self.frame));
    return hello;
    
}


-(SKLabelNode *)sentenceSeven {
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.fontSize = 18;
    hello.name = @"sentenceSeven";
    hello.text = @"we picked up a response.";
    hello.position = CGPointMake(CGRectGetMidX(self.frame),
                                 CGRectGetMidY(self.frame));
    return hello;
    
}

-(SKLabelNode *)sentenceEight {
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.fontSize = 18;
    hello.name = @"sentenceEight";
    hello.text = @"Is it a signal? Noise?";
    hello.position = CGPointMake(CGRectGetMidX(self.frame),
                                 CGRectGetMidY(self.frame));
    return hello;
    
}

-(SKLabelNode *)sentenceNine {
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.fontSize = 18;
    hello.name = @"sentenceNine";
    hello.text = @"Our own echo?";
    hello.position = CGPointMake(CGRectGetMidX(self.frame),
                                 CGRectGetMidY(self.frame));
    return hello;
    
}

-(SKLabelNode *)sentenceTen {
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.fontSize = 18;
    hello.name = @"sentenceTen";
    hello.text = @"It's doing something to us.";
    hello.position = CGPointMake(CGRectGetMidX(self.frame),
                                 CGRectGetMidY(self.frame));
    return hello;
    
}

-(SKLabelNode *)sentenceEleven {
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.fontSize = 18;
    hello.name = @"sentenceEleven";
    hello.text = @"Making us forget.";
    hello.position = CGPointMake(CGRectGetMidX(self.frame),
                                 CGRectGetMidY(self.frame));
    return hello;
    
}

-(SKLabelNode *)sentenceTwelve {
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.fontSize = 18;
    hello.name = @"sentenceTwelve";
    hello.text = @"Making us remember...";
    hello.position = CGPointMake(CGRectGetMidX(self.frame),
                                 CGRectGetMidY(self.frame));
    return hello;
    
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
    [self addChild: hello];


    
}

- (void)touchesBegan:(NSSet *) touches withEvent:(UIEvent *)event
{


    UITouch *touch = [touches anyObject];
    NSArray *myChildren = [self children];
    
    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
    
    
    for (SKNode *node in nodes) {
        if ([node.name isEqualToString:@"todayNode"])
        {
            SKAction *moveintoplace = [SKAction sequence: @[
                                                            [SKAction moveByX: 0 y: -220 duration: 0.5],
                                                            [SKAction rotateByAngle:M_PI/2 duration:2]
                                                            ]];
                        [node runAction: moveintoplace completion:^{
                            SKScene *spaceshipScene  = [[SpriteMyScene alloc] initWithSize:self.size];
                            [self.view presentScene:spaceshipScene];
                        }];    }
        else if ([node.name isEqualToString:@"skipButton"])
        {
            SKScene *spaceshipScene  = [[AgainMenu alloc] initWithSize:self.size];
            [self.view presentScene:spaceshipScene];
        }
    }
    
    for (SKNode *node in myChildren) {
    
        
    if ([node.name isEqualToString:@"sentenceOne"])
    {
        SKAction *fadeOut = [SKAction fadeOutWithDuration:1];
        [node runAction: fadeOut completion:^{
            [self addChild: [self sentenceTwo]];
            [node removeFromParent];

        }];
        
    }
    else if ([node.name isEqualToString:@"sentenceTwo"])
    {
        SKAction *fadeOut = [SKAction fadeOutWithDuration:1];
        [node runAction: fadeOut completion:^{
            [self addChild: [self sentenceThree]];
            [node removeFromParent];

        }];
        
    }
    else if ([node.name isEqualToString:@"sentenceThree"])
    {
        SKAction *fadeOut = [SKAction fadeOutWithDuration:1];
        [node runAction: fadeOut completion:^{
            [self addChild: [self sentenceFour]];
            [node removeFromParent];

        }];
        
    }
    else if ([node.name isEqualToString:@"sentenceFour"])
    {
        SKAction *fadeOut = [SKAction fadeOutWithDuration:1];
        [node runAction: fadeOut completion:^{
            [self addChild: [self sentenceFive]];
            [node removeFromParent];
        }];
        
    }
 
    else if ([node.name isEqualToString:@"sentenceFive"])
    {
        SKAction *fadeOut = [SKAction fadeOutWithDuration:1];
        [node runAction: fadeOut completion:^{
            [self addChild: [self sentenceSix]];
            [node removeFromParent];
        }];
        
    }
    else if ([node.name isEqualToString:@"sentenceSix"])
    {
        SKAction *fadeOut = [SKAction fadeOutWithDuration:1];
        [node runAction: fadeOut completion:^{
            [self addChild: [self sentenceSeven]];
            [node removeFromParent];
        }];
        
    }
    else if ([node.name isEqualToString:@"sentenceSeven"])
    {
        SKAction *fadeOut = [SKAction fadeOutWithDuration:1];
        [node runAction: fadeOut completion:^{
            [self addChild: [self sentenceEight]];
            [node removeFromParent];
        }];
        
    }
    else if ([node.name isEqualToString:@"sentenceEight"])
    {
        SKAction *fadeOut = [SKAction fadeOutWithDuration:1];
        [node runAction: fadeOut completion:^{
            [self addChild: [self sentenceNine]];
            [node removeFromParent];
        }];
        
    }
    else if ([node.name isEqualToString:@"sentenceNine"])
    {
        SKAction *fadeOut = [SKAction fadeOutWithDuration:1];
        [node runAction: fadeOut completion:^{
            [self addChild: [self sentenceTen]];
            [node removeFromParent];
        }];
        
    }
    else if ([node.name isEqualToString:@"sentenceTen"])
    {
        SKAction *fadeOut = [SKAction fadeOutWithDuration:1];
        [node runAction: fadeOut completion:^{
            [self addChild: [self sentenceEleven]];
            [node removeFromParent];
        }];
        
    }
    else if ([node.name isEqualToString:@"sentenceEleven"])
    {
        SKAction *fadeOut = [SKAction fadeOutWithDuration:1];
        [node runAction: fadeOut completion:^{
            [self addChild: [self sentenceTwelve]];
            [node removeFromParent];
        }];
        
    }
    else if ([node.name isEqualToString:@"sentenceTwelve"])
    {
        SKAction *fadeOut = [SKAction fadeOutWithDuration:1];
        [node runAction: fadeOut completion:^{
            [node removeFromParent];
            SKScene *spaceshipScene  = [[AgainMenu alloc] initWithSize:self.size];
            [self.view presentScene:spaceshipScene];

        }];
        
    }
  

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
