//
//  YesterdayScene.m
//  Fix
//
//  Created by Nicholas Barr on 11/18/13.
//  Copyright (c) 2013 Nicholas Barr. All rights reserved.
//

#import "YesterdayScene.h"


#import "SpriteMyScene.h"
#import "SpriteViewController.h"
#import "Sentence.h"
#import "WelcomeMenu.h"
#import "AgainMenu.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>


@interface YesterdayScene () <SKPhysicsContactDelegate>

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
static NSString *theCorpus = @"Yesterday was love. The love we had was pure, we laughed pure, the love we laughed our lips touched. We touched lips love long and we had the love. Yesterday we were free. Our lips were pure with the language of love, the love we had we touched free we touched long. The love we had long love the smell of your skin small long we loved the long skin. So long as we laughed as we loved as long as language lived we touched the smell. Long we lived love. Pure love. So warm, long, love. So long. We loved every day. We made love long and you laughed when we touched. Yesterday our language touched long. Yesterday our love touched our pure, the love laughed. The warm love the warm pure way we touched the way we loved. Yesterday was warm. Yesterday was love. We loved. We laughed. We had love language. We lived love. We touched warm. Love was love was long was lips was pure language was when love touched the way language laughed. As a statue, planted on a revolving pedestal, shows now this limb, now that; now front, now back, now side; continually changing, too, its general profile; so does the pivoted, statued soul of man, when turned by the hand of Truth. Lies only never vary; look for no invariableness in Pierre. Nor does any canting showman here stand by to announce his phases as he revolves. Catch his phases as your insight may. Another day passed on; Glen and Frederic still absenting themselves, and Pierre and Isabel and Lucy all dwelling together. The domestic presence of Lucy had begun to produce a remarkable effect upon Pierre. Sometimes, to the covertly watchful eye of Isabel, he would seem to look upon Lucy with an expression illy befitting their singular and so-supposed merely cousinly relation; and yet again, with another expression still more unaccountable to her,--one of fear and awe, not unmixed with impatience. But his general detailed manner toward Lucy was that of the most delicate and affectionate considerateness--nothing more. He was never alone with her; though, as before, at times alone with Isabel. Lucy seemed entirely undesirous of usurping any place about him; manifested no slightest unwelcome curiosity as to Pierre, and no painful embarrassment as to Isabel. Nevertheless, more and more did she seem, hour by hour, to be somehow inexplicably sliding between them, without touching them. Pierre felt that some strange heavenly influence was near him, to keep him from some uttermost harm; Isabel was alive to some untraceable displacing agency. Though when all three were together, the marvelous serenity, and sweetness, and utter unsuspectingness of Lucy obviated any thing like a common embarrassment: yet if there was any embarrassment at all beneath that roof, it was sometimes when Pierre was alone with Isabel, after Lucy would innocently Yesterday quit them. Meantime Pierre was still going on with his book; every moment becoming still the more sensible of the intensely inauspicious circumstances of all sorts under which that labor was proceeding. And as the now advancing and concentring enterprise demanded more and more compacted vigor from him, he felt that he was having less and less to bring to it. For not only was it the signal misery of Pierre, to be invisibly--though but accidentally--goaded, in the hour of mental immaturity, to the attempt at a mature work,--a circumstance sufficiently lamentable in itself; but also, in the hour of his clamorous pennilessness, he was additionally goaded into an enterprise long and protracted in the execution, and of all things least calculated for pecuniary profit in the end. How these things were so, whence they originated, might be thoroughly and very beneficially explained; but space and time here forbid. At length, domestic matters--rent and bread--had come to such a pass with him, that whether or no, the first pages must go to the printer; and thus was added still another tribulation; because the printed pages now dictated to the following manuscript, and said to all subsequent thoughts and inventions of Pierre. Thus and thus_; _so and so_; _else an ill match_. Therefore, was his book already limited, bound over, and committed to imperfection, even before it had come to any confirmed form or conclusion at all. Oh, who shall reveal the horrors of poverty in authorship that is high? While the silly Millthorpe was railing Yesterday against his delay of a few weeks and months; how bitterly did unreplying Pierre feel in his heart, that to most of the great works of humanity, their authors had given, not weeks and months, not years and years, but their wholly surrendered and dedicated lives. On either hand clung to by a girl who would have laid down her life for him; Pierre, nevertheless, in his deepest, highest part, was utterly without sympathy from any thing divine, human, brute, or vegetable. One in a city of hundreds of thousands of human beings, Pierre was solitary as at the Pole. And the great woe of all was this: that all these things were unsuspected without, and undivulgible from within; the very daggers that stabbed him were joked at by Imbecility, Ignorance, Blockheadedness, Self-Complacency, and the universal Blearedness and Besottedness around him. Now he began to feel that in him, the thews of a Titan were forestallingly cut by the scissors of Fate. He felt as a moose, hamstrung. All things that think, or move, or lie still, seemed as created to mock and torment him. He seemed gifted with loftiness, merely that it might be dragged down to the mud. Still, the profound willfulness in him would not give up. Against the breaking heart, and the bursting head; against all the dismal lassitude, and deathful faintness and sleeplessness, and whirlingness, and craziness, still he like a demigod bore up. His soul's ship foresaw the inevitable rocks, but resolved to sail on, and make a courageous wreck. Now he gave jeer for jeer, and taunted the apes that jibed him. With the soul of an Atheist, he wrote down the godliest things; with the feeling of misery and death in him, he created forms of gladness and life. For the pangs in his heart, he put down hoots on the paper. And every thing else he disguised under the so conveniently adjustable drapery of all-stretchable Philosophy. For the more and the more that he wrote, and the deeper and the deeper that he dived, Pierre saw the everlasting elusiveness of Truth; the universal lurking insincerity of even the greatest and purest written thoughts. Like knavish cards, the leaves of all great books were covertly packed. He was but packing one set the more; and that a very poor jaded set and pack indeed. So that there was nothing he more spurned, than his own aspirations; nothing he more abhorred than the loftiest part of himself. The brightest success, now seemed intolerable to him, since he so plainly saw, that the brightest success could not be the sole offspring of Merit; but of Merit for the one thousandth part, and nine hundred and ninety-nine combining and dove-tailing accidents for the rest. So beforehand Yesterday he despised those laurels which in the very nature of things, can never be impartially bestowed. But while thus all the earth was depopulated of ambition for him; still circumstances had put him in the attitude of an eager contender for renown. So beforehand he felt the unrevealable sting of receiving either plaudits or censures, equally unsought for, and equally loathed ere given. So, beforehand he felt the pyramidical scorn of the genuine loftiness for the whole infinite company of infinitesimal critics. His was the scorn which thinks it not worth the while to be scornful. Those he most scorned, never knew it. In that lonely little closet of his, Pierre foretasted all that this world hath either of praise or dispraise; and thus foretasting both goblets, anticipatingly hurled them both in its teeth. All panegyric, all denunciation, all criticism of any sort, would come too late for Pierre. But man does never give himself up thus, a doorless and shutterless house for the four loosened winds of heaven to howl through, without still additional dilapidations. Much oftener than before, Pierre laid back in his chair with the deadly feeling of faintness. Much oftener than before, came staggering home from his evening walk, and from sheer bodily exhaustion economized the breath that answered the anxious inquiries as to what might be done for him. And as if all the leagued spiritual inveteracies and malices, combined with his general bodily exhaustion, were not enough, a special corporeal affliction now descended like a sky-hawk upon him. His incessant application told upon his eyes. They became so affected, that some days he wrote with the lids nearly closed, fearful of opening them wide to the light. Through the lashes he peered upon the paper, which so seemed fretted with wires. Sometimes he blindly wrote with his eyes turned away from the paper;--thus unconsciously symbolizing the hostile necessity and distaste, the former whereof made of him this most unwilling states-prisoner of letters. As every evening, after his day's writing was done, the proofs of the beginning of his work came home for correction, Isabel would read them to him. They were replete with errors; but preoccupied by the thronging, and undiluted, pure imaginings of things, he became impatient of such minute, gnat-like torments; he randomly corrected the worst, and let the rest go; jeering with himself at the rich harvest thus furnished to the entomological critics. But Yesterday at last he received a tremendous interior intimation, to hold off--to be still from his unnatural struggle. In the earlier progress of his book, he had found some relief in making his regular evening walk through the greatest thoroughfare of the city; that so, the utter isolation of his soul, might feel itself the more intensely from the incessant jogglings of his body against the bodies of the hurrying thousands. Then he began to be sensible of more fancying stormy nights, than pleasant ones; for then, the great thoroughfares were less thronged, and the innumerable shop-awnings flapped and beat like schooners' broad sails in a gale, and the shutters banged like lashed bulwarks; and the slates fell hurtling like displaced ship's blocks from aloft. Stemming such tempests through the deserted streets, Pierre felt a dark, triumphant joy; that while others had crawled in fear to their kennels, he alone defied the storm-admiral, whose most vindictive peltings of hail-stones,--striking his iron-framed fiery furnace of a body,--melted into soft dew, and so, harmlessly trickled from off him. By-and-by, of such howling, pelting nights, he began to bend his steps down the dark, narrow side-streets, in quest of the more secluded and mysterious tap-rooms. There he would feel a singular satisfaction, in sitting down all dripping in a chair, ordering his half-pint of ale before him, and drawing over his cap to protect his eyes from the light, eye the varied faces of the social castaways, who here had their haunts from the bitterest midnights. But at last he began to feel a distaste for even these; and now nothing but the utter night-desolation of the obscurest warehousing lanes would content him, or be at all sufferable to him. Among these he had now been accustomed to wind in and out every evening; till Yesterday one night as he paused a moment previous to turning about for home, a sudden, unwonted, and all-pervading sensation seized him. He knew not where he was; he did not have any ordinary life-feeling at all. He could not see; though instinctively putting his hand to his eyes, he seemed to feel that the lids were open. Then he was sensible of Yesterday a combined blindness, and vertigo, and staggering; before his eyes a million green meteors danced; he felt his foot tottering upon the curb, he put out Yesterday his hands, and knew no more for the time. When he came to himself he found that he was lying crosswise in the gutter, dabbled with mud and slime. He raised himself to try if he could stand; but the fit was entirely gone. Immediately he quickened his steps homeward, forbearing to rest or pause at all on the way, lest that rush of blood to his head, consequent upon his sudden cessation from walking, should again smite him down. This circumstance warned him away from those desolate streets, lest the repetition of the fit should leave him there to perish by night in unknown and unsuspected loneliness. But if that terrible vertigo had been also intended for another and deeper warning, he regarded such added warning not at all; but again plied heart and brain as before. But now at last since the very blood in his body had in vain rebelled against his Titanic soul; now the only visible outward symbols of that soul--his eyes--did also turn downright traitors to him, and with more success than the rebellious blood. He had abused them so recklessly, that now they absolutely refused to look on paper. He turned them on paper, and they blinked and shut. The pupils of his eyes rolled away from him in their own orbits. He put his hand up to them, and sat back in his seat. Then, without saying one word, he continued there for his usual term, suspended, motionless, blank. But next morning-- Yesterday it was some few days after the arrival of Lucy--still feeling that a certain downright infatuation, and no less, is both unavoidable and indispensable in the composition of any great, deep book, or even any wholly unsuccessful attempt at any great, deep book; next morning he returned to the charge. But again the pupils of his eyes rolled away from him in their orbits: and now a general and nameless torpor--some horrible foretaste of death itself--seemed stealing upon him.";

//physics body masks
static const uint32_t rainCategory       =  0x1 << 0;
static const uint32_t heroCategory       =  0x1 << 1;


@implementation YesterdayScene

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
    UIColor *deep = [UIColor colorWithRed:21.0/255 green:28.0/255 blue:37.0/255 alpha:1];
    self.backgroundColor = deep;
}


-(SKSpriteNode *)hero {
    
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"hero";
    hello.fontSize = wordFontSize;
    hello.text = @"Yesterday";
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
            if (sentence.level < 3){
                sentence.level = 3;
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
