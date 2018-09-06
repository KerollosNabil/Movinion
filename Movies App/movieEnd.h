//
//  movieEnd.h
//  try
//
//  Created by kerollos nabil on 9/6/18.
//  Copyright © 2018 kerollos nabil. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol movieEnd <NSObject>
@required
-(void)movieEndLoad:(int) pop;
-(void)movieTrailEndLoad:(NSMutableArray*) trailsN :(NSMutableArray*)trailsID;
-(void)movieReviewEndLoad:(NSMutableArray*) reviewAuther :(NSMutableArray*)reviewCon;

@end
