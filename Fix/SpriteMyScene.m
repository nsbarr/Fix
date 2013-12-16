//
//  SpriteMyScene.m
//  Fix
//
//  Created by Nicholas Barr on 10/3/13.
//  Copyright (c) 2013 Nicholas Barr. All rights reserved.
//

#import "SpriteMyScene.h"
#import "SpriteViewController.h"
#import "Sentence.h"
#import "WelcomeMenu.h"
#import "AgainMenu.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>


@interface SpriteMyScene () <SKPhysicsContactDelegate>
@property BOOL contentCreated;


@end

static CGFloat _sentenceheight = 0.00f; //tracks height of sentence so we know whether to affix a word
static int lengthofsentence = 1; //how many words is the sentence? used to generate the right words
static NSString *sentenceSoFar = nil; //tracks the text of the sentence
static BOOL isGameOver = NO; //game is not over
static BOOL didIRun = NO;
static BOOL sentenceTooTall = NO;
static int wordFontSize = 14;
static NSString *previousWord = nil;
static NSString *theCorpus = @"Today you ruined my life. Today you ruined my world. Today you missed the chance to see me for who I was. Today never was about you or me; today was always about the bed that you wrecked, the stains you left. Today I missed you. Today the mirror broke and so did my heart. My heart that broke today like the mirror broke and so did the bed when you did what you did what I knew you would do to my life. This heart, this world, this chance, this life, it all ended today. Broke like it ended; ended like it broke like the chance that we had but we didn't take. What do you see when you see yourself in the mirror do you see the life we could've had but didn't, the life that you ended, that you tore apart, apart from me. Today is gone, it's wrecked, I'm broke because of you. Today is wrecked, gone because you wrecked it. Today is ruined by the way you ended it. You broke my heart. You left me. You left me broke. You left the bed. You left when I broke. Today ended this mirror. The future is no yesterday. The future is so yesterday. Today is tomorrow is yesterday is no. This heart is no mirror, this world is no chance, it's no it's not it's over. Today is over.";

//physics body masks
static const uint32_t rainCategory       =  0x1 << 0;
static const uint32_t heroCategory       =  0x1 << 1;

@implementation SpriteMyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        isGameOver = NO;
        didIRun = NO;
        lengthofsentence = 1;
        sentenceTooTall = NO;
    }
    return self;
}

- (void)didMoveToView: (SKView *) view
{
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
        
    }
    self.physicsWorld.gravity = CGVectorMake(0.0,0.0);
    self.physicsWorld.contactDelegate = self;
    UIColor *mid = [UIColor colorWithRed:16.0/255 green:23.0/255 blue:32.0/255 alpha:1];
    self.backgroundColor = mid;
}


-(SKSpriteNode *)hero {
    
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"hero";
    hello.fontSize = wordFontSize;
    hello.text = @"Today";
    previousWord = hello.text;
    hello.text = [hello.text.capitalizedString stringByAppendingString:@" "];
    [testNode addChild:hello];
    testNode.zRotation=M_PI/2;
    testNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:hello.frame.size];
    testNode.physicsBody.dynamic = NO;
    testNode.physicsBody.categoryBitMask = heroCategory;
    testNode.physicsBody.contactTestBitMask = rainCategory | heroCategory;
    testNode.physicsBody.collisionBitMask = 0;
    testNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                    45);
    _sentenceheight = hello.frame.size.width/2;
    
    sentenceSoFar=hello.text;
    return testNode;
}




static inline CGFloat skRandf() {
    return rand() / (CGFloat) RAND_MAX;
}

static inline CGFloat skRand(CGFloat low, CGFloat high) {
    return skRandf() * (high - low) + low;
}

static inline CGFloat rndValue(CGFloat low, CGFloat high) {
    return skRandf() * (high - low) + low;
}

static inline NSUInteger rndInt(NSUInteger low, NSUInteger high) {
    return skRandf() * (high - low) + low;
}




