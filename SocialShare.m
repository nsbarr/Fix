//
//  SocialShare.m
//  Fix
//
//  Created by Nicholas Barr on 10/13/13.
//  Copyright (c) 2013 Nicholas Barr. All rights reserved.
//

#import "SocialShare.h"
#import <Social/Social.h>


@interface SocialShare ()

@end

@implementation SocialShare

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)shareGuy{
    SLComposeViewController *controllerSLC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [controllerSLC setInitialText:@"First post from my iPhone app"];
    [controllerSLC addURL:[NSURL URLWithString:@"http://www.appcoda.com"]];
    [controllerSLC addImage:[UIImage imageNamed:@"test.jpg"]];
    [self presentViewController:controllerSLC animated:YES completion:Nil];
}


@end
