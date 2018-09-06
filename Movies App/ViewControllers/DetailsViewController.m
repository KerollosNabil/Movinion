//
//  DetailsViewController.m
//  Movies App
//
//  Created by MacOS on 12/25/1439 AH.
//  Copyright © 1439 AH kerollos nabil. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController (){
    
}

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
    
    [_moviePoster setImage:[UIImage imageNamed:@"1.png"]];
    [_movieTitle setText:@"Chappie"];
    [_movieDate setText:@"2015"];
    [_movieRate setText:@"8.2"];
    [_movieTime setText:@"120Min"];
    
    // Do any additional setup after loading the view.


	
}

//====================== ( table Veiw ) ==================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}          // Default is 1 if not implemented

    
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView.tag == 1){
        return 3;
    }else{
        return 3;
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
        [TrailerNum setText:@"Trailer1"];
        
        return cell;
        
        
    }else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        cell.textLabel.text= @"this is test cell 1";
        cell.detailTextLabel.text = @"subtitle";
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

@end
