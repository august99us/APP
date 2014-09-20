//
//  KADraggableIcon.m
//  APP
//
//  Created by August Sun on 9/13/14.
//  Copyright (c) 2014 KRAIL. All rights reserved.
//

#import "KADraggableIcon.h"

#define TAPPED_SIZE_INCREASE 1.3
#define EXPANSION_TIME 0.1

@interface KADraggableIcon ()

@property (nonatomic) CGFloat draggingPreviousX;
@property (nonatomic) CGFloat draggingPreviousY;

@end

@implementation KADraggableIcon

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithDictionary:(NSDictionary*)dict
{
    // Create frame
    CGRect frame = CGRectMake([(NSNumber*)dict[@"position"][@"x"] floatValue], [(NSNumber*)dict[@"position"][@"y"] floatValue], 50, 50);
    
    // Call init with frame
    self = [self initWithFrame:frame];
    
    // Customization values
    if (self) {
        
        // Set name
        self.eventName = dict[@"eventName"];
        
        // Set image
        UIImage* tempImage = [UIImage imageNamed:dict[@"image"]];
        [self setImage:tempImage];
        
        // Set position
        self.position = CGPointMake([(NSNumber*)dict[@"position"][@"x"] floatValue], [(NSNumber*)dict[@"position"][@"y"] floatValue]);
        
        // Create and register drag gesture recognizer
        self.userInteractionEnabled = TRUE;
        UIPanGestureRecognizer* dragRecognizer =[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(respondToDragGesture:)];
        dragRecognizer.minimumNumberOfTouches = 1;
        dragRecognizer.maximumNumberOfTouches = 1;
        dragRecognizer.delegate = self;
        [self addGestureRecognizer:dragRecognizer];
        
        /*
        // Create and register press gesture recognizer
        UITapGestureRecognizer* pressRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondToTapGesture:)];
        pressRecognizer.numberOfTouchesRequired = 1;
        pressRecognizer.delegate = self;
        [self addGestureRecognizer:pressRecognizer];
         */
        
        // Initialize private variables
        self.draggingPreviousX = 0;
        self.draggingPreviousY = 0;
        
    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGAffineTransform transform = CGAffineTransformScale(self.transform, TAPPED_SIZE_INCREASE, TAPPED_SIZE_INCREASE);
    [UIView animateWithDuration:EXPANSION_TIME animations:^{
        self.transform = transform;
        self.alpha = 0.5;
    }];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGAffineTransform transform = CGAffineTransformScale(self.transform, 1/TAPPED_SIZE_INCREASE, 1/TAPPED_SIZE_INCREASE);
    [UIView animateWithDuration:EXPANSION_TIME animations:^{
        self.transform = transform;
        self.alpha = 1;
    }];
}

/*
- (void)respondToTapGesture:(UILongPressGestureRecognizer*)recognizer
{
    NSLog(@"I'm being expanded!");
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        CGAffineTransform transform = CGAffineTransformScale(self.transform, 1.3, 1.3);
        [UIView animateWithDuration:0.2 animations:^{
            self.transform = transform;
            self.alpha = 0.5;
        }];
    }
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"end");
    }
}
*/

- (void)respondToDragGesture:(UIPanGestureRecognizer*)recognizer
{
    NSLog(@"I'm being dragged!");
    
    CGPoint translation = [recognizer translationInView:self];
    CGAffineTransform transform = CGAffineTransformTranslate(self.transform, translation.x - self.draggingPreviousX, translation.y - self.draggingPreviousY);
    self.draggingPreviousX = translation.x;
    self.draggingPreviousY = translation.y;
    self.transform = transform;
    
    NSLog(@"x: %f, y: %f", self.frame.origin.x,self.frame.origin.y);
    
    if ([recognizer state] == UIGestureRecognizerStateEnded)
    {
        // Finalize drag (positions, reset values)
        CGRect rect = self.frame;
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, TAPPED_SIZE_INCREASE, TAPPED_SIZE_INCREASE);
        [self setFrame:rect];
        //CGAffineTransform transform = CGAffineTransformScale(self.transform, 1/TAPPED_SIZE_INCREASE, 1/TAPPED_SIZE_INCREASE);
        [UIView animateWithDuration:EXPANSION_TIME animations:^{
            self.transform = CGAffineTransformIdentity; //transform;
            self.alpha = 1;
        }];
        
        self.draggingPreviousX = 0;
        self.draggingPreviousY = 0;
        
        // TODO: Check where it has been released and use that to determine what to do with position
        self.position = self.frame.origin;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