- (void)addWord
{
    NSArray *sourceText = [theCorpus componentsSeparatedByString:@" "];
    
    if (previousWord == nil){
        NSLog(@"loadedtooearly");
    }
    
    NSLog(@"the previous word is %@", previousWord);
    NSMutableArray *possibleWords = [[NSMutableArray alloc]init];
    
    int i;
    for (i = 0; i < [sourceText count]; i++) {
        
        NSInteger indexOfTheNextWordCandidate = i+1;
        NSString *string = [sourceText objectAtIndex:i];
        if ([string isEqualToString:previousWord])
        {
            NSString *nextWordCandidate = sourceText[indexOfTheNextWordCandidate];
            [possibleWords addObject:nextWordCandidate];
        }
        
        
    }
    NSUInteger randomIndex = arc4random() % [possibleWords count];
    NSString *nextWord = [possibleWords objectAtIndex:randomIndex];
    
    SKSpriteNode *parentNode = [[SKSpriteNode alloc] init];
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.text = nextWord;
    
    [parentNode addChild: hello];
    
    
    hello.name = hello.text;
    hello.fontSize = wordFontSize;
    
    parentNode.name = @"rain";
    parentNode.position = CGPointMake(skRand(0, self.size.width), self.size.height+100);
    parentNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(hello.frame.size.width+10,hello.frame.size.height)];
    parentNode.physicsBody.usesPreciseCollisionDetection = YES;
    parentNode.physicsBody.dynamic = YES;
    parentNode.physicsBody.categoryBitMask = rainCategory;
    parentNode.physicsBody.contactTestBitMask = heroCategory | rainCategory;
    parentNode.physicsBody.collisionBitMask = heroCategory | rainCategory;
    parentNode.zRotation = M_PI/rndValue(1.8,2.2);
    
    SKAction *fall = [SKAction moveTo:CGPointMake(parentNode.position.x,-20) duration:4];
    
    [parentNode runAction: fall];
    [self addChild: parentNode];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (isGameOver) {
        //don't respond to touch
    }
    
    else {
        SKNode *hello = [self childNodeWithName:@"hero"];
        UITouch *touch = [touches anyObject];
        CGPoint pointToMove = [touch locationInNode: self];
        CGFloat xlocation = pointToMove.x;
        float speed = 400;
        float distance = ABS(xlocation - hello.position.x)/1.0;
        float time = distance/speed;
        
        [self enumerateChildNodesWithName:@"hero" usingBlock:^(SKNode *node, BOOL *stop) {
            
            SKAction *teleport = [SKAction sequence:@[
                                                      [SKAction waitForDuration:0],
                                                      [SKAction moveToX:xlocation duration:time]]];
            [node runAction: [SKAction repeatAction: teleport count:(1)]];
            
        }];
    }
}

- (void)touchesEnded:(NSSet *) touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    if (isGameOver) {
        //don't respond to touch
    }
    else {
        
        SKNode *hello = [self childNodeWithName:@"hero"];
        CGPoint pointToMove = [touch locationInNode: self];
        
        CGFloat xlocation = pointToMove.x;
        float speed = 1000;
        float distance = ABS(xlocation - hello.position.x)/1.0;
        float time = distance/speed;
        
        [self enumerateChildNodesWithName:@"hero" usingBlock:^(SKNode *node, BOOL *stop) {
            
            SKAction *teleport = [SKAction sequence:@[
                                                      [SKAction waitForDuration:0],
                                                      [SKAction moveToX:xlocation duration:time]]];
            [node runAction: [SKAction repeatAction: teleport count:(1)]];
            
        }];
    }
}

- (void)touchesBegan:(NSSet *) touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    
    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
    _spriteViewController = self.view.window.rootViewController;
    
    
    //Behavior for our Tweet and Again buttons, that only appear when the game is over
    
    for (SKNode *node in nodes) {
        if ([node.name isEqualToString:@"OpenTweet"]) {
            NSLog(@"button was tapped");
            if (!_spriteViewController){
                NSLog(@"No sprite view controller :(");
            }
            
            [_spriteViewController showTweetButton];
            
            
        }
        else if ([node.name isEqualToString:@"NewGame"]) {
            
            SKScene *spaceshipScene  = [[AgainMenu alloc] initWithSize:self.size];
            SKView * skView = (SKView *)_spriteViewController.view;
            [skView presentScene:spaceshipScene];
            
        }
    }
    
    
}

