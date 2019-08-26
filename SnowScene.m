//
//  SnowScene.m
//  uFail
//
//  Created by Matthew Jagiela on 11/28/16.
//  Copyright © 2016 Matthew Jagiela. All rights reserved.
//

#import "SnowScene.h"

@implementation SnowScene
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor clearColor];
        NSString *emitterPath = [[NSBundle mainBundle] pathForResource:@"snowEffect" ofType:@"sks"];
        SKEmitterNode *smoke = [NSKeyedUnarchiver unarchiveObjectWithFile:emitterPath];
        smoke.position = CGPointMake(CGRectGetMidX(self.frame), self.size.height);
        smoke.name = @"particleBokeh";
        smoke.targetNode = self.scene;
        [self addChild:smoke];
    }
    return self;
}

@end
