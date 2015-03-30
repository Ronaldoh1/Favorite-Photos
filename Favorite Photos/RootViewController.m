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
#import "CustomUICollectionViewCell.h"

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
    //register custom class for use. This needs to be done before collection view is loads and is displayed.
    [self setupCollectionView];

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
        [self.collectionView reloadData];

    }
    
 }
-(void)setupCollectionView{
    [self.collectionView registerClass:[CustomUICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [flowLayout setMinimumLineSpacing:0.0f];
    [self.collectionView setPagingEnabled:YES];
    [self.collectionView setCollectionViewLayout:flowLayout];
    [self.collectionView reloadData];
}

#pragma Marks UICollectionViewDelegates

//neeed to get the number of sectiosn. For this app we only need a single section to display photos.
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

//need to tell the collection view how many items it will display.
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    [self.collectionView reloadData];

    return self.igImageObjectArray.count;
}

//Feed the cells with data (images to display)

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomUICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

//    NSString *imageName = [self.dataArray objectAtIndex:indexPath.row];
//    [cell setImageName:imageName];

    NSLog(@"%@", [[self.igImageObjectArray objectAtIndex:0]imageToDisplay]);
     UIImage *image = [[self.igImageObjectArray objectAtIndex:indexPath.row]imageToDisplay];

//    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
//    [self.imageView setImage:image];

    cell.imageView.image = image;


  //  cell.imageView.image = image;
    //[cell updateCell:image];
   // [cell updateCell:[self.igImageObjectArray[indexPath.row]imageView].image];

    return cell;
}




@end
