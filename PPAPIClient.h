//
//  APIClient.h
//  PPFoundation
//
//  Created by Hieu Bui on 3/5/14.
//  Copyright (c) 2014 PIPU, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPResponseObject.h"
#import "AFHTTPRequestOperationManager.h"


@import CoreLocation;

@interface PPAPIClient : AFHTTPRequestOperationManager

+ (instancetype)sharedClient;

- (void)fetchCurrentConditionsForLocation:(CLLocationCoordinate2D)coordinate
                          completionBlock:(void (^)(PPResponseObject *responseObject))completionBlock;




// api client



@end
