//
//  APIClient.m
//  PPFoundation
//
//  Created by Hieu Bui on 3/5/14.
//  Copyright (c) 2014 PIPU, Inc. All rights reserved.
//

#import "PPAPIClient.h"
#import "PPConstants.h"

@implementation PPAPIClient

+ (instancetype)sharedClient {
	static PPAPIClient *_sharedClient = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
	    _sharedClient = [[PPAPIClient alloc] init];
	});
	return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
	self = [super initWithBaseURL:url];
	if (self) {
		self.requestSerializer = [AFJSONRequestSerializer serializer];
		self.responseSerializer = [AFJSONResponseSerializer serializer];
	}
	return self;
}

- (void)fetchCurrentConditionsForLocation:(CLLocationCoordinate2D)coordinate
                          completionBlock:(void (^)(PPResponseObject *responseObject))completionBlock {
	NSString *path = @"weather?lat=21.030400&lon=105.786000&units=imperial";
	[self GET:path parameters:nil success: ^(AFHTTPRequestOperation *operation, id responseObject) {
	    PPResponseObject *obj = [PPResponseObject responseObjectWithStatusCode:operation.response.statusCode responseObject:responseObject];
	    if (completionBlock) {
	        completionBlock(obj);
		}
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    PPResponseObject *obj = [PPResponseObject responseObjectWithStatusCode:operation.response.statusCode responseObject:nil];
	    if (completionBlock) {
	        completionBlock(obj);
		}
	}];
}

//APi client






@end
