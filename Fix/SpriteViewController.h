//
//  SpriteViewController.h
//  Fix
//

//  Copyright (c) 2013 Nicholas Barr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <Social/Social.h>


@interface SpriteViewController : UIViewController


{
    
    IBOutlet UIButton *twitterButton;
    

}

- (IBAction)openTweetSheet:(id)sender;
- (void)showTweetButton;

@end
