//
//  SNPSearchPlacesOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 2/5/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPSearchPlacesOperation.h"

#import "SNPPlace.h"

#import "SNPAPIUtils.h"


@implementation SNPSearchPlacesOperation

#pragma mark - Initialization

- (id)initWithLatitude:(CGFloat)latitude
             longitude:(CGFloat)longitude
             accountId:(NSString*)accountId
           finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.latitude = latitude;
        self.longitude = longitude;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] searchPlaceEndpointURL];

    NSMutableDictionary* parameters = [(@{
                                        @"latitude" : @(_latitude),
                                        @"longitude" : @(_longitude),
                                        }) mutableCopy];

    if(_q) {
        parameters[@"q"] = _q;
    }
    if(_radius > 0) {
        parameters[@"radius"] = @(_radius);
    }
    if(_count > 0) {
        parameters[@"count"] = @(_count);
    }
    if(_altitude > 0) {
        parameters[@"altitude"] = @(_altitude);
    }
    if(_horizontalAccuracy > 0) {
        parameters[@"horizontal_accuracy"] = @(_horizontalAccuracy);
    }
    if(_verticalAccuracy > 0) {
        parameters[@"vertical_accuracy"] = @(_verticalAccuracy);
    }

    self.parameters = parameters;

    self.serializationArrayClass = [SNPPlace class];
    
    [super main];
}

@end