//
//  networking.m
//  Movies App
//
//  Created by kerollos nabil on 9/6/18.
//  Copyright © 2018 kerollos nabil. All rights reserved.
//

#import "networking.h"
#import <AFNetworking.h>
#import <AFURLRequestSerialization.h>
#import <AFHTTPSessionManager.h>

@interface networking ()
@property (strong, nonatomic) NSMutableArray *movies;
@property (strong, nonatomic) NSMutableArray *moviesPostersID;
@property (strong, nonatomic) NSString *baseUrl;
@property (strong, nonatomic) NSMutableDictionary *params;

@end

@implementation networking
-(instancetype)initWithBaseUrl:(NSString*) baseUrl andParamters:(NSDictionary*) params{
    self = [super init];
    
    if (self) {
        _moviesPostersID = [[NSMutableArray alloc] init];
        _movies = [[NSMutableArray alloc] init];
        _params = [params mutableCopy];
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
        
        [manager GET:@"" parameters:params progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
         {
             // Success
             NSLog(@"Success koko: %@", [responseObject objectForKey:@"results"][0]);
             
             for (NSDictionary *film in [responseObject objectForKey:@"results"]) {
                 printf("%lu\n",[[responseObject objectForKey:@"results"] count]);
                 [self.moviesPostersID  addObject:[film objectForKey:@"poster_path"]];
                 Movie *movie = [Movie new];
                 movie.ID = [[film objectForKey:@"id"] integerValue];
                 movie.name = [film objectForKey:@"original_title"];
                 movie.releaseDate = [film objectForKey:@"release_date"];
                 movie.rate =[[film objectForKey:@"vote_average"] floatValue];
                 movie.movieDesctiption = [film objectForKey:@"overview"];
                 [self.movies addObject:movie];
                 
             }
             printf("k %lu\n",(unsigned long)[self.moviesPostersID count]);
             [self.isFinish didFinishLoad];
             
         } failure:^(NSURLSessionDataTask *task, NSError *error)
         {
             // Failure
             NSLog(@"Failure: %@", error);
         }];
    }
    
    return self;
}
-(NSMutableArray*)moviesPostersID{
    return _moviesPostersID;
}

-(void)LoadMovieAtIndex : (NSInteger) index{
    //https://api.themoviedb.org/3/movie/{movie_id}?api_key=<<api_key>>&language=en-US
    Movie *currentMovie = [_movies objectAtIndex:index];
    
    printf("koko %ld\n",(long) currentMovie.ID);
    NSMutableDictionary *params2 = [_params mutableCopy];
    [params2 removeObjectForKey:@"sort_by"];
    NSLog(@"kjk  %@\n",[params2 objectForKey:@"api_key"]);
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.themoviedb.org/3/movie/"]];
    printf("\n\n koko \n\n");

    [manager GET:[NSString stringWithFormat:@"%ld", currentMovie.ID] parameters:params2 progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         // Success
         NSLog(@"Success koko1: %@", [responseObject allKeys]);
         [[_movies objectAtIndex:index] setRunTime:[[responseObject objectForKey:@"runtime"] integerValue]];
         [self.movieLoadIsFinish movieEndLoad:[[_movies objectAtIndex:index] runTime]];
         
         
     } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         // Failure
         NSLog(@"Failure koko1: %@", error);
     }];
    
    
    manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/%ld",(long)currentMovie.ID]]];
    
    [manager GET:@"videos" parameters:params2 progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         // Success
         NSLog(@"Success koko1: %@", [responseObject allKeys]);
         [[_movies objectAtIndex:index] setTrailersID:[NSMutableArray new]];
         [[_movies objectAtIndex:index] setTrailersName:[NSMutableArray new]];
         for(NSDictionary *trailer in [responseObject objectForKey:@"results"])
         {
             if ([[trailer objectForKey: @"type"] isEqualToString:@"Trailer"]) {
                 
                 
                 [[[_movies objectAtIndex:index] trailersID] addObject:[trailer objectForKey:@"key"]];
                 [[[_movies objectAtIndex:index] trailersName] addObject:[trailer objectForKey:@"name"]];
             }
         }
         [self.movieLoadIsFinish movieTrailEndLoad:[[_movies objectAtIndex:index] trailersName] :[[_movies objectAtIndex:index] trailersID]];
         
         
     } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         // Failure
         NSLog(@"Failure koko1: %@", error);
     }];
    
    
    manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/%ld",(long)currentMovie.ID]]];
    
    [manager GET:@"reviews" parameters:params2 progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         // Success
         NSLog(@"Success koko1: %@", [responseObject allKeys]);
         [[_movies objectAtIndex:index] setReviewAuther:[NSMutableArray new]];
         [[_movies objectAtIndex:index] setReview:[NSMutableArray new]];
         for(NSDictionary *trailer in [responseObject objectForKey:@"results"])
         {
             
             [[[_movies objectAtIndex:index] reviewAuther] addObject:[trailer objectForKey:@"author"]];
             [[[_movies objectAtIndex:index] review] addObject:[trailer objectForKey:@"content"]];
             
         }
         [self.movieLoadIsFinish movieReviewEndLoad:[[_movies objectAtIndex:index] reviewAuther] :[[_movies objectAtIndex:index] review]];
         
     } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         // Failure
         NSLog(@"Failure koko1: %@", error);
     }];
}
-(void)beginLoadFilmAtIndex:(NSInteger)index{
    [self LoadMovieAtIndex:index];
}
-(Movie*)MonieAtIndex: (NSInteger) index{
    return [_movies objectAtIndex:index];
}
@end
