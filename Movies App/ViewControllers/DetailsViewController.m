//
//  DetailsViewController.m
//  Movies App
//
//  Created by MacOS on 12/25/1439 AH.
//  Copyright © 1439 AH kerollos nabil. All rights reserved.
//

#import "DetailsViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DetailsViewController ()

@property (strong, nonatomic) NSMutableArray *trailsName;
@property (strong, nonatomic) NSMutableArray *trailsID;
@property (strong, nonatomic) NSMutableArray *review;
@property (strong, nonatomic) NSMutableArray *reviewAu;


@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _table1.delegate = self;
    _table1.dataSource = self;
    _table2.delegate = self;
    _table2.dataSource = self;
    
    [_movieScrollVeiw setScrollEnabled:YES];
    [_movieScrollVeiw setContentSize:CGSizeMake(320, 1100)];
    // for test
    
    _net.movieLoadIsFinish=self;
    // Do any additional setup after loading the view.


	
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_net beginLoadFilmAtIndex:_movieId];
    [_moviePoster sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat: @"http://image.tmdb.org/t/p/w185/%@",_film_poster]]placeholderImage:[UIImage imageNamed:@"1.png"]];
    [_movieTitle setText:_film_Time];
    [_movieDate setText:_film_Date];
    [_movieRate setText:_film_Rate];
    [_movieTime setText:@"0Min"];
    [_movieOverView setText:_film_OverView];
}
//====================== ( table Veiw ) ==================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}          // Default is 1 if not implemented

    
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView.tag == 1){
        return [_trailsName count];
    }else{
        return [_review count];
    }
     // for test
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * cellIdentifier=@"cell";
    if(tableView.tag == 1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        UIImageView * imageView = [cell viewWithTag:0];
        UILabel * TrailerNum = [cell viewWithTag:1];
        
        
        imageView.image = [UIImage imageNamed:@"Icon_6-128.png"];
        [TrailerNum setText:[_trailsName objectAtIndex:indexPath.row]];
        //[TrailerNum setText:@"koko"];
        return cell;
        
        
    }else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        cell.textLabel.text= [_reviewAu objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [_review objectAtIndex:indexPath.row];
        //cell.textLabel.text= @"koko";
        //cell.detailTextLabel.text = @"koko";
        return cell;
    }
    
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(tableView.tag == 1){
        return @"Trailers:";
    }
    else{
        return @"Reviews:";
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView.tag == 1){
        printf("int the first table view row at index : %d is selected\n",(int)indexPath.row);
    }
    else{
        printf("int the second table view row at index : %d is selected\n",(int)indexPath.row);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addMovieToFavorite:(id)sender {
}
/*- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
}


- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    <#code#>
}
*/

- (void)movieEndLoad:(int)pop {
    _movieTime.text=[NSString stringWithFormat:@"%dMin",pop];
}

- (void)movieReviewEndLoad:(NSMutableArray *)reviewAuther :(NSMutableArray *)reviewCon {
    _review = reviewCon;
    _reviewAu = reviewAuther;
    [_table2 reloadData];
}

- (void)movieTrailEndLoad:(NSMutableArray *)trailsN :(NSMutableArray *)trailsID {
    _trailsName = trailsN;
    _trailsID = trailsID;
    [_table1 reloadData];
}



@end
