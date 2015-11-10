//
//  Shape.h
//  Blocks
//
//  Created by Luyao Chen on 11/8/15.
//  Copyright © 2015 lchen. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Block.h"

@interface Shape : SKSpriteNode

typedef NS_ENUM(NSInteger, ShapeOrientation) {
    ShapeOrientationDefault,
    ShapeOrientationRotate90,
    ShapeOrientationRotate180,
    ShapeOrientationRotate270
};

typedef NS_ENUM(NSInteger, ShapeType) {
    //TODO: Change name
    //****
    ShapeType1,
    //*
    //***
    ShapeType2,
    //* *
    //***
    ShapeType3,
    //**
    // *
    ShapeType4,
    // *
    //***
    // *
    ShapeType5,
    //**
    ShapeType6,
    //***
    ShapeType7
};

+(instancetype) ShapeWithSize:(NSInteger) size type:(ShapeType) type color:(BlockColor) color blockSize: (NSInteger) blockSize;

@property (assign, nonatomic) ShapeOrientation orientation;
@property (assign, nonatomic) ShapeType type;
@property (nonatomic, assign) BlockColor blockColor;
@property (nonatomic, assign) NSInteger blockSize;

@end
