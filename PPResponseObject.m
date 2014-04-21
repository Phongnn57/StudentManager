//
//  PPResponseObject.m
//  PPFoundation
//
//  Created by Hieu Bui on 3/7/14.
//  Copyright (c) 2014 ROXWIN. All rights reserved.
//

#import "PPResponseObject.h"

@interface PPResponseObject (Private)
@end

@implementation PPResponseObject

- (id)init {
	self = [super init];
	if (self) {
		_statusCode = PPStatusCodeUndefined;
		_responseBody = nil;
	}
	return self;
}

- (void)printDescription {
	DLog(@"\nSTATUS CODE: %d\nRESPONSE BODY:\n%@", _statusCode, _responseBody);
}

+ (PPResponseObject *)responseObjectWithStatusCode:(NSInteger)statusCode responseObject:(id)responseObject {
	PPResponseObject *obj = [PPResponseObject new];
	obj.statusCode = (PPStatusCode)statusCode;
	obj.responseBody = responseObject;
	return obj;
}

+ (PPResponseObject *)responseObjectWithResponse:(AFHTTPRequestOperation *)operation responseObject:(id)responseObject {
	PPResponseObject *obj = [PPResponseObject new];
	obj.statusCode = (PPStatusCode)operation.response.statusCode;
	obj.responseBody = responseObject;
    
    
    DLog(@"Server response Dict: %@", responseObject);
    if (responseObject == nil) {
        NSString *responseString = [[NSString alloc] initWithData:operation.responseData encoding:NSUTF8StringEncoding];
        DLog(@"Server response string: %@", responseString);
    }
    
	return obj;
}
- (NSArray *)responseData{
    if ([self.responseBody.allKeys containsObject:@"data"]) {
        id data = self.responseBody[@"data"];
        if ([data isKindOfClass:[NSDictionary class]]) {
            NSDictionary* dictData = (NSDictionary *)data;
            if ([dictData.allKeys containsObject:@"data"]) {
                id childData = dictData[@"data"];
                if ([childData isKindOfClass:[NSArray class]]) {
                    return childData;
                }
            }
        }
    }
    return nil;
}
@end
