//
//  SNPGetUserCoverImageOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseImageFetchOperation.h"


@interface SNPGetUserCoverImageOperation : SNPBaseImageFetchOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger userId;

// -- Initializers --
- (instancetype)initWithUserId:(NSUInteger)userId
         finishBlock:(void (^)(id image, NSError* error))finishBlock;

@end
