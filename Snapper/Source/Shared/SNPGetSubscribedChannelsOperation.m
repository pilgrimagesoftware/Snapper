//
//  SNPGetSubscribedChannelsOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetSubscribedChannelsOperation.h"

#import "SNPChannel.h"

#import "SNPAPIUtils.h"


@implementation SNPGetSubscribedChannelsOperation

#pragma mark - Initialization

- (instancetype)initWithAccountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.endpoint = [[SNPAPIUtils sharedInstance] getSubscribedChannelsEndpointURL];
        self.serializationArrayClass = [SNPChannel class];
    }

    return self;
}

@end
