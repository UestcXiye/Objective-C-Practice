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

@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) UIImageView *pictureView;
@property (nonatomic, strong) UILabel *sightLabel;
@property (nonatomic, strong) UIButton *starButton;
@property (nonatomic, strong) UILabel *scenicAreaLabel;
@property (nonatomic, strong) UILabel *stateLabel;

@property (nonatomic, strong) Place *place;
@property (nonatomic) BOOL favorite;
@property (nonatomic) NSInteger index;

@end

NS_ASSUME_NONNULL_END
