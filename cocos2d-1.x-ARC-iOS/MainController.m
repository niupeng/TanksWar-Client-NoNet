//
//  NavigationLayer.m
//  coco
//
//  Created by 陈 奕龙 on 13-3-19.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "MainController.h"
#import "CCUIViewWrapper.h"
#import "SWScrollView.h"
#import "MainView.h"

@implementation MainController
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainController *layer = [MainController node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
    
	if( (self=[super init])) {
        
        
        
//        CGSize size = [[UIScreen mainScreen] bounds].size;
//        CCProgressTimer *ct=[CCProgressTimer progressWithFile:@"Icon.png"];
//        ct.position=ccp( size.width /2 , size.height/2);
//        
//        ct.percentage = 100; //当前进度
//        ct.type=kCCProgressTimerTypeHorizontalBarLR;//进度条的显示样式
//        [self addChild:ct z:3 tag:9110];
        
        
        
        //添加右侧导航栏目
        MainView *mainView = [[MainView alloc]init];
        CCUIViewWrapper *wrapper =[mainView Navigation:self]; //self是CCNode
      
        [self addChild:wrapper z:4 tag:99];
     
        militaryController = [[MilitaryController alloc]init];
        [self addChild:militaryController z:3 tag:97];
        
        
       ;
    }
	return self;
    
}

-(void)sceneTransition:(int)sender  //转换到军事区
{
    [self removeChildByTag:98 cleanup:YES];
    resourceController = [[ResourceController alloc]init];
//    CCTransitionFade *try=[CCTransitionFade transitionWithDuration:2 scene:[MilitaryController scene] withColor:ccBLACK];
//    [[CCDirector sharedDirector] replaceScene:try];
    
    [self addChild:resourceController z:3 tag:98];
}

-(void)sceneTransition2:(int)sender
{
    [self removeChildByTag:97 cleanup:YES];
    militaryController = [[MilitaryController alloc]init];
    [self addChild:militaryController z:3 tag:97];
    
}

@end
