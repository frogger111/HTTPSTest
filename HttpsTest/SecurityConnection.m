//
//  SecurityConnection.m
//  HttpsTest
//
//  Created by Tobiasz Parys on 26/02/14.
//  Copyright (c) 2014 Tobiasz Parys. All rights reserved.
//

#import "SecurityConnection.h"
#import <AFNetworking/AFNetworking.h>


@implementation SecurityConnection{

    AFHTTPRequestOperationManager *_af_manager;
    
}

+(SecurityConnection *)manager{

    static SecurityConnection *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}


-(instancetype)init{

    if(self = [super init]){
    
        _af_manager = [AFHTTPRequestOperationManager manager];
//        [_af_manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"" password:@""];
        _af_manager.securityPolicy.allowInvalidCertificates = YES;
        _af_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
    }
    
    return self;
}

-(void)shareSomeDataByPOSTMethod:(NSString *)someData{

    NSDictionary *dict = @{@"SomeData":someData};

    [_af_manager GET:@"https://www.google.pl/" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *myString = [[NSString alloc] initWithData:responseObject encoding:NSASCIIStringEncoding];
        
        NSLog(@"Success, Response %@", myString);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"AFHTTPRequestOperation error has occured. Error: %@", error);
    }];
}

-(void)base64Test {

    NSString *plainString = @"Some data to encode usinng base 64";
    
    NSData *plainData = [plainString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [plainData base64EncodedStringWithOptions:0];
    NSLog(@"%@", base64String);
    
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:base64String options:0];
    NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", decodedString);
    
}

@end
