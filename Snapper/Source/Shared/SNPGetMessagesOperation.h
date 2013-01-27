//
//  SNPGetMessagesOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserOperation.h"


@interface SNPGetMessagesOperation : SNPBaseUserOperation

// -- Properties --
@property (nonatomic, retain) NSArray* messageIds;

// -- Initializers --
- (id)initWithMessageIds:(NSArray*)messageIds
               accountId:(NSString*)accountId
             finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end