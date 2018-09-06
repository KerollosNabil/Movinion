//
//  DetailsViewController.h
//  Movies App
//
//  Created by MacOS on 12/25/1439 AH.
//  Copyright © 1439 AH kerollos nabil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "movieEnd.h"
#import "networking.h"



@interface DetailsViewController : UIViewController < UITableViewDataSource , UITableViewDelegate, movieEnd>
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UILabel *movieDate;
@property (weak, nonatomic) IBOutlet UILabel *movieTime;
@property (weak, nonatomic) IBOutlet UILabel *movieRate;
@property (weak, nonatomic) IBOutlet UITextView *movieOverView;
@property (weak, nonatomic) IBOutlet UIImageView *moviePoster;
@property (weak, nonatomic) IBOutlet UIScrollView *movieScrollVeiw;
@property (weak, nonatomic) IBOutlet UITableView *table1;
@property (weak, nonatomic) IBOutlet UITableView *table2;


//property to get data from Home page and put it in the Details page

@property NSAttributedString * film_title;
@property NSAttributedString * film_Date;
@property NSAttributedString * film_Time;
@property NSAttributedString * film_Rate;
@property NSAttributedString * film_OverView;
@property NSString * film_poster;
@property NSInteger movieId;
@property (strong, nonatomic) networking *net;





- (IBAction)addMovieToFavorite:(id)sender;

@end
