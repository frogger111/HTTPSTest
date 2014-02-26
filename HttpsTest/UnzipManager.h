//
//  UnzipManager.h
//  HttpsTest
//
//  Created by Tobiasz Parys on 26/02/14.
//  Copyright (c) 2014 Tobiasz Parys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UnzipManager : NSObject

+(UnzipManager *)manager;

-(void)getFileFromZip:(NSString *)fileName completitionBlock:(void(^)(UIImage *))block;

@end
