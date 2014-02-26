//
//  ViewController.m
//  HttpsTest
//
//  Created by Tobiasz Parys on 26/02/14.
//  Copyright (c) 2014 Tobiasz Parys. All rights reserved.
//

#import "ViewController.h"
#import "SecurityConnection.h"
#import "UnzipManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    [[SecurityConnection manager] shareSomeDataByPOSTMethod:@"SomeAmazingString"];
//    [[SecurityConnection manager] base64Test];
    
    [self.progressView1 startAnimating];
    [self.progressView2 startAnimating];
    [self.progressView3 startAnimating];
    [self.progressView4 startAnimating];
    
    [[UnzipManager manager] getFileFromZip:@"4.png" completitionBlock:^(UIImage *img) {
        
        if(img){
        
            self.imageView1.image = img;
        }
        
        
        [self.progressView1 stopAnimating];
        
    }];
    
    [[UnzipManager manager] getFileFromZip:@"1.png" completitionBlock:^(UIImage *img) {
        
        if(img){
            
            self.imageView2.image = img;
        }
        
        
        [self.progressView2 stopAnimating];
        
    }];
    
    [[UnzipManager manager] getFileFromZip:@"5.png" completitionBlock:^(UIImage *img) {
        
        if(img){
            
            self.imageView3.image = img;
        }
        
    
        [self.progressView3 stopAnimating];
        
    }];

    [[UnzipManager manager] getFileFromZip:@"0.png" completitionBlock:^(UIImage *img) {
        
        if(img){
            
            self.imageView4.image = img;
        }
        
        
        [self.progressView4 stopAnimating];
        
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
