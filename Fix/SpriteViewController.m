//
//  SpriteViewController.m
//  Fix
//
//  Created by Nicholas Barr on 10/3/13.
//  Copyright (c) 2013 Nicholas Barr. All rights reserved.
//

#import "SpriteViewController.h"
#import "WelcomeMenu.h"
#import "SpriteMyScene.h"
#import "Sentence.h"
#import <Social/Social.h>

@interface SpriteViewController ()

@end

@implementation SpriteViewController

@synthesize sentencetext;

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    
   // skView.showsFPS = YES;
   // skView.showsNodeCount = YES;
    
    
    // Create and configure the scene.
    WelcomeMenu * scene = [WelcomeMenu sceneWithSize:skView.bounds.size];
    SpriteMyScene * myScene = [SpriteMyScene sceneWithSize:skView.bounds.size];
    myScene.spriteViewController = self;
  //  scene.spriteViewController = self;
    scene.scaleMode = SKSceneScaleModeAspectFill;
  //  [twitterButton setTitle:@"Foo" forState:UIControlStateNormal];
 //   [twitterButton setEnabled:NO];
   // scene.spriteViewController = self;
    //[twitterButton removeFromSuperview];
    

    
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}



- (void)showTweetButton
{
    
    NSLog(@"openingTweetSheet");

    //  Create an instance of the Tweet Sheet
    SLComposeViewController *tweetSheet = [SLComposeViewController
                                           composeViewControllerForServiceType:
                                           SLServiceTypeTwitter];
    
    // Sets the completion handler.  Note that we don't know which thread the
    // block will be called on, so we need to ensure that any required UI
    // updates occur on the main queue
    tweetSheet.completionHandler = ^(SLComposeViewControllerResult result) {
        switch(result) {
                //  This means the user cancelled without sending the Tweet
            case SLComposeViewControllerResultCancelled:
                break;
                //  This means the user hit 'Send'
            case SLComposeViewControllerResultDone:
                break;
        }
    };
    
    //  Set the initial body of the Tweet
    Sentence *sentence = [Sentence sharedSentence];
    NSString *wordToAppend = [sentence.fullText stringByAppendingString:@"via @Poemsio"];
    

    [tweetSheet setInitialText:wordToAppend];
    
    //  Adds an image to the Tweet.  For demo purposes, assume we have an
    //  image named 'larry.png' that we wish to attach
  //  if (![tweetSheet addImage:[UIImage imageNamed:@"larry.png"]]) {
  //      NSLog(@"Unable to add the image!");
  //  }
    
    //  Add an URL to the Tweet.  You can add multiple URLs.
    if (![tweetSheet addURL:[NSURL URLWithString:@"http://poems.io/"]]){
        NSLog(@"Unable to add the URL!");
    }
    
    //  Presents the Tweet Sheet to the user
    [self presentViewController:tweetSheet animated:NO completion:^{
        NSLog(@"Tweet sheet has been presented.");
    }];
    
    
    //NSLog(@"showingTwitterButton");
    //TwitterViewController *viewController = [TwitterViewController alloc];
//
  //  [self presentViewController:viewController animated:YES completion:NULL];
 //   UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
 //   UIViewController *vc = [storyboard      instantiateViewControllerWithIdentifier:@"ViewController"];
 //   [vc setModalPresentationStyle:UIModalPresentationFullScreen];
 //   [(UIViewController*)self.nextResponder presentViewController:vc animated:NO completion:NULL];
    
    //SKView * skView = (SKView *)self.view;
    //[twitterButton removeFromSuperview];
   // [twitterButton setTitle:@"Share" forState:UIControlStateNormal];
 //   SKView * skView = (SKView *)self.view;
 //   [twitterButton setEnabled:YES];
  //  [[self.view superview] addSubview:twitterButton];
//    twitterButton.customView = [[UIView alloc] init];
    

}





@end
