//
//  PiScene.m
//  Fix
//
//  Created by Nicholas Barr on 10/29/13.
//  Copyright (c) 2013 Nicholas Barr. All rights reserved.
//
//3.141592653589793238462643383279502884197169399375105820974944592307816406286


#import "PiScene.h"


#import "SpriteMyScene.h"
#import "SpriteViewController.h"
#import "Sentence.h"
#import "WelcomeMenu.h"
#import "AgainMenu.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "SKTUtils.h"

@interface PiScene () <SKPhysicsContactDelegate>

@property BOOL contentCreated;


@end



static CGFloat _sentenceheight = 0.00f; //tracks height of sentence so we know whether to affix a word
static int lengthofsentence = 1; //how many words is the sentence? used to generate the right words
static NSString *sentenceSoFar = nil; //tracks the text of the sentence
static BOOL isGameOver = NO; //game is not over
static BOOL didIRun = NO;
static BOOL sentenceTooTall = NO;
static int wordFontSize = 14;

//physics body masks
static const uint32_t rainCategory       =  0x1 << 0;
static const uint32_t heroCategory       =  0x1 << 1;


@implementation PiScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        isGameOver = NO;
        didIRun = NO;
        lengthofsentence = 1;
        sentenceTooTall = NO;
       // UIColor *deep = [UIColor colorWithRed:33.0/255 green:43.0/255 blue:53.0/255 alpha:1];
       // self.backgroundColor = deep;
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
    UIColor *deep = [UIColor colorWithRed:33.0/255 green:43.0/255 blue:53.0/255 alpha:1];
    self.backgroundColor = deep;
}


-(SKSpriteNode *)hero {
    
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"hero";
    hello.fontSize = wordFontSize;
    hello.text= @"3.";
    [testNode addChild:hello];
    testNode.zRotation=M_PI/2;
    testNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:hello.frame.size];
    testNode.physicsBody.dynamic = YES;
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

static inline int rndInt(int low, int high) {
    return skRandf() * (high - low) + low;
}



- (void)addWord
{
    
    NSArray *word1 = @[ @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"];
    NSArray *word2 = @[ @"great job", @"you're smart", @"enough already"];

    
    SKSpriteNode *parentNode = [[SKSpriteNode alloc] init];
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    [parentNode addChild: hello];
    if (lengthofsentence >= 20){
        hello.text = [word2 objectAtIndex:rndInt(0,3)];
    }
    else {
   
    hello.text = [word1 objectAtIndex:rndInt(0,10)];
    }
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
        
        
        
        
        
        
        //now look at what kind of item it is. If it's a mirror, then invert the words.
        //3.141592653589793238462643383279502884197169399375105820974944592307816406286
        NSArray *piNumbers = @[ @"1", @"4", @"1", @"5", @"9", @"2", @"6", @"5", @"3", @"5", @"8", @"9", @"7", @"9",@"3",@"2",@"3",@"8",@"4",@"6",@"2",@"6"];
        NSString *correctNumber = [piNumbers objectAtIndex:(lengthofsentence-1)];
        if (![labelNode.name isEqualToString:correctNumber]){
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
                                               [SKAction waitForDuration:0.4 withRange:0.25]
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
    
    if (_sentenceheight > self.frame.size.height - 20){
        isGameOver = YES;
    }
    SKAction *schoochDown = [SKAction moveByX:0 y:-200 duration:1];
    
    if (_sentenceheight > self.frame.size.height - 150){
        sentenceTooTall = YES;
    }
    if (sentenceTooTall){
        sentenceTooTall = !sentenceTooTall;
        _sentenceheight = _sentenceheight - 200;
        [self enumerateChildNodesWithName:@"hero" usingBlock:^(SKNode *node, BOOL *stop) {
            [node runAction:schoochDown];
            NSLog(@"schooching");
        }];
    }

}

-(void)moveHeroFromAcceleration {
    GLKVector3 raw = GLKVector3Make(
    _motionManager.accelerometerData.acceleration.x,
    _motionManager.accelerometerData.acceleration.y,
    _motionManager.accelerometerData.acceleration.z);
    if (GLKVector3AllEqualToScalar(raw, 0)) {
        return;
    }
    
    static GLKVector3 ax, ay, az;
    ay = GLKVector3Make(-0.04f, -0.76f, -0.65f); //comfortable position
    az = GLKVector3Make(0.0f, 1.0f, 0.0f);
    ax = GLKVector3Normalize(GLKVector3CrossProduct(az, ay));
    
    CGPoint accel2D = CGPointZero;
    accel2D.x = GLKVector3DotProduct(raw, az); accel2D.y = GLKVector3DotProduct(raw, ax); accel2D = CGPointNormalize(accel2D);
    
//    static const float steerDeadZone = 0.15;
//    if (fabsf(accel2D.x) < steerDeadZone) accel2D.x = 0;
//    if (fabsf(accel2D.y) < steerDeadZone) accel2D.y = 0;
    
  //  float maxAccelerationPerSecond = _maxSpeed;
    
    
    [self enumerateChildNodesWithName:@"hero" usingBlock:^(SKNode *node, BOOL *stop) {
        SKAction *changeVelocity = [SKAction runBlock:^{
            node.physicsBody.velocity = CGVectorMake(accel2D.x, accel2D.y);
        }];
        [node runAction: changeVelocity];

    }];

}


-(void)update:(CFTimeInterval)currentTime {
    
    NSLog(@"accelerometer [%.2f, %.2f, %.2f]", _motionManager.accelerometerData.acceleration.x, _motionManager.accelerometerData.acceleration.y, _motionManager.accelerometerData.acceleration.z);
    
    
    if (isGameOver){
        if (!didIRun){
            [self removeAllActions];
            [self movetoplace];
            Sentence *sentence = [Sentence sharedSentence];
            sentence.fullText = [NSString stringWithFormat:@"I remember the first %d digits of pi... ", lengthofsentence-1];
            
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
    
    
    [self moveHeroFromAcceleration];
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
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.name = @"roids";
    hello.text = @";";
    hello.fontSize = 8;
    hello.alpha = 0.3;
    hello.position = CGPointMake(skRand(0, self.size.width), self.size.height+100);
    hello.physicsBody.dynamic = NO;
    
    
    
    SKAction *fall = [SKAction moveTo:CGPointMake(hello.position.x,-20) duration:1];
    
    [hello runAction: fall];
    
    [self addChild: hello];
    
    
    
}

@end