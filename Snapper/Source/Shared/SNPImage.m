//
//  SNPImage.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPImage.h"


@implementation SNPImage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
            @"URL": @"url",
            @"defaultImage": @"is_default",
            };
}

+ (NSValueTransformer*)URLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
