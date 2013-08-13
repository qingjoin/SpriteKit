//
//  HelloScene.m
//  SpriteWalkthrough
//
//  Created by qingyun on 8/13/13.
//  Copyright (c) 2013 qingyun. All rights reserved.
//

#import "HelloScene.h"
#import "SpaceshipScene.h"

@interface HelloScene()
@property BOOL contentCreated;
@end

@implementation HelloScene
 

-(void)didMoveToView:(SKView *)view
{
    if(!self.contentCreated)
    {
        [self  createSceneContents];
        self.contentCreated = YES;
    }
}

-(void)createSceneContents
{
    NSLog(@"createSceneContents");
    self.backgroundColor = [SKColor blackColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self addChild:[self newHelloNode]];
}

-(SKLabelNode*)newHelloNode
{
    SKLabelNode *helloNode = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    helloNode.name = @"helloNode";//@ 这个和下面的一样
    helloNode.text = @"hello qingjoin ";
    helloNode.fontSize = 24;
    helloNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    return helloNode;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    SKNode *helloNode = [self childNodeWithName:@"helloNode"]; //@与上面的相同
    if(helloNode !=nil)
    {
       
        helloNode.name = nil;
        SKAction *moveUp = [SKAction moveByX:0 y:100.0 duration:0.5]; //向上移动
        SKAction *zoom = [SKAction scaleTo:2.0 duration:0.25];    //扩大两倍
        SKAction *pause = [SKAction waitForDuration:0.5];    //暂停
        SKAction *fadeAway = [SKAction fadeOutWithDuration:0.25];  //消失
        SKAction *remove = [SKAction removeFromParent];
        SKAction *moveSequence = [SKAction sequence:@[moveUp, zoom, pause, fadeAway, remove]];
        //[helloNode runAction:moveSequence];
        [helloNode runAction: moveSequence completion:^{
            SKScene *spaceshipScene  = [[SpaceshipScene alloc] initWithSize:self.size];
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration:0.5];
            [self.view presentScene:spaceshipScene transition:doors];
        }];
    }
}

@end
