//
//  SNPCreateFileOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 1/28/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPCreateFileOperation.h"

#import "SNPAPIUtils.h"

#import "SNPFile.h"


@implementation SNPCreateFileOperation

#pragma mark - Initialization

- (id)initWithName:(NSString*)name
       contentType:(NSString*)contentType
              type:(NSString*)type
              data:(NSData*)data
         accountId:(NSString*)accountId
       finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.name = name;
        self.contentType = contentType;
        self.type = type;
        self.data = data;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] createFileEndpointURL];
    self.method = @"POST";

    NSMutableData* bodyData = [NSMutableData new];

    NSTimeInterval now = [NSDate timeIntervalSinceReferenceDate];
    NSString* boundaryString = [NSString stringWithFormat:@"create_file_boundary_%.0f", now];

    // TODO: validate content type value

    NSString* fileHeader = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: file; name=\"content\"; filename=\"%@\"\r\nContent-Type: %@\r\n\r\n",
                            boundaryString,
                            _name,
                            _contentType];
    [bodyData appendData:[fileHeader dataUsingEncoding:NSUTF8StringEncoding]];
    [bodyData appendData:_data];

    NSString* metadataHeader = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: file; name=\"metadata\"; filename=\"metadata.json\"\r\nContent-Type: application/json\r\n\r\n",
                                boundaryString];
    [bodyData appendData:[metadataHeader dataUsingEncoding:NSUTF8StringEncoding]];

    NSDictionary* metadataDict = (@{
                                  @"type" : _type,
                                  });
    NSError* error = nil;
    NSData* metadata = [NSJSONSerialization dataWithJSONObject:metadataDict
                                                       options:(NSJSONWritingPrettyPrinted)
                                                         error:&error];
    if(metadata == nil) {
        SNPResponse* response = [self createResponseFromError:error];
        if(self.finishBlock) {
            self.finishBlock(response);
        }
        return;
    }
    [bodyData appendData:metadata];

    NSString* closingBoundary = [NSString stringWithFormat:@"--%@--\r\n",
                                 boundaryString];
    [bodyData appendData:[closingBoundary dataUsingEncoding:NSUTF8StringEncoding]];

    self.body = bodyData;
    self.bodyType = [NSString stringWithFormat:@"multipart/form-data; boundary=\"%@\"", boundaryString];

    self.serializationRootClass = [SNPFile class];
    
    [super main];
}

@end
