//
//  MagicalCreature.m
//  MCMS
//
//  Created by Rachel Schneebaum on 7/21/15.
//  Copyright (c) 2015 Rachel Schneebaum. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

-(instancetype)initWithName:(NSString *)name withDetail:(NSString *)detail withOrigin:(NSString *)origin withImage:(UIImage *)image; {

    self = [super init];
    if (self) {
        self.creatureName = name;
        self.creatureDetail = detail;
        self.creatureOrigin = origin;
        self.creatureImage = image;
    }
    return self;
}

@end