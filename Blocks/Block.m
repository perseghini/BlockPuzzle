//
//  Block.m
//  Blocks
//
//  Created by Luyao Chen on 11/8/15.
//  Copyright © 2015 lchen. All rights reserved.
//

#import "Block.h"

@implementation Block

+(Block*) BlockWithColor :(BlockColor) color size:(NSInteger) size{

    Block *block;
    switch (color) {
        case BlockColorRed:
            block = [super spriteNodeWithImageNamed:@"red"];
            break;
        case BlockColorBlue:
            block = [super spriteNodeWithImageNamed:@"blue"];
            break;
        case BlockColorOrange:
            block = [super spriteNodeWithImageNamed:@"orange"];
            break;
        case BlockColorPurple:
            block = [super spriteNodeWithImageNamed:@"purple"];
            break;
        case BlockColorTeal:
            block = [super spriteNodeWithImageNamed:@"teal"];
            break;
        case BlockColorYellow:
            block = [super spriteNodeWithImageNamed:@"yellow"];
            break;
        case BlockColorTransparent:
            block = [super spriteNodeWithColor:[UIColor clearColor] size:CGSizeMake(size, size)];
            break;
        default:
            break;
    }
    
    block.blockColor = color;
    block.userInteractionEnabled = NO;
    block.size = CGSizeMake(size, size);
    block.anchorPoint = CGPointMake(0, 0);
    return block;
}

+(Block*) BlockWithColor :(BlockColor) color position: (CGPoint) position size:(NSInteger) size{
    
    Block *block = [Block BlockWithColor:color size:size];
    block.position = position;
    return block;
}



@end
