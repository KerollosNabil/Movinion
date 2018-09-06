//
//  networking.m
//  Movies App
//
//  Created by kerollos nabil on 9/6/18.
//  Copyright © 2018 kerollos nabil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"
#import "finishingLoadd.h"
#import "movieEnd.h"

@interface networking : NSObject
@property (strong, nonatomic,readonly) NSMutableArray *moviesPostersID;
@property id<finishingLoadd> isFinish;
@property id<movieEnd> movieLoadIsFinish;

-(instancetype)initWithBaseUrl:(NSString*) baseUrl andParamters:(NSDictionary*) params;
-(NSMutableArray*)moviesPostersID;
-(Movie*)MonieAtIndex : (NSInteger) index;
-(void)beginLoadFilmAtIndex:(NSInteger)index;
@end

