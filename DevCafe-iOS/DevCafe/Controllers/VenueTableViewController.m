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
#import "AppDelegate.h"

@interface VenueTableViewController()
@property (nonatomic,strong) NSArray<Venue> * venues;
@property (nonatomic,weak)  LocationHandler * locationHandler;

@end

@implementation VenueTableViewController

- (void) viewDidLoad
{
    //show progrss hud
    [self showProgressHUD];
    
    self.locationHandler = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).locationHanlder;
    CLLocationCoordinate2D coordinate = self.locationHandler.location.coordinate;
    
    [self updateVenuesWithLat:[[NSNumber alloc] initWithDouble:coordinate.latitude]  andLng:[[NSNumber alloc] initWithDouble:coordinate.longitude]];
    
    //register to notification center to receive location changed message
    [self register:@selector(whenLocationChanged:)  name:LOCATION_CHANGED_NOTIFICATION];
}

- (void)dealloc
{
    //remove the current object form notification center
    [self deregister];
}

#pragma mark Update Venues
- (void) whenLocationChanged:(NSNotification*)notification
{
    NSDictionary * content= [notification.userInfo content];
    NSNumber *lat = [content objectForKey:@"lat"];
    NSNumber *lng = [content objectForKey:@"lng"];
    [self updateVenuesWithLat:lat  andLng:lng];
}

#pragma mark Update Venues
- (void) updateVenuesWithLat:(NSNumber *)lat andLng:(NSNumber *)lng
{
    
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
