//
//  smokeScene.m
//  uFail
//
//  Created by Matthew Jagiela on 10/7/15.
//  Copyright © 2015 Matthew Jagiela. All rights reserved.
//

#import "smokeScene.h"

@implementation smokeScene
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
