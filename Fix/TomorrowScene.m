//
//  YesterdayScene.m
//  Fix
//
//  Created by Nicholas Barr on 11/18/13.
//  Copyright (c) 2013 Nicholas Barr. All rights reserved.
//

#import "TomorrowScene.h"


#import "SpriteMyScene.h"
#import "SpriteViewController.h"
#import "Sentence.h"
#import "WelcomeMenu.h"
#import "AgainMenu.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>

@interface TomorrowScene () <SKPhysicsContactDelegate>

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
static NSString *theCorpus = @"Tomorrow never knows, that's how the story goes. What will be or won't be. That's what the mystery you and me see, that's what sets us free, what sets us apart, what about matters of the heart? What matters, tomorrow matters. Matters and mad hatters. Together or apart, there's so much we can do. So much fun and so we go. Tomorrow will you pick up some bread the pick up lines I said. Tomorrow, Tomorrow, I will love you in the near future. What future may come the mystery of what may come. I may come I may not, the future is uncertain. We will be on a beach we will be together tomorrow. I remember the future. I remember the slap slap of her flip flops and how quickly I learned her walk and how quickly it meant nothing to me I remember the slap you say I gave you and hold over my head tomorrow will it head in the right direction and what direction is right? How many more times will you come. How many more times will you come more times than one. The mistakes we still might make the times you come might be fake. These were my final mistakes, you were someone to blame for not taking chances. Taking matters into my own hands I watched you walk and said stop like you say stop before the times you come. My own hands and the smell that sets them apart. I learned what sets us apart. Forget about her. Forget about the time we spent together. Forget today. Forget yesterday. Forget tomorrow. Remember the way we will touch on the subway. how we will keep in touch after, how your jacket will brush against mine, nothing against you, there's so much we can do. the way. that you. do I. want that. too too. When you get off I get off. We show up at Lorimer at the same time. What time is it at tomorrow.";

//physics body masks
static const uint32_t rainCategory       =  0x1 << 0;
static const uint32_t heroCategory       =  0x1 << 1;


@implementation TomorrowScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        isGameOver = NO;
        didIRun = NO;
        lengthofsentence = 1;
        sentenceTooTall = NO;
        //[self generateWord];
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
    UIColor *deep = [UIColor colorWithRed:11.0/255 green:17.0/255 blue:26.0/255 alpha:1];
    self.backgroundColor = deep;
}


-(SKSpriteNode *)hero {
    
    NSArray *sourceText = [theCorpus componentsSeparatedByString:@" "];
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"hero";
    hello.fontSize = wordFontSize;
    // NSUInteger randomSourceIndex = arc4random() % [sourceText count];
    //  previousWord = [sourceText objectAtIndex:randomSourceIndex];
    //  hello.text = [previousWord.capitalizedString stringByAppendingString:@" "];
    hello.text = @"Tomorrow";
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
    
    
    NSString *separators = @",!./;?-";
    NSCharacterSet *setOfseparators = [NSCharacterSet characterSetWithCharactersInString:separators];
    
    NSArray *sourceText = [theCorpus componentsSeparatedByString:@" "];
    
    
    
    //   NSArray *sourceText = @[@"this",@"must",@"be",@"a",@"text",@"this",@"is",@"a",@"joke",@"this",@"is",@"always",@"joke"];
    if (previousWord == nil){
        // NSUInteger randomSourceIndex = arc4random() % [sourceText count];
        //previousWord = [sourceText objectAtIndex:randomSourceIndex];
        NSLog(@"loadedtooearly");
    }
    NSLog(@"the previous word is %@", previousWord);
    NSMutableArray *possibleWords = [[NSMutableArray alloc]init];
    int i;
    for (i = 0; i < [sourceText count]; i++) {
        
        NSInteger indexOfTheNextWordCandidate = i+1;
        //NSString *nextWordCandidate = nil;
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
                                                      [SKAction moveTo:CGPointMake(xlocation, node.position.y) duration:time]]];
            [node runAction: [SKAction repeatAction: teleport count:(1)]];
            
        }];
    }
}


- (void)touchesBegan:(NSSet *) touches withEvent:(UIEvent *)event {
    
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
                                                      [SKAction moveTo:CGPointMake(xlocation, node.position.y) duration:time]]];
            [node runAction: [SKAction repeatAction: teleport count:(1)]];
            
        }];
    }
    
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
    //SKNode *hero = [self childNodeWithName:@"hero"];
    SKNode *parentNode = firstBody.node;
    NSArray *arrayOfChildren = firstBody.node.children;
    SKLabelNode *labelNode = arrayOfChildren[0];
    
    
    if (contact.contactPoint.y > _sentenceheight){
        NSLog(@"high as hell");
        // + labelNode.frame.size.width/2
        
        _sentenceheight = contact.contactPoint.y;
        
        
        
        
        //Fix its x position to the hero's
        [parentNode removeAllActions];
        // parentNode.position = CGPointMake(hero.position.x, contact.contactPoint.y);
        
        // labelNode.position = CGPointMake(hero.position.x, _sentenceheight);
        
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
  //  SKAction *schoochDown = [SKAction moveByX:0 y:-5 duration:.5];

    if (_sentenceheight > self.frame.size.height - 400){
      //  sentenceTooTall = YES;
     //   [self enumerateChildNodesWithName:@"hero" usingBlock:^(SKNode *node, BOOL *stop) {
    //        [node runAction:schoochDown];
            
     //   }];
    }
    
}

-(void)update:(CFTimeInterval)currentTime {
    
    
    if (isGameOver){
        if (!didIRun){
            [self removeAllActions];
            [self movetoplace];
            Sentence *sentence = [Sentence sharedSentence];
            sentence.fullText = sentenceSoFar;
            
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
    
    
    
    //  SKAction *fall = [SKAction moveTo:CGPointMake(hello.position.x,-20) duration:1];
    
    [hello runAction: fall];
    
    [self addChild: hello];
    
    
    
}


@end
