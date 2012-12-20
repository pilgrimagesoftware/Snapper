//
//  SNToken.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "SNUser.h"


@interface SNToken : MTLModel

@property (nonatomic, copy) NSString* clientId;
@property (nonatomic, copy) NSString* appClientId;
@property (nonatomic, copy) NSString* appLink;
@property (nonatomic, copy) NSString* appName;
@property (nonatomic, retain) NSArray* scopes;
@property (nonatomic, retain) SNUser* user;

@end
