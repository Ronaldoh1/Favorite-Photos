//
//  CustomUICollectionViewCells.h
//  Favorite Photos
//
//  Created by Ronald Hernandez on 3/29/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomUICollectionViewCell : UICollectionViewCell
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *imageView;


-(void)updateCell:(UIImage *)imageToDisplay;

@end
