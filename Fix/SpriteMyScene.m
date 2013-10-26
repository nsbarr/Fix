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
#import <QuartzCore/QuartzCore.h>


@interface SpriteMyScene () <SKPhysicsContactDelegate>
@property BOOL contentCreated;


@end

CGFloat _sentenceheight = 0.00f; //tracks height of sentence so we know whether to affix a word
int lengthofsentence = 1; //how many words is the sentence? used to generate the right words
NSString *sentenceSoFar = nil; //tracks the text of the sentence
BOOL isGameOver = NO; //game is not over
BOOL didIRun = NO;

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
}


-(SKSpriteNode *)hero {
    
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"hero";
    hello.fontSize = 18;
    hello.text= @"Today ";
    [testNode addChild:hello];
    testNode.zRotation=M_PI/2;
    testNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:hello.frame.size];
    testNode.physicsBody.dynamic = NO;
    testNode.physicsBody.categoryBitMask = heroCategory;
    testNode.physicsBody.contactTestBitMask = rainCategory | heroCategory;
    testNode.physicsBody.collisionBitMask = 0;
    testNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                 hello.frame.size.width);
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
    
    NSArray *word1 = @[ @"I", @"you", @"he", @"she", @"we", @"someone", @"they" ];
    NSArray *word2 = @[ @"broke", @"hurt", @"lost", @"ruined", @"tore", @".", @"missed" ];
    NSArray *word3 = @[ @"the", @"my", @"our", @"every", @"this", @".", @"?"];
    NSArray *word4 = @[ @"world", @"bed", @"mirror", @"heart", @"chance", @".", @"?"];
    NSArray *word5 = @[ @"that", @".", @"!", @"?", @".", @"!", @"?"];
    NSArray *arrayOfArrays = [[NSArray alloc] initWithObjects:word1, word2, word3, word4, word5, nil];

    if (lengthofsentence > 5){
        lengthofsentence = 1;
    }
    SKSpriteNode *parentNode = [[SKSpriteNode alloc] init];
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    [parentNode addChild: hello];
    
    hello.text = [[arrayOfArrays objectAtIndex:lengthofsentence - 1] objectAtIndex:rndInt(0,6)];
    hello.name = hello.text;
    hello.fontSize = 18;

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
            
            SKScene *spaceshipScene  = [[WelcomeMenu alloc] initWithSize:self.size];
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
    SKNode *labelNode = arrayOfChildren[0];
    
    
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
    
        //if it's a ".", end the game.
        if ([labelNode.name isEqual:@"."] || [labelNode.name isEqual:@"?"] || [labelNode.name isEqual:@"!"] ) {
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
        hello.fontSize = 18;
        hello.text= @"Tweet";
        testNode.zRotation = M_PI/2;
        testNode.position = CGPointMake(230,58);
        testNode.size = CGSizeMake(100,100);
        [testNode addChild:hello];
        [self addChild: testNode];
        
        
        SKSpriteNode *otherNode = [[SKSpriteNode alloc] init];//parent
        SKLabelNode *hi = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
        otherNode.name= @"NewGame";
        hi.fontSize = 18;
        hi.text= @"Again";
        otherNode.zRotation = M_PI/2;
        otherNode.position = CGPointMake(230,510);
        otherNode.size = CGSizeMake(100,100);
        [otherNode addChild:hi];
        [self addChild: otherNode];
        didIRun = YES;

            }

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