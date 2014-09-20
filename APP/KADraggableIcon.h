//
//  KADraggableIcon.h
//  APP
//
//  Created by August Sun on 9/13/14.
//  Copyright (c) 2014 KRAIL. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KAInDrawer = NSIntegerMax

@protocol KADraggableIconDelegate;

@interface KADraggableIcon : UIImageView <UIGestureRecognizerDelegate>

- (id)initWithDictionary:(NSDictionary*)dict;

@property (nonatomic, assign) id <KADraggableIconDelegate> delegate;

@property (strong, nonatomic) NSString* eventName;
@property (nonatomic) CGPoint position;             // Stores location of icon, stores (KAInDrawer, <Drawer Order Location>) if in drawer

@end

@protocol KADraggableIconDelegate

- (void) dragGestureBegan:(KADraggableIcon*)sender;
- (void) dragGestureEnded:(KADraggableIcon*)sender;
@property UIView* view;

@end