- (void)didBeginContact:(SKPhysicsContact *)contact {
    
    NSLog(@"contact!");
    SKPhysicsBody *firstBody, *secondBody;
    //update sentence height
    
    //Establishes the firstBody as the falling word.
    
    
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask)
    {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    }
    else
    {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    
    //theNode is the SKLabelNode, firstBody.node is its parent, hero is the root word
    SKNode *parentNode = firstBody.node;
    NSArray *arrayOfChildren = firstBody.node.children;
    SKLabelNode *labelNode = arrayOfChildren[0];
    
    
    if (contact.contactPoint.y > _sentenceheight){
        NSLog(@"high as hell");
        
        _sentenceheight = contact.contactPoint.y;
        
        [parentNode removeAllActions];
        
        //try to do some stuff to make it stay put and not register more contacts
        firstBody.node.physicsBody.categoryBitMask = heroCategory;
        firstBody.node.physicsBody.contactTestBitMask = rainCategory;
        
        
        //append the label to the sentence (tracking for Twitter)
        NSString *wordToAppend = [labelNode.name stringByAppendingString:@" "];
        sentenceSoFar = [sentenceSoFar stringByAppendingString:wordToAppend];
        NSLog(@"%@",sentenceSoFar);
        
        
        previousWord = labelNode.name;
        
        //now look at what kind of item it is. If it's a mirror, then invert the words.
        if ([labelNode.name  isEqual: @"mirror"]){
            
            SKAction *mirror = [SKAction sequence: @[
                                                     [SKAction scaleXTo:-1 y:1 duration:.3],
                                                     [SKAction waitForDuration:3.0 withRange:0.25],
                                                     [SKAction scaleXTo: 1 y:1 duration:.3]
                                                     ]];
            NSArray *nodes = self.children;
            for (SKNode *node in nodes) {
                [node runAction: mirror];
            }
        }
        
        if ([labelNode.name  isEqual: @"love"]){
            UIColor *red = [UIColor redColor];
            UIColor *white = [UIColor whiteColor];
            SKAction *turnRed = [SKAction sequence: @[
                                                      [SKAction scaleBy:.8 duration:.15],
                                                      [SKAction scaleBy:1.75 duration:.3],
                                                      [SKAction scaleBy:.714285714 duration:.5],
                                                      [SKAction waitForDuration:0.15],
                                                      
                                                      
                                                      // [SKAction scaleBy: -1.5 duration: 1],
                                                      ]];
            labelNode.fontColor = red;
            [labelNode runAction: [SKAction repeatAction:turnRed count:3] completion:^{
                labelNode.fontColor = white;
            }];
            
            [self enumerateChildNodesWithName:@"hero" usingBlock:^(SKNode *node, BOOL *stop) {
                SKLabelNode *theLabel = node.children[0];
                theLabel.fontColor = red;
                [theLabel runAction: [SKAction repeatAction:turnRed count:3] completion:^{
                    theLabel.fontColor = white;
                }];
            }];
            
            
            
        }
        
        
        
        //if it has a ".", end the game.
        if ([labelNode.name isEqual:@"."] || [labelNode.name isEqual:@"?"] || [labelNode.name isEqual:@"!"] ) {
            isGameOver = YES;
            
        }
        
        if ([labelNode.name rangeOfString:@"."].location == NSNotFound){
            isGameOver = NO;
        }
        else {
            isGameOver = YES;
        }
        lengthofsentence = lengthofsentence + 1;
        
        
        
        //fade out all other nodes
        parentNode.name = @"hero";
        [self enumerateChildNodesWithName:@"rain" usingBlock:^(SKNode *node, BOOL *stop) {
            node.physicsBody.categoryBitMask = 0;
            node.physicsBody.contactTestBitMask = 0;
            node.physicsBody.collisionBitMask = 0;
            SKAction *disappear = [SKAction fadeOutWithDuration:2];
            [node runAction: disappear];
        }];
        
        
    }
    //this just tracks that contact happened too late
    
    else {
        
        NSLog(@"getlow");
    }
    
    
}


- (void)createSceneContents
{
    [self addChild:[self hero]];
    
    SKAction *makeRoids = [SKAction sequence: @[
                                                [SKAction performSelector:@selector(addRoids) onTarget:self],
                                                [SKAction waitForDuration:0 withRange:0.25]
                                                ]];
    [self runAction: [SKAction repeatActionForever:makeRoids]];
    
    
    SKAction *makeWord = [SKAction sequence: @[
                                               [SKAction performSelector:@selector(addWord) onTarget:self],
                                               [SKAction waitForDuration:1.0 withRange:0.25]
                                               ]];
    [self runAction: [SKAction repeatActionForever:makeWord]];
    
    
}






