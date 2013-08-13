//
//  ViewController.m
//  SpriteWalkthrough
//
//  Created by qingyun on 8/13/13.
//  Copyright (c) 2013 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "HelloScene.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SKView *spriteView = (SKView*)self.view;
    
    spriteView.showsFPS = YES;
    spriteView.showsDrawCount = YES;
    spriteView.showsNodeCount = YES;
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)viewWillAppear:(BOOL)animated
{
     
    HelloScene* hello = [[HelloScene alloc] initWithSize:CGSizeMake(self.view.frame.size.width,self.view.frame.size.height)];
    SKView *spriteView = (SKView*)self.view;
    [spriteView presentScene:hello];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
