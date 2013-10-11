//
//  SpriteMyScene.m
//  Fix
//
//  Created by Nicholas Barr on 10/3/13.
//  Copyright (c) 2013 Nicholas Barr. All rights reserved.
//

#import "SpriteMyScene.h"

@interface SpriteMyScene () <SKPhysicsContactDelegate>
@property BOOL contentCreated;

@end

CGFloat _sentenceheight = 0.00f;
int lengthofsentence = 1;


static const uint32_t rainCategory       =  0x1 << 0;
static const uint32_t heroCategory       =  0x1 << 1;

static NSArray *wordArray = nil;

static float randomIndex = 0;


@implementation SpriteMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */

        
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
    wordArray = [NSArray arrayWithObjects:@"Hello", @"World", @"Help", nil];
    randomIndex = arc4random() % [wordArray count];

    
}


-(SKSpriteNode *)hero {
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"hero";
    hello.fontSize = 18;
    hello.text= @"today";
    [testNode addChild:hello];
    testNode.zRotation=M_PI/2;
    testNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:hello.frame.size];
    testNode.physicsBody.dynamic = NO;
    testNode.physicsBody.categoryBitMask = heroCategory;
    testNode.physicsBody.contactTestBitMask = rainCategory | heroCategory;
    testNode.physicsBody.collisionBitMask = 0;
    testNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                 CGRectGetMidY(self.frame)-220);
    _sentenceheight = hello.frame.size.width;
    return testNode;
    }





NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

-(NSString *) genRandStringLength: (int) len {
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    
    return randomString;
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
    
    NSArray *word1 = @[ @"I", @"you", @"he", @"she" ];
    NSArray *word2 = @[ @"broke", @"saved", @"lost", @"ruined" ];
    NSArray *word3 = @[ @"the", @"my", @"our", @"every"];
    NSArray *word4 = @[ @"world", @"bed", @"mirror", @"heart"];
    NSArray *arrayOfArrays = [[NSArray alloc] initWithObjects:word1, word2, word3, word4, nil];

    if (lengthofsentence > 4){
        lengthofsentence = 1;
    }
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.text = [[arrayOfArrays objectAtIndex:lengthofsentence - 1] objectAtIndex:rndInt(0,4)];
    hello.fontSize = 18;
    hello.name = @"rain";
    hello.position = CGPointMake(skRand(0, self.size.width), self.size.height+100);
    hello.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(hello.frame.size.width+10,hello.frame.size.height+30)];
    hello.physicsBody.usesPreciseCollisionDetection = YES;
    hello.physicsBody.dynamic = YES;
    hello.physicsBody.categoryBitMask = rainCategory;
    hello.physicsBody.contactTestBitMask = heroCategory | rainCategory;
    hello.physicsBody.collisionBitMask = 0;
    hello.zRotation = M_PI/rndValue(1.8,2.2);
    [self addChild: hello];
    SKAction *fall = [SKAction moveTo:CGPointMake(hello.position.x,-20) duration:4];
    [hello runAction: fall];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    SKNode *hello = [self childNodeWithName:@"hero"];
    UITouch *touch = [touches anyObject];
    CGPoint pointToMove = [touch locationInNode: self];
    CGFloat xlocation = pointToMove.x;
    float speed = 400;
    float distance = ABS(xlocation - hello.position.x)/1.0;
    float time = distance/speed;
    
    
    SKAction *teleport = [SKAction sequence:@[
                                              [SKAction waitForDuration:0],
                                              [SKAction moveTo:CGPointMake(xlocation, hello.position.y) duration:time]]];
    [hello runAction: [SKAction repeatAction: teleport count:(1)]];

}


- (void)touchesBegan:(NSSet *) touches withEvent:(UIEvent *)event {
    SKNode *hello = [self childNodeWithName:@"hero"];
    UITouch *touch = [touches anyObject];
    CGPoint pointToMove = [touch locationInNode: self];
    
    CGFloat xlocation = pointToMove.x;
    float speed = 1000;
    float distance = ABS(xlocation - hello.position.x)/1.0;
    float time = distance/speed;
    
    
    SKAction *teleport = [SKAction sequence:@[
                                              [SKAction waitForDuration:0],
                                              [SKAction moveTo:CGPointMake(xlocation, hello.position.y) duration:time]]];
    [hello runAction: [SKAction repeatAction: teleport count:(1)]];
    // NSString *realdistance = [NSString stringWithFormat:@"%f", distance];
}

- (void)didBeginContact:(SKPhysicsContact *)contact {
    
    NSLog(@"contact!");
    SKPhysicsBody *firstBody, *secondBody;
    
    
    if (contact.contactPoint.y > _sentenceheight){
        NSLog(@"high as hell");
    

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
        firstBody.node.physicsBody.categoryBitMask = heroCategory;
        firstBody.node.physicsBody.contactTestBitMask = rainCategory | heroCategory;
        firstBody.node.name = @"abouttogetstuck";
            lengthofsentence = lengthofsentence + 1;
                [firstBody.node removeAllActions];
        [self enumerateChildNodesWithName:@"rain" usingBlock:^(SKNode *node, BOOL *stop) {
            node.physicsBody.categoryBitMask = 0;
            node.physicsBody.contactTestBitMask = 0;
            node.physicsBody.collisionBitMask = 0;
            SKAction *disappear = [SKAction fadeOutWithDuration:1];
            [node runAction: disappear];
        }];

        
    }
    

    //    BOOL sentencegrew = FALSE;
 //       if (sentencegrew == FALSE){
  //          sentencegrew = TRUE;
    //        _sentenceheight = _sentenceheight + firstBody.node.frame.size.width;
    //    }
    
    else {
        NSLog(@"getlow");
    }
    

}
- (void)createSceneContents
{
    [self addChild:[self hero]];
    
    SKAction *makeWord = [SKAction sequence: @[
                                               [SKAction performSelector:@selector(addWord) onTarget:self],
                                               [SKAction waitForDuration:1.0 withRange:0.25]
                                               ]];
    [self runAction: [SKAction repeatActionForever:makeWord]];

    
}




-(void)addJoint:(SKPhysicsJoint *)joint {
    //joint gets created here
}




//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
 
//}


-(void)didSimulatePhysics
{
    [self enumerateChildNodesWithName:@"rain" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.y < 0)
            [node removeFromParent];
    }];
    
}


-(void)update:(CFTimeInterval)currentTime {
    SKNode *hero = [self childNodeWithName:@"hero"];
    /* Called before each frame is rendered */
    [self enumerateChildNodesWithName:@"abouttogetstuck" usingBlock:^(SKNode *node, BOOL *stop) {
    
    node.position = CGPointMake(hero.position.x, node.position.y);
    _sentenceheight = node.position.y;

       // if (node.position.y > _sentenceheight) {
       // }
        
    }];
    
    [self enumerateChildNodesWithName:@"rain" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.y < _sentenceheight)
        {

            SKAction *disappear = [SKAction fadeOutWithDuration:4];
            [node runAction: disappear];
        }
    }];
    }
@end