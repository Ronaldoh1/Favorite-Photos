//
//  ImageDownloader.h
//  Favorite Photos
//
//  Created by Ronald Hernandez on 3/28/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IGImageDownloaderDelegate <NSObject>

-(void)gotIgRawData:(NSArray *)igRawData;

@end

@interface ImageDownloader : NSObject

@property id<IGImageDownloaderDelegate>parentVC;

-(void)pullImagesFromIGAPI;

@end
