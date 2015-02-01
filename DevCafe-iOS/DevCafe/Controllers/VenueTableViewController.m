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
#import "AppDelegate.h"
#import "UITableView+Enhancement.h"
#import "VenueArraySorter.h"
#import <MapKit/MapKit.h>

@interface VenueTableViewController ()
@property(nonatomic, strong) NSArray <Venue> *venues;
@property(nonatomic, weak) LocationHandler *locationHandler;

@end

@implementation VenueTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //show progress hud
    [self showProgressHUD];

#if !(TARGET_IPHONE_SIMULATOR)
    //get location from location handler
    self.locationHandler = ((AppDelegate *) [[UIApplication sharedApplication] delegate]).locationHandler;
    CLLocationCoordinate2D coordinate = self.locationHandler.location.coordinate;

    [self updateVenuesWithLat:[[NSNumber alloc] initWithDouble:coordinate.latitude] andLng:[[NSNumber alloc] initWithDouble:coordinate.longitude]];
#else
    //if run on the simulator, use mock location
    NSNumber *lat = [[NSNumber alloc]initWithDouble:40.7];
    NSNumber *lng = [[NSNumber alloc]initWithDouble:-74];
    
    [self updateVenuesWithLat:lat  andLng:lng ];
#endif

    //register to notification center to receive location changed message
    [self register:@selector(whenLocationChanged:) name:LOCATION_CHANGED_NOTIFICATION];
}

- (void)dealloc
{
    //remove the current object form notification center
    [self deregister];
}

#pragma mark method for location changed event
/**
 *  perform an updating action when received a location changed notifiction
 *
 *  @param notification : A notification from notification center
 */
- (void)whenLocationChanged:(NSNotification *)notification
{
    NSDictionary *content = [notification.userInfo content];
    
    //read lat lng from content dictionary
    NSNumber *lat = [content objectForKey:@"lat"];
    NSNumber *lng = [content objectForKey:@"lng"];
    
    [self updateVenuesWithLat:lat andLng:lng];
}

#pragma mark Update Venues
/**
 *  update venues by lat,lng
 *
 *  @param lat latitude
 *  @param lng longtitue
 */
- (void)updateVenuesWithLat:(NSNumber *)lat andLng:(NSNumber *)lng
{

    [ServiceAPI SearchCafesWithLat:lat andLng:lng success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        [self hideProgressHUD];

        NSError *err = nil;
        SearchResponse *response = [[SearchResponse alloc] initWithDictionary:responseObject error:&err];

        self.venues = [VenueArraySorter SortVenuesByDistance:response.venues ascending:YES];
        [self.tableView reloadData];
    }                      failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        [self hideProgressHUD];

        //show error alert
        [self showAlertWithTile:@"Error" andMessage:[error localizedDescription] withCancelActionTitle:@"Confirm" andCancelActionHandler:nil];
    }];
}


#pragma mark table view controller delegates
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
    
    if (indexPath.row < self.venues.count)
    {
        //tags for changable views in the cell
        static int TAG_NAME = 100;
        static int TAG_DISTANCE = 101;
        static int TAG_CALL = 102;
        static int TAG_MAP = 103;
        static int TAG_ADDRESS = 104;

        //instance type check
        if (![[cell viewWithTag:TAG_NAME] isKindOfClass:[UILabel class]] ||
                ![[cell viewWithTag:TAG_DISTANCE] isKindOfClass:[UILabel class]] ||
                ![[cell viewWithTag:TAG_CALL] isKindOfClass:[UIButton class]] ||
                ![[cell viewWithTag:TAG_MAP] isKindOfClass:[UIButton class]] ||
                ![[cell viewWithTag:TAG_ADDRESS] isKindOfClass:[UILabel class]])
        {
            THROW_INCORRECT_TYPE_EXCEPTION;
        }

        Venue *venue = [self.venues objectAtIndex:(NSUInteger)indexPath.row];

        //set name
        ((UILabel *) [cell viewWithTag:TAG_NAME]).text = venue.name;
        
        //set address
        if(venue.location.formattedAddress.count == 0 )
        {
            ((UILabel *) [cell viewWithTag:TAG_ADDRESS]).text = @"";
        }
        else
        {
            NSString *address = [[NSString alloc]init];
            for(NSString *string in venue.location.formattedAddress)
            {
                address= [address stringByAppendingString:[string stringByAppendingString:@"\n"]];
            }
            ((UILabel *) [cell viewWithTag:TAG_ADDRESS]).text = address;
        }

        //set distance
        ((UILabel *) [cell viewWithTag:TAG_DISTANCE]).text = [[NSString alloc] initWithFormat:@"%ldm", venue.location.distance];

        //if no contact data
        if ((venue.contact == nil) || (venue.contact.phone.length == 0))
        {
            //hide to button
            ((UIButton *) [cell viewWithTag:TAG_CALL]).hidden = YES;
        }
        else
        {
            //set button text
            [((UIButton *) [cell viewWithTag:TAG_CALL]) setTitle:venue.contact.formattedPhone forState:UIControlStateNormal];
        }

        //if no location data
        if ((venue.location.lat == 0) || (venue.location.lng == 0))
        {
            //hide to button
            ((UIButton *) [cell viewWithTag:TAG_MAP]).hidden = YES;
        }
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    // [self dismissViewControllerAnimated:YES completion:nil];

}

#pragma press buttons
/**
 *  make a call based on the venue's phone number
 *
 *  @param sender <#sender description#>
 */

- (IBAction)makeCall:(id)sender
{
    if (![sender isKindOfClass:[UIView class]])
    {
        THROW_INCORRECT_TYPE_EXCEPTION;
    }

    //get index in the item array
    NSUInteger index = (NSUInteger) [self.tableView getIndexPathByViewInCell:sender].row;

    if (index < self.venues.count)
    {
        //get the target item
        Venue *venue = [self.venues objectAtIndex:index];

        //create phone URL and launch external application
        NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@", venue.contact.phone]];
        [[UIApplication sharedApplication] openURL:phoneURL];
    }
}

/**
 *  show a venue in the map app based on its location
 *
 *  @param sender <#sender description#>
 */
- (IBAction)showMap:(id)sender
{

    if (![sender isKindOfClass:[UIView class]])
    {
        THROW_INCORRECT_TYPE_EXCEPTION;
    }

    //get index in the item array
    NSUInteger index = (NSUInteger) [self.tableView getIndexPathByViewInCell:sender].row;
    if (index < self.venues.count)
    {
        //get the target item
        Venue *venue = [self.venues objectAtIndex:index];

        // Create an MKMapItem to pass to the Maps app
        CLLocationCoordinate2D coordinate =
                CLLocationCoordinate2DMake(venue.location.lat, venue.location.lng);
        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate
                                                       addressDictionary:nil];
        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
        [mapItem setName:venue.name];
        // Pass the map item to the Maps app
        [mapItem openInMapsWithLaunchOptions:nil];
    }

}

@end