-(void)didSimulatePhysics
{
    [self enumerateChildNodesWithName:@"rain" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.y < 0){
            [node removeFromParent];
        }
        else if (node.position.y <_sentenceheight){
            node.physicsBody.categoryBitMask = 0;
            node.physicsBody.contactTestBitMask = 0;
            node.physicsBody.collisionBitMask = 0;
            SKAction *disappear = [SKAction fadeOutWithDuration:2];
            [node runAction: disappear];
        }
    }];
    [self enumerateChildNodesWithName:@"roids" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.y < 0){
            [node removeFromParent];
        }
    }];
    SKAction *schoochDown = [SKAction moveByX:0 y:-200 duration:1];
    
    if (_sentenceheight > self.frame.size.height - 150){
        sentenceTooTall = YES;
    }
    if (sentenceTooTall){
        sentenceTooTall = !sentenceTooTall;
        [self enumerateChildNodesWithName:@"hero" usingBlock:^(SKNode *node, BOOL *stop) {
            [node runAction:schoochDown];
            NSLog(@"schooching");
            _sentenceheight = _sentenceheight - 200;
        }];
    }
    
    
}

-(void)update:(CFTimeInterval)currentTime {
    
    
    if (isGameOver){
        if (!didIRun){
            [self removeAllActions];
            [self movetoplace];
            Sentence *sentence = [Sentence sharedSentence];
            sentence.fullText = sentenceSoFar;
            if (sentence.level <2){
            sentence.level = 2;
            }
            SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
            SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
            testNode.name= @"OpenTweet";
            hello.fontSize = wordFontSize;
            hello.text= @"Tweet";
            testNode.zRotation = M_PI/2;
            testNode.position = CGPointMake((self.frame.size.width - 40),
                                            60);
            testNode.size = CGSizeMake(100,100);
            [testNode addChild:hello];
            [self addChild: testNode];
            
            
            SKSpriteNode *otherNode = [[SKSpriteNode alloc] init];//parent
            SKLabelNode *hi = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
            otherNode.name= @"NewGame";
            hi.fontSize = wordFontSize;
            hi.text= @"Again";
            otherNode.zRotation = M_PI/2;
            otherNode.position = CGPointMake((self.frame.size.width - 40),
                                             self.frame.size.height-60);
            otherNode.size = CGSizeMake(100,100);
            [otherNode addChild:hi];
            [self addChild: otherNode];
            didIRun = YES;
            
        }
        
    }
    if (sentenceTooTall){
        
    }
}



-(void)movetoplace
{
    CGFloat xlocation = 100;
    
    [self enumerateChildNodesWithName:@"abouttogetstuck" usingBlock:^(SKNode *node, BOOL *stop) {
        node.userInteractionEnabled = NO;
    }];
    [self enumerateChildNodesWithName:@"hero" usingBlock:^(SKNode *node, BOOL *stop) {
        node.userInteractionEnabled = NO;
    }];
    
    [self enumerateChildNodesWithName:@"hero" usingBlock:^(SKNode *node, BOOL *stop) {
        
        SKAction *teleport = [SKAction sequence:@[
                                                  [SKAction waitForDuration:0],
                                                  [SKAction moveTo:CGPointMake(xlocation, node.position.y) duration:1]]];
        [node runAction: [SKAction repeatAction: teleport count:(1)]];
    }];
    
    [self enumerateChildNodesWithName:@"abouttogetstuck" usingBlock:^(SKNode *node, BOOL *stop) {
        
        SKAction *teleport = [SKAction sequence:@[
                                                  [SKAction waitForDuration:0],
                                                  [SKAction moveTo:CGPointMake(xlocation, node.position.y) duration:1]]];
        [node runAction: [SKAction repeatAction: teleport count:(1)]];
    }];
    
    
}

- (void)addRoids
{
    NSUInteger rando = rndInt(0,3);
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.name = @"roids";
    hello.text = @";";
    SKAction *fall = nil;
    
    if (rando == 0){
        hello.fontSize = 8;
        hello.alpha = 0.4;
        hello.position = CGPointMake(skRand(0, self.size.width), self.size.height+100);
        
        fall = [SKAction moveTo:CGPointMake(hello.position.x,-20) duration:3];
    }
    else if(rando == 1){
        hello.fontSize = 10;
        hello.alpha = 0.5;
        hello.position = CGPointMake(skRand(0, self.size.width), self.size.height+100);
        
        fall = [SKAction moveTo:CGPointMake(hello.position.x,-20) duration:2];
    }
    else {
        hello.fontSize = 12;
        hello.alpha = 0.7;
        hello.position = CGPointMake(skRand(0, self.size.width), self.size.height+100);
        
        fall = [SKAction moveTo:CGPointMake(hello.position.x,-20) duration:1];
    }
    hello.physicsBody.dynamic = NO;
    
    
    
    [hello runAction: fall];
    
    [self addChild: hello];
    
    
    
}


@end
