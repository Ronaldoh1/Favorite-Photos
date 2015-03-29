//
//  IGImage.h
//  Favorite Photos
//
//  Created by Ronald Hernandez on 3/28/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IGImage : NSObject
@property NSString *idNumber;
@property NSURL *imageURL;
@property UIImage *image;
@property double latitude;
@property double longitude;

-(instancetype)initWithMediaDictionary:(NSDictionary *)dictionary;


@end
