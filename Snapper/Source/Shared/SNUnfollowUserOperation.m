//
//  SNUnfollowUserOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNUnfollowUserOperation.h"

#import "SNUser.h"

#import "SNAPIUtils.h"


@implementation SNUnfollowUserOperation

#pragma mark - Initialization

- (id)initWithUserId:(NSUInteger)userId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNResponse*))finishBlock {

    self = [super init];
    if(self) {
        self.userId = userId;
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNAPIUtils sharedAPIUtils] unfollowUserEndpointURL:_userId];
    self.method = @"DELETE";
    self.serializationRootClass = [SNUser class];

    [super main];
}

@end
