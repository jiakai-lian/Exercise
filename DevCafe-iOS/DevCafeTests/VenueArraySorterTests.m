//
//  VenueArraySorterTests.m
//  DevCafe
//
//  Created by jiakai lian on 1/02/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SearchResponse.h"
#import "VenueArraySorter.h"

@interface VenueArraySorterTests : XCTestCase

@end

@implementation VenueArraySorterTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//- (void)testExample {
//    // This is an example of a functional test case.
//    XCTAssert(YES, @"Pass");
//}
//
//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}
- (void)testSortVenuesByDistance_Ascending
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *resouce = [bundle pathForResource:@"SearchResponse" ofType:@"json"];
    NSString *json = [NSString stringWithContentsOfFile:resouce encoding:NSUTF8StringEncoding error:nil];

    NSError *err = nil;
    SearchResponse *response = [[SearchResponse alloc] initWithString:json error:&err];

    if (response.venues.count == 0)
    {
        XCTAssert(NO, @"Fail");
    }

    NSArray <Venue> *ascend = [VenueArraySorter SortVenuesByDistance:response.venues ascending:YES];

    for (int i = 0; i < ascend.count - 1; i++)
    {
        Venue *v1 = [ascend objectAtIndex:i];
        Venue *v2 = [ascend objectAtIndex:i + 1];
        XCTAssertTrue(v1.location.distance <= v2.location.distance);
    }
}

- (void)testSortVenuesByDistance_Descending
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *resouce = [bundle pathForResource:@"SearchResponse" ofType:@"json"];
    NSString *json = [NSString stringWithContentsOfFile:resouce encoding:NSUTF8StringEncoding error:nil];

    NSError *err = nil;
    SearchResponse *response = [[SearchResponse alloc] initWithString:json error:&err];

    if (response.venues.count == 0)
    {
        XCTAssert(NO, @"Fail");
    }

    NSArray <Venue> *ascend = [VenueArraySorter SortVenuesByDistance:response.venues ascending:NO];

    for (int i = 0; i < ascend.count - 1; i++)
    {
        Venue *v1 = [ascend objectAtIndex:i];
        Venue *v2 = [ascend objectAtIndex:i + 1];
        XCTAssertTrue(v1.location.distance > v2.location.distance);
    }
}

@end
