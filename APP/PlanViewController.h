//
//  HomeViewController.h
//  APP
//
//  Created by August Sun on 7/31/14.
//  Copyright (c) 2014 KRAIL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KADraggableIcon.h"

@interface PlanViewController : UIViewController <KADraggableIconDelegate>

@property (strong, nonatomic) NSMutableArray* ScreenDraggableIcons;
@property (strong, nonatomic) NSMutableArray* DrawerDraggableIcons;
@property (strong, nonatomic) NSMutableArray* PlannedDraggableIcons;

@property (strong, nonatomic) IBOutlet UIView* ScreenDraggableView;

@end