//
//  SecurityConnection.h
//  HttpsTest
//
//  Created by Tobiasz Parys on 26/02/14.
//  Copyright (c) 2014 Tobiasz Parys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecurityConnection : NSObject

+(SecurityConnection *)manager;

-(void)shareSomeDataByPOSTMethod:(NSString *)someData;

-(void)base64Test;

@end


