//
//  MapViewController.m
//  Favorite Photos
//
//  Created by Ronald Hernandez on 3/28/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import "MapViewController.h"
#import "IGImage.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface MapViewController ()<MKAnnotation, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.mapView.showsUserLocation = true;


}




#pragma Mark MKMapDelegate Methods

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{

    MKPinAnnotationView *pinAnnotation = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:nil];

//    if ([annotation isEqual:self.bikeAnnotation]) {
//        pinAnnotation.image = [UIImage imageNamed:@"mobilemakers"];
//    }else if([annotation isEqual:mapView.userLocation]){
//
//        return nil;
//    }
//    pinAnnotation.image = [UIImage imageNamed:@"bikeImage"];
//
//    pinAnnotation.canShowCallout = true;
//    pinAnnotation.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];

    return pinAnnotation;
    
    
}


@end
