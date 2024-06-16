//
//  DetailViewController.h
//  Landmarks
//
//  Created by 刘文晨 on 2024/6/14.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class Place;
@class DetailViewController;

NS_ASSUME_NONNULL_BEGIN

@protocol DetailViewControllerDelegate <NSObject>

@optional

- (void)detailViewController:(DetailViewController *)detailViewController goBackWithFavorite:(BOOL)favorite atIndex:(NSInteger)index;

@end

@interface DetailViewController : UIViewController

@property (nonatomic, weak) id <DetailViewControllerDelegate> detailViewControllerDelegate;

@property (nonatomic) UILabel *topLabel;
@property (nonatomic) MKMapView *mapView;
@property (nonatomic) UIImageView *pictureView;
@property (nonatomic) UILabel *sightLabel;
@property (nonatomic) UIButton *starButton;
@property (nonatomic) UILabel *scenicAreaLabel;
@property (nonatomic) UILabel *stateLabel;

@property (nonatomic) Place *place;
@property (nonatomic) BOOL favorite;
@property (nonatomic) NSInteger index;

@end

NS_ASSUME_NONNULL_END
