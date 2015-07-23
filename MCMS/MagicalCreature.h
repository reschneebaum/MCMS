//
//  MagicalCreature.h
//  MCMS
//
//  Created by Rachel Schneebaum on 7/21/15.
//  Copyright (c) 2015 Rachel Schneebaum. All rights reserved.
//

#import "UIKit/UIKit.h"
#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject

@property NSString *creatureName;
@property NSString *creatureDetail;
@property NSString *creatureOrigin;
@property UIImage *creatureImage;
@property NSMutableArray *accessories;


-(instancetype)initWithName:(NSString *)name withDetail:(NSString *)detail withOrigin:(NSString *)origin withImage:(UIImage *)image;

@end
