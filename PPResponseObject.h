//
//  PPResponseObject.h
//  PPFoundation
//
//  Created by Hieu Bui on 3/7/14.
//  Copyright (c) 2014 ROXWIN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPRequestOperationManager.h>

@interface PPResponseObject : NSObject

@property (nonatomic, assign) PPStatusCode statusCode;
@property (nonatomic, strong) NSDictionary *responseBody;

- (void)printDescription;
+ (PPResponseObject *)responseObjectWithStatusCode:(NSInteger)statusCode responseObject:(id)responseObject;
+ (PPResponseObject *)responseObjectWithResponse:(AFHTTPRequestOperation *)operation responseObject:(id)responseObject;
- (NSArray *)responseData;
@end
