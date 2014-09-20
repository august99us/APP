//
//  HomeViewController.m
//  APP
//
//  Created by August Sun on 7/31/14.
//  Copyright (c) 2014 KRAIL. All rights reserved.
//

#import "PlanViewController.h"

@interface PlanViewController ()

@end

@implementation PlanViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // Initiate three container arrays
    self.ScreenDraggableIcons = [NSMutableArray arrayWithCapacity:7];
    self.DrawerDraggableIcons = [NSMutableArray arrayWithCapacity:10];
    self.PlannedDraggableIcons = [NSMutableArray arrayWithCapacity:5];
    
    // Load the icons plist
    NSString* plistTemp = [[NSBundle mainBundle] pathForResource:@"DraggableIcons" ofType:@"plist"];
    NSDictionary* draggableIconsProperties = [NSDictionary dictionaryWithContentsOfFile:plistTemp];
    
    // Separate the dictionary
    NSArray* screenDraggableIconsProperties = draggableIconsProperties[@"Screen"];
    NSArray* drawerDraggableIconsProperties = draggableIconsProperties[@"Drawer"];
    
    // Create the objects
    for (int i = 0; i < [screenDraggableIconsProperties count]; i++)
    {
        self.ScreenDraggableIcons[i] = [KADraggableIcon alloc];
        ((KADraggableIcon*)self.ScreenDraggableIcons[i]).delegate = self;
        self.ScreenDraggableIcons[i] = [(KADraggableIcon*)self.ScreenDraggableIcons[i] initWithDictionary:screenDraggableIconsProperties[i]];
        [self.ScreenDraggableView addSubview:self.ScreenDraggableIcons[i]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
