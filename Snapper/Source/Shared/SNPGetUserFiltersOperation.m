//
//  SNPGetUserFiltersOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetUserFiltersOperation.h"

#import "SNPFilter.h"

#import "SNPAPIUtils.h"


@implementation SNPGetUserFiltersOperation

#pragma mark - Initialization

- (instancetype)initWithAccountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.endpoint = [[SNPAPIUtils sharedInstance] getFiltersEndpointURL];
        self.serializationArrayClass = [SNPFilter class];
    }

    return self;
}

@end
