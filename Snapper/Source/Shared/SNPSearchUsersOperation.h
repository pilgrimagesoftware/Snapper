//
//  SNPSearchUsersOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserOperation.h"


@interface SNPSearchUsersOperation : SNPBaseUserOperation

// -- Properties --
@property (nonatomic, copy) NSString* queryString;

// -- Initialization --
- (id)initWithQueryString:(NSString*)queryString
                accountId:(NSString*)accountId
              finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end