//
//  Shape.m
//  Blocks
//
//  Created by Luyao Chen on 11/8/15.
//  Copyright © 2015 lchen. All rights reserved.
//

#import "Shape.h"


@implementation Shape


+(instancetype) ShapeWithSize:(NSInteger) size type:(ShapeType) type color:(BlockColor) color blockSize: (NSInteger) blockSize{
    
    Shape *shape = [[self alloc] init];
    shape.orientation = ShapeOrientationDefault;
    shape.type = type;
    shape.blockColor = color;
    shape.blockSize = blockSize;
    shape.userInteractionEnabled = NO;
    shape.name = @"shape";
    [shape addSubBlocks];
    return shape;
}

-(void)addSubBlocks{

    switch (self.type) {
        case ShapeType1:{
            [self shape1];
            break;
        }
        case ShapeType2:
            [self shape2];
            break;
        case ShapeType3:
            [self shape3];
            break;
        case ShapeType4:
            [self shape4];
            break;
        case ShapeType5:
            [self shape5];
            break;
        case ShapeType6:
            [self shape7];
            break;
        case ShapeType7:
            [self shape7];
            break;
        default:
            break;
    }
}

- (void)shape1{
    //****
    Block *block = [Block BlockWithColor:self.blockColor position:CGPointMake(0, -self.blockSize/2) size: self.blockSize];
    [self addChild:block];
    block =[Block BlockWithColor:self.blockColor position:CGPointMake(-self.blockSize, -self.blockSize/2) size:self.blockSize];
    [self addChild:block];
    block =[Block BlockWithColor:self.blockColor position:CGPointMake(self.blockSize, -self.blockSize/2) size:self.blockSize];
    [self addChild:block];
    block =[Block BlockWithColor:self.blockColor position:CGPointMake(-2 * self.blockSize, -self.blockSize/2) size:self.blockSize];
    [self addChild:block];

}

- (void)shape2{
    //*
    //***
    Block *block = [Block BlockWithColor:self.blockColor position:CGPointMake(-self.blockSize/2*3, 0) size: self.blockSize];
    [self addChild:block];
    block = [Block BlockWithColor:BlockColorTransparent position:CGPointMake(self.blockSize/2, 0) size: self.blockSize];
    [self addChild:block];
    block = [Block BlockWithColor:BlockColorTransparent position:CGPointMake(-self.blockSize/2, 0) size: self.blockSize];
    [self addChild:block];
    block =[Block BlockWithColor:self.blockColor position:CGPointMake(-self.blockSize/2, -self.blockSize) size:self.blockSize];
    [self addChild:block];
    block =[Block BlockWithColor:self.blockColor position:CGPointMake(-self.blockSize/2*3, -self.blockSize) size:self.blockSize];
    [self addChild:block];
    block =[Block BlockWithColor:self.blockColor position:CGPointMake(self.blockSize/2, -self.blockSize) size:self.blockSize];
    [self addChild:block];
    
}

-(void)shape3{
    //*
    //**
    Block *block = [Block BlockWithColor:self.blockColor position:CGPointMake(-self.blockSize, 0) size: self.blockSize];
    [self addChild:block];
    block =[Block BlockWithColor:self.blockColor position:CGPointMake(-self.blockSize, -self.blockSize) size:self.blockSize];
    [self addChild:block];
    block =[Block BlockWithColor:self.blockColor position:CGPointMake(0, -self.blockSize) size:self.blockSize];
    [self addChild:block];
    block =[Block BlockWithColor:BlockColorTransparent position:CGPointMake(0, 0) size:self.blockSize];
    [self addChild:block];
}

-(void)shape4{
}

-(void)shape5{
}

//你的任务，模仿Shape1，做 shape 6 和Shape 7
//完成后，在GameScene.m (void)didMoveToView:(SKView *)view method 里面把那些shape改成 shape6 和shape7 检测成果
-(void)shape6{
    //**
}

-(void)shape7{
    //***
}

@end
