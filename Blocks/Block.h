//
//  Block.h
//  Blocks
//
//  Created by Luyao Chen on 11/8/15.
//  Copyright © 2015 lchen. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Block : SKSpriteNode

typedef NS_ENUM(NSInteger, BlockColor) {
    BlockColorOrange,
    BlockColorBlue,
    BlockColorPurple,
    BlockColorRed,
    BlockColorTeal,
    BlockColorYellow,
    BlockColorTransparent
};

+(Block*) BlockWithColor :(BlockColor) color size:(NSInteger) size;
+(Block*) BlockWithColor :(BlockColor) color position: (CGPoint) position size:(NSInteger) size;

@property (nonatomic, assign) BlockColor blockColor;
@property (nonatomic, assign) NSInteger blockSize;

@end
