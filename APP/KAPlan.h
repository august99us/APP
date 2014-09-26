//
//  KAPlan.h
//  APP
//
//  Created by Albert Lee on 9/16/14.
//  Copyright (c) 2014 KRAIL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KAPlan : NSObject

//For storage of original planner

@property (strong, nonatomic) NSString* planName;           //Name of the plan
@property (strong, nonatomic) NSDate* timeCompleted;        //Time when plan was created
@property (strong, nonatomic) NSString* userName;            //ID / username of the planner
@property (strong, nonatomic) NSString* planLocation;       //Location details of the plan

//For local user

@property (strong, nonatomic) NSMutableArray* events;        //Array that contains events(Identified with icon's unique ID)
@property (strong, nonatomic) NSDate* beginTime;            //User set beginning time of the event
@property (strong, nonatomic) NSDate* endTime;              //User set ending time of the event
@property (strong, nonatomic) NSString* planType;           //Type of the plan
@property (nonatomic) NSInteger* totalPeople;               //Number of people involved in the plan
@property (strong, nonatomic) NSMutableArray* transportation;//Array of transportations added by user
@property (strong, nonatomic) NSMutableArray* cost;         //Array of estimated cost in each destination
@property (strong, nonatomic) NSMutableArray* time;         //Array of estimated time in each destination

@end