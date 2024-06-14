//
//  DetailViewController.h
//  Landmarks
//
//  Created by 刘文晨 on 2024/6/14.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class Place;

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (nonatomic) MKMapView *mapView;
@property (nonatomic) UIImageView *pictureView;
@property (nonatomic) UILabel *sightLabel;
@property (nonatomic) UIButton *starButton;
@property (nonatomic) UILabel *scenicAreaLabel;
@property (nonatomic) UILabel *stateLabel;

@property (nonatomic) Place *place;

@end

NS_ASSUME_NONNULL_END
