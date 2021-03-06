//
//  SNPGetChannelsOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetChannelsOperation.h"

#import "SNPChannel.h"

#import "SNPAPIUtils.h"


@implementation SNPGetChannelsOperation

#pragma mark - Initialization

- (instancetype)initWithChannelIds:(NSArray*)channelIds
                         accountId:(NSString*)accountId
                       finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.endpoint = [[SNPAPIUtils sharedInstance] getChannelsEndpointURL];
        self.serializationArrayClass = [SNPChannel class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    if([_channelIds count] > 0) {
        NSString* channelIdsString = [_channelIds componentsJoinedByString:@","];
        self.parameters = (@{
                             @"ids" : channelIdsString,
                             });
    }
    
    [super main];
}

@end
