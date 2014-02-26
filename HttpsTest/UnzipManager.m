//
//  UnzipManager.m
//  HttpsTest
//
//  Created by Tobiasz Parys on 26/02/14.
//  Copyright (c) 2014 Tobiasz Parys. All rights reserved.
//

#import "UnzipManager.h"
#import "ZipException.h"
#import "ZipReadStream.h"
#import "FileInZipInfo.h"

@implementation UnzipManager

+(UnzipManager *)manager{

    static UnzipManager *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

-(void)getFileFromZip:(NSString *)fileName completitionBlock:(void (^)(UIImage *))block{

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        
        
        NSLog(@"Is main thread %d", [NSThread isMainThread]);
        
        NSString *zipFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"images.zip"];
        
        ZipFile *unzipFile= [[ZipFile alloc] initWithFileName:zipFilePath mode:ZipFileModeUnzip];
        [unzipFile locateFileInZip:fileName];
        FileInZipInfo *fileInfo = [unzipFile getCurrentFileInZipInfo];
        
        
        ZipReadStream *read= [unzipFile readCurrentFileInZip];
        NSMutableData *data= [[NSMutableData alloc] initWithLength:[fileInfo length]];
        long long bytesRead = [read readDataWithBuffer:data];
        
        
        UIImage *imageData = [UIImage imageWithData:data];
        
        [read finishedReading];
        
        [unzipFile close];
        
        
        
        if(imageData){
        
            dispatch_async(dispatch_get_main_queue(), ^{
                block(imageData);
            });
        } else {
        
            
        }
        
        
        
    });
}

@end
