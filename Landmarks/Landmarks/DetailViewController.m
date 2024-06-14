//
//  DetailViewController.m
//  Landmarks
//
//  Created by 刘文晨 on 2024/6/14.
//

#import "DetailViewController.h"
#import "Place.h"

@interface DetailViewController ()
{
    MKMapView *_mapView;
    UIImageView *_pictureView;
    UILabel *_sightLabel;
    UIButton *_starButton;
    UILabel *_scenicAreaLabel;
    UILabel *_stateLabel;

    Place *_place;
}
@end


@implementation DetailViewController

@synthesize mapView;
@synthesize  pictureView;
@synthesize sightLabel;
@synthesize starButton;
@synthesize scenicAreaLabel;
@synthesize stateLabel;

@synthesize place;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /* width: 393, height: 852 */
    CGFloat viewFrameWidth = self.view.frame.size.width;
    CGFloat viewFrameHeight = self.view.frame.size.height;
    NSLog(@"%lf, %lf", viewFrameWidth, viewFrameHeight);
    CGRect mapFrame = CGRectMake(0, 0, viewFrameWidth, 300);
    CGRect pictureFrame = CGRectMake(viewFrameWidth / 2 - 100, 200, 200, 200);
    CGRect sightFrame = CGRectMake(20, 420, 150, 25);
    CGRect starButtonFrame = CGRectMake(180, 420, 25, 25);
    CGRect scenicAreaFrame = CGRectMake(20, 455, 140, 20);
    CGRect stateFrame = CGRectMake(viewFrameWidth - 120, 455, 100, 20);
    
    // 创建并设置 mapView
    self.mapView = [[MKMapView alloc] initWithFrame:mapFrame];
    [self.mapView setMapType:MKMapTypeStandard];
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance([[self place] location].coordinate, 10000, 10000);
    [self.mapView setRegion:viewRegion];
    
    // 创建并设置 pictureView
    self.pictureView = [[UIImageView alloc] initWithFrame:pictureFrame];
    [self.pictureView setImage:[self.place picture]];
    
    // 创建并设置 sightLabel
    self.sightLabel = [[UILabel alloc] initWithFrame:sightFrame];
    [self.sightLabel setFont:[UIFont systemFontOfSize:24]];
    [self.sightLabel setText:[self.place sight]];
    
    // 创建并设置 starButton
    self.starButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.starButton setFrame:starButtonFrame];
    [self.starButton setTitle:@"" forState:UIControlStateNormal];
    [self.starButton setImage:[UIImage imageNamed:@"Image_star"] forState:UIControlStateNormal];
    [self.starButton setImage:[UIImage imageNamed:@"Image_starred"] forState:UIControlStateSelected];
    
    // 创建并设置 scenicAreaLabel
    self.scenicAreaLabel = [[UILabel alloc] initWithFrame:scenicAreaFrame];
    [self.scenicAreaLabel setFont:[UIFont systemFontOfSize:16]];
    [self.scenicAreaLabel setText:[self.place scenicArea]];
    
    // 创建并设置 stateLabel
    self.stateLabel = [[UILabel alloc] initWithFrame:stateFrame];
    [self.stateLabel setFont:[UIFont systemFontOfSize:16]];
    [self.stateLabel setText:[self.place state]];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.mapView];
    [self.view addSubview:self.pictureView];
    [self.view addSubview:self.sightLabel];
    [self.view addSubview:self.starButton];
    [self.view addSubview:self.scenicAreaLabel];
    [self.view addSubview:self.stateLabel];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
