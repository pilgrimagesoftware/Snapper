//
//  SNPUnmuteUserOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPUnmuteUserOperation.h"

#import "SNPUser.h"

#import "SNPAPIUtils.h"


@implementation SNPUnmuteUserOperation

#pragma mark - Initialization

- (instancetype)initWithUserId:(NSUInteger)userId
                     accountId:(NSString*)accountId
                   finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.userId = userId;
        self.method = @"DELETE";
        self.serializationRootClass = [SNPUser class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedInstance] unmuteUserEndpointURL:_userId];

    [super main];
}

@end
