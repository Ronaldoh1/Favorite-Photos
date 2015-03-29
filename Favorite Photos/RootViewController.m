//
//  ViewController.m
//  Favorite Photos
//
//  Created by Ronald Hernandez on 3/28/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import "RootViewController.h"
#import "IGImage.h"
#import "ImageDownloader.h"

@interface RootViewController ()<IGImageDownloaderDelegate>
@property ImageDownloader *downloader;
@property NSMutableArray *igImageObjectArray;
@property (weak, nonatomic) IBOutlet UIImageView *imageToDisplay;


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.downloader = [ImageDownloader new];

    //set the delegate.
    self.downloader.parentVC = self;
    //Call method to pull the images from image downloader class.
    [self.downloader pullImagesFromIGAPI];

    self.igImageObjectArray = [NSMutableArray new];




}
//this is the method that will allow us to access the array of images from the downloader class.
-(void)gotIgRawData:(NSArray *)igRawData{

    for(NSDictionary *dict in igRawData){

        IGImage *igImage = [[IGImage alloc]initWithMediaDictionary:dict];
        [self.igImageObjectArray addObject:igImage];

    }

 



    
 }

@end
