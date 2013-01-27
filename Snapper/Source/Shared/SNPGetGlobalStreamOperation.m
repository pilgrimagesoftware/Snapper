//
//  SNPGetGlobalStreamOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetGlobalStreamOperation.h"

#import "SNPAPIUtils.h"


@implementation SNPGetGlobalStreamOperation

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] getGlobalStreamEndpointURL];
    
    [super main];
}

@end