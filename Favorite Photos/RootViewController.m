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

@interface RootViewController ()<IGImageDownloaderDelegate, UITabBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate>
@property ImageDownloader *downloader;
@property NSMutableArray *igImageObjectArray;
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;




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






//    //How many pages do we want?
//    int PageCount = 3;
//
//    //Setup scroll view
//    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, 320, 420)];
//    self.scrollView.backgroundColor = [UIColor clearColor];
//    self.scrollView.pagingEnabled = YES;
//    self.scrollView.contentSize = CGSizeMake(PageCount * self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
//
//    //Setup Each View Size
//    CGRect ViewSize = self.scrollView.bounds;
//
//    //Setup and Add Images
//    UIImageView *ImgView = [[UIImageView alloc] initWithFrame:ViewSize];
//    [ImgView setImage:[UIImage imageNamed:@"collage"]];
//    [self.scrollView addSubview:ImgView];
//
//    //Offset View Size
//    ViewSize = CGRectOffset(ViewSize, self.scrollView.bounds.size.width, 0);
//
//    UIImageView *ImgView2 = [[UIImageView alloc] initWithFrame:ViewSize];
//    [ImgView2 setImage:[UIImage imageNamed:@"photo-icon80.png"]];
//    [self.scrollView addSubview:ImgView2];
//
//    //Offset View Size
//    ViewSize = CGRectOffset(ViewSize, self.scrollView.bounds.size.width, 0);
//
//    UIImageView *ImgView3 = [[UIImageView alloc] initWithFrame:ViewSize];
//    [ImgView3 setImage:[UIImage imageNamed:@"Page_3.png"]];
//    [self.scrollView addSubview:ImgView3];
//
//
//
//
//    CGRect newViewSize = self.scrollView.bounds;
//    int NumberOfImages = 3 ;
//
//    for(int i=0; i<NumberOfImages; i++){
//
//        if(i == 0){
//            //Setup first picture
//            UIImageView *ImgView = [[UIImageView alloc] initWithFrame:newViewSize];
//            NSString *FilePath = [NSString stringWithFormat:@"Page_%d.png", i];
//            [ImgView setImage:[UIImage imageNamed:FilePath]];
//            [self.scrollView addSubview:ImgView];
//        }else{
//            //Setup the rest of the pictures
//            newViewSize = CGRectOffset(ViewSize, self.scrollView.bounds.size.width, 0);
//            UIImageView *ImgView = [[UIImageView alloc] initWithFrame:newViewSize];
//            NSString *FilePath = [NSString stringWithFormat:@"Page_%d.png", i];
//            [ImgView setImage:[UIImage imageNamed:FilePath]];
//            [self.scrollView addSubview:ImgView];
//        }
//    }
//
//
//
//    [self.view addSubview:self.scrollView];
//


}
//this is the method that will allow us to access the array of images from the downloader class.
-(void)gotIgRawData:(NSArray *)igRawData{

    for(NSDictionary *dict in igRawData){

        IGImage *igImage = [[IGImage alloc]initWithMediaDictionary:dict];
        [self.igImageObjectArray addObject:igImage];

    }
    
 }



@end
