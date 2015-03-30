//
//  CustomUICollectionViewCells.m
//  Favorite Photos
//
//  Created by Ronald Hernandez on 3/29/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import "CustomUICollectionViewCell.h"
#import "IGImage.h"

@implementation CustomUICollectionViewCell


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



-(void)updateCell:(UIImage *)imageToDisplay{
//    NSString *sourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Assets"];
//    NSString *filename = [NSString stringWithFormat:@"%@/%@", sourcePath, self.imageName];

    //UIImage *image = [UIImage imageWithContentsOfFile:filename];

//    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
//    [self.imageView setImage:imageToDisplay];
}

@end
