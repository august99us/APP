//
//  KADraggableIcon.h
//  APP
//
//  Created by August Sun on 9/13/14.
//  Copyright (c) 2014 KRAIL. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KAInDrawer = NSIntegerMax
#define KAInGrid = NSIntegerMax-1

@protocol KADraggableIconDelegate;

@interface KADraggableIcon : UIImageView <UIGestureRecognizerDelegate>

#pragma mark - Constructors
- (id)initWithDictionary:(NSDictionary*)dict;

#pragma mark - Instance Variables
@property (nonatomic, assign) id <KADraggableIconDelegate> delegate;    // Delegate

@property (strong, nonatomic) NSString* eventName;
@property (nonatomic) CGPoint position;             // Stores location of icon, stores (KAInDrawer, <Drawer Order Location>) if in drawer,
                                                    // stores (KAInGrid, <Grid Position>) if in gridded screen

#pragma mark - Instance Methods
- (NSInteger)resolveGridInView:(UIView*)view;                           // Finds the closest grid location

#pragma mark - Class Methods
+ (void) setGridMode:(BOOL)mode;
- (BOOL) getGridMode;

@end

@protocol KADraggableIconDelegate

- (void) dragGestureBegan:(KADraggableIcon*)sender;
- (void) dragGestureEnded:(KADraggableIcon*)sender;
@property UIView* view;

@end