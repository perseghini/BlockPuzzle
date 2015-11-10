//
//  GameScene.m
//  Blocks
//
//  Created by Luyao Chen on 11/8/15.
//  Copyright (c) 2015 lchen. All rights reserved.
//

#import "GameScene.h"
#import "Shape.h"
#import "Block.h"

const float BLOCK_SIZE = 100/1.2;
const float ABOVE_FINGER_HEIGHT = 160;

@interface GameScene ()

@property (strong, nonatomic, nullable) Shape *selectedShape;
@property (assign, nonatomic) BOOL didRotateBegin;
@property (assign, nonatomic) CGRect changeOrintationArea;
@property (assign, nonatomic) CGPoint selectedShapeOriginPosition;

@end

@implementation GameScene


-(void)didMoveToView:(SKView *)view {
    
    self.changeOrintationArea = [self.scene childNodeWithName:@"ChangeOrintationArea"].frame;
    
    Shape* shape =[Shape ShapeWithSize:1 type:ShapeType2 color:BlockColorBlue blockSize:BLOCK_SIZE];
    shape.position = CGPointMake(300, 300);
    [self addChild:shape];
    
    shape =[Shape ShapeWithSize:1 type:ShapeType1 color:BlockColorBlue blockSize:BLOCK_SIZE];
    shape.position = CGPointMake(600, 300);
    [self addChild:shape];
    
    shape =[Shape ShapeWithSize:1 type:ShapeType3 color:BlockColorBlue blockSize:BLOCK_SIZE];
    shape.position = CGPointMake(900, 300);
    [self addChild:shape];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *touch in touches) {
        CGPoint positionInScene = [touch locationInNode:self];
        SKNode *touchedNode = [self nodeAtPoint: positionInScene];
        if ([touchedNode isKindOfClass:[Block class]] && !self.selectedShape){
            NSLog(@"Shape selected");
            self.selectedShape = (Shape *)touchedNode.parent;
            self.selectedShapeOriginPosition = self.selectedShape.position;
            SKAction *scale = [SKAction scaleBy:1.2 duration:0.2];
            SKAction *moveUp = [SKAction moveBy:CGVectorMake(0, ABOVE_FINGER_HEIGHT) duration:0.2];
            [self.selectedShape runAction: scale];
            [self.selectedShape runAction: moveUp];
            return;
        }
    }

}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (self.selectedShape) {
        UITouch *touch = [touches anyObject];
        CGPoint positionInScene = [touch locationInNode:self];
        CGPoint targetPosition = CGPointMake(positionInScene.x, positionInScene.y + ABOVE_FINGER_HEIGHT);
        self.selectedShape.position = targetPosition;
        [self rotateShape:targetPosition];
    }
}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"ended");
    SKAction *scale = [SKAction scaleBy:1/1.2 duration:0.2];
    SKAction *moveBackOrigin = [SKAction moveTo:self.selectedShapeOriginPosition duration:0.2];
    [self.selectedShape runAction: scale];
    [self.selectedShape runAction: moveBackOrigin];
    self.selectedShape = nil;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(void)rotateShape:(CGPoint) targetPosition{
    if (CGRectContainsPoint(self.changeOrintationArea, targetPosition) && !self.didRotateBegin){
        SKAction *rotateAnim = [SKAction rotateByAngle: M_PI_2 duration: 0.3];
        self.didRotateBegin = YES;
        [self.selectedShape runAction: rotateAnim completion:^{
            [NSTimer scheduledTimerWithTimeInterval: 0.5
                                             target: self
                                           selector: @selector(handleTimer:)
                                           userInfo: nil
                                            repeats: NO];
        }];
    }
}

-(void)handleTimer:(id *) sender{
    self.didRotateBegin = NO;
}

@end
