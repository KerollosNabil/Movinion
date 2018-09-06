//
//  HomeCollectionViewController.m
//  Movies App
//
//  Created by kerollos nabil on 9/5/18.
//  Copyright © 2018 kerollos nabil. All rights reserved.
//

#import "HomeCollectionViewController.h"
#import "DetailsViewController.h"
#import "networking.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface HomeCollectionViewController ()
@property (strong ,nonatomic) NSArray * posters;
@property (nonatomic) CGFloat width, hight;
@property (strong, nonatomic) DetailsViewController *details;
@property (strong, nonatomic) networking *nets;
@property (strong, nonatomic) const NSString *API_KEY;

@end

@implementation HomeCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    
    self.collectionView.backgroundColor = [UIColor blackColor];
    _API_KEY = @"2cedf03071ab4a0d7be84506a254edad";
    NSString *urls = @"http://api.themoviedb.org/3/discover/movie";
    NSDictionary *params = @{@"sort_by":@"popularity.desc",@"api_key":_API_KEY};
    
    _nets = [[networking alloc] initWithBaseUrl:urls andParamters:params];
    _nets.isFinish=self;
    _width = [UIScreen mainScreen].bounds.size.width;
    _hight = [UIScreen mainScreen].bounds.size.height;

    _details = [self.storyboard instantiateViewControllerWithIdentifier:@"Details"];
    // Do any additional setup after loading the view.
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_posters count];
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake(_width/2, _hight*2/4);
}
-(void)didFinishLoad{
    _posters = [_nets moviesPostersID];
    printf("koko %lu\n",[_posters count]);
    [self.collectionView reloadData];
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    Movie *currentMovie = [_nets MonieAtIndex:indexPath.row];
    _details.film_Time = currentMovie.name;
    _details.film_Date = currentMovie.releaseDate;
    _details.film_Rate = [NSString stringWithFormat:@"%.1f", currentMovie.rate];
    _details.film_OverView =currentMovie.movieDesctiption;
    _details.film_poster = _posters[indexPath.row];
    _details.net = _nets;
    _details.movieId = indexPath.row;
    [self.navigationController pushViewController:_details animated:YES];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    UIImageView *post = [cell viewWithTag:1];
    printf("  %s\n",[_posters[0] UTF8String]);
    post.frame = CGRectMake(0, 0, _width/2, _hight*2/4);
    [post sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat: @"http://image.tmdb.org/t/p/w185/%@",_posters[indexPath.row]]]placeholderImage:[UIImage imageNamed:@"1.png"]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
