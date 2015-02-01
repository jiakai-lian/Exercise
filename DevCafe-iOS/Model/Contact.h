//
//  Contact.h
//  Modal object for Contact
//  DevCafe
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface Contact : JSONModel

@property(nonatomic, strong) NSString <Optional> *phone;
@property(nonatomic, strong) NSString <Optional> *formattedPhone;

@end
