//
//  SNPGetPersonalStreamOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseStreamOperation.h"
#import "SNPPostParameters.h"
#import "SNPPaginationParameters.h"


@interface SNPGetPersonalStreamOperation : SNPBaseStreamOperation
<SNPPostParameters, SNPPaginationParameters>

@property (nonatomic, assign) BOOL unified;

@end
