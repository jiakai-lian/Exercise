//
//  VenueTableViewController.m
//  DevCafe
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "VenueTableViewController.h"
#import "ServiceAPI.h"
#import "SearchResponse.h"
#import "Venue.h"

@interface VenueTableViewController()
@property (nonatomic,strong) NSArray<Venue> * venues;

@end

@implementation VenueTableViewController

- (void) viewDidLoad
{
    //show progrss hud
    [self showProgressHUD];
    
    [self updateVenues];
}

#pragma mark Update Venues
- (void) updateVenues
{
    NSNumber *lat = [[NSNumber alloc]initWithDouble:33.8861];
    NSNumber *lng = [[NSNumber alloc]initWithDouble:151.2111];
    
    [ServiceAPI SearchCafesWithLat:lat andLng:lng success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self hideProgressHUD];
        
        NSError* err = nil;
        SearchResponse* response = [[SearchResponse alloc] initWithDictionary:responseObject error:&err];
        
        self.venues = response.venues;
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self hideProgressHUD];
        
        //show error alert
        [self showAlertWithTile:@"Error" andMessage:[error localizedDescription] withCancelActionTitle:@"Confirm" andCancelActionHandler:nil];
    }];
}


#pragma mark table view controller deledates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.venues.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cafe";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    // [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
