//
//  Movie.h
//  try
//
//  Created by kerollos nabil on 9/5/18.
//  Copyright © 2018 kerollos nabil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic) NSInteger ID;
@property (nonatomic) NSInteger runTime;
@property (strong, nonatomic) NSAttributedString *name;
@property (strong, nonatomic) NSAttributedString *releaseDate;
@property (nonatomic) float rate;
@property (strong, nonatomic) NSAttributedString *movieDesctiption;
@property (strong, nonatomic) NSMutableArray *trailersID;
@property (strong, nonatomic) NSMutableArray *trailersName;
@property (strong, nonatomic) NSMutableArray *reviewAuther;
@property (strong, nonatomic) NSMutableArray *review;

@end
