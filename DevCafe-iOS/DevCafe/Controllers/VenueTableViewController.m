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
    
    if(indexPath.row < self.venues.count)
    {
        static int TAG_NAME = 100;
        static int TAG_DISTANCE = 101;
        
        Venue * venue = [self.venues objectAtIndex:indexPath.row];
        
        //set name
        if([[cell viewWithTag:TAG_NAME] isKindOfClass:[UILabel class]])
        {
            ((UILabel *)[cell viewWithTag:TAG_NAME]).text = venue.name;
        }
        else
        {
            THROW_INCORRECT_TYPE_EXCEPTION;
        }
        
        //set distance
        if([[cell viewWithTag:TAG_DISTANCE] isKindOfClass:[UILabel class]])
        {
            ((UILabel *)[cell viewWithTag:TAG_DISTANCE]).text = [[NSString alloc] initWithFormat:@"%ldm",venue.location.distance];
        }
        else
        {
            THROW_INCORRECT_TYPE_EXCEPTION;
        }
        
        
    }
    
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    // [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
