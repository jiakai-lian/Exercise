//
//  SearchResponseTests.m
//  DevCafe
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SearchResponse.h"

@interface SearchResponseTests : XCTestCase

@end

@implementation SearchResponseTests

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

- (void)testSearchResponseJSONMapping
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *resouce = [bundle pathForResource:@"SearchResponse" ofType:@"json"];
    NSString *json = [NSString stringWithContentsOfFile:resouce encoding:NSUTF8StringEncoding error:nil];

    NSError *err = nil;
    SearchResponse *response = [[SearchResponse alloc] initWithString:json error:&err];

    XCTAssertNotNil(response);

    //the following asserts are based on the content of SearchResponse.json
    //if the content has been changed, those asserts need to be changed accordingly

    XCTAssertNotNil(response.venues);
    XCTAssertEqual(response.venues.count, 30);

    Venue *venue = [response.venues firstObject];

    XCTAssertEqualObjects(venue.id, @"49c3a162f964a52067561fe3");
    XCTAssertEqualObjects(venue.name, @"Cafe Katja");
    //TODO more asserts
}

@end
