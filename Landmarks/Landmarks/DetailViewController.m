//
//  DetailViewController.m
//  Landmarks
//
//  Created by 刘文晨 on 2024/6/14.
//

#import "DetailViewController.h"
#import "Place.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize place;
@synthesize favorite;
@synthesize index;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /* width: 393, height: 852 */
    CGFloat viewFrameWidth = self.view.frame.size.width, viewFrameHeight = self.view.frame.size.height;
    // NSLog(@"%lf, %lf", viewFrameWidth, viewFrameHeight);
    CGRect topFrame = CGRectMake(0, 0, 100, 50);
    CGRect mapFrame = CGRectMake(0, 0, viewFrameWidth, 290);
    CGRect pictureFrame = CGRectMake(0, 0, 250, 250);
    CGRect sightFrame = CGRectMake(0, 0, 150, 80);
    CGRect starButtonFrame = CGRectMake(0, 0, 25, 25);
    CGRect scenicAreaFrame = CGRectMake(0, 0, 140, 20);
    CGRect stateFrame = CGRectMake(0, 0, 100, 20);
    
    // 创建并设置 topLabel
    self.topLabel = [[UILabel alloc] initWithFrame:topFrame];
    [self.topLabel setFont:[UIFont boldSystemFontOfSize:19]];
    [self.topLabel setText:[self.place sight]];
    [self.topLabel setTextAlignment:NSTextAlignmentCenter];
    self.topLabel.adjustsFontSizeToFitWidth = YES;
    self.topLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 创建并设置 mapView
    self.mapView = [[MKMapView alloc] initWithFrame:mapFrame];
    [self.mapView setMapType:MKMapTypeStandard];
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance([[self place] location].coordinate, 10000, 10000);
    [self.mapView setRegion:viewRegion];
    // self.mapView.contentMode = UIViewContentModeScaleAspectFit;
    self.mapView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 创建并设置 pictureView
    self.pictureView = [[UIImageView alloc] initWithFrame:pictureFrame];
    [self.pictureView setImage:[self.place picture]];
    self.pictureView.layer.cornerRadius = 125.0f;
    self.pictureView.clipsToBounds = NO;
    self.pictureView.layer.borderWidth = 4.0f;
    self.pictureView.layer.borderColor = [UIColor whiteColor].CGColor;
    // self.pictureView.contentMode = UIViewContentModeScaleAspectFit;
    self.pictureView.translatesAutoresizingMaskIntoConstraints = NO;
    // 在 pictureView 上直接设置阴影，会因为 masksToBounds = true 而被裁减掉
    self.pictureView.layer.masksToBounds = YES;
    // 在 pictureView 外套一层 shadowView
    UIView *shadowView = [[UIView alloc] initWithFrame:self.pictureView.frame];
    shadowView.layer.shadowColor = [UIColor grayColor].CGColor;
    shadowView.layer.shadowOffset = CGSizeMake(0, 0);
    shadowView.layer.shadowOpacity = 1;
    shadowView.layer.shadowRadius = 9.0;
    shadowView.layer.cornerRadius = 9.0;
    shadowView.clipsToBounds = NO;
    [shadowView addSubview:self.pictureView];
    
    // 创建并设置 sightLabel
    self.sightLabel = [[UILabel alloc] initWithFrame:sightFrame];
    [self.sightLabel setFont:[UIFont systemFontOfSize:28]];
    [self.sightLabel setText:[self.place sight]];
    // self.sightLabel.adjustsFontSizeToFitWidth = YES;
    self.sightLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 创建并设置 starButton
    self.starButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.starButton setFrame:starButtonFrame];
    // [self.starButton setTitle:@"" forState:UIControlStateNormal];
    [self.starButton setImage:[UIImage imageNamed:@"Image_star"] forState:UIControlStateNormal];
    [self.starButton setImage:[UIImage imageNamed:@"Image_starred"] forState:UIControlStateSelected];
    self.starButton.selected = [place favorite];
    // 添加目标-动作对
    [self.starButton addTarget:self action:@selector(starButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.starButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 创建并设置 scenicAreaLabel
    self.scenicAreaLabel = [[UILabel alloc] initWithFrame:scenicAreaFrame];
    [self.scenicAreaLabel setFont:[UIFont systemFontOfSize:16]];
    [self.scenicAreaLabel setText:[self.place scenicArea]];
    self.scenicAreaLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 创建并设置 stateLabel
    self.stateLabel = [[UILabel alloc] initWithFrame:stateFrame];
    [self.stateLabel setFont:[UIFont systemFontOfSize:16]];
    [self.stateLabel setText:[self.place state]];
    self.stateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.topLabel];
    [self.view addSubview:self.mapView];
    [self.view addSubview:shadowView];
    [self.view addSubview:self.sightLabel];
    [self.view addSubview:self.starButton];
    [self.view addSubview:self.scenicAreaLabel];
    [self.view addSubview:self.stateLabel];
    
    /* 添加约束 */
    // topLabel 的上边缘距离 view 的上边缘有 50px，且居中显示
    [NSLayoutConstraint activateConstraints:@[
        [self.topLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:50],
        [self.topLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor], // 设置视图位于 X 轴居中
        [self.topLabel.heightAnchor constraintEqualToConstant:50] // 设置视图的高度为 50 点
    ]];
    // mapView 的上边缘位于 topLabel 的下边缘
    NSLayoutConstraint *mapTopAttachToTopButtom = [NSLayoutConstraint constraintWithItem:self.mapView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [self.view addConstraint:mapTopAttachToTopButtom];
    [NSLayoutConstraint activateConstraints:@[
        [self.mapView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor], // 设置地图视图位于 X 轴居中
        // [self.mapView.topAnchor constraintEqualToAnchor:self.topLabel.bottomAnchor],
        // [self.mapView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        // [self.mapView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.mapView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
        [self.mapView.heightAnchor constraintEqualToConstant:290] // 设置地图视图的高度为 290px
    ]];
    // pictureView 的中心位于 mapView 的下边缘
    NSLayoutConstraint *pictureCenterYAttachToMapButtom = [NSLayoutConstraint constraintWithItem:self.pictureView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.mapView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [self.view addConstraint:pictureCenterYAttachToMapButtom];
    // pictureView 的宽高为 250px，且 X 轴居中
    [NSLayoutConstraint activateConstraints:@[
        [self.pictureView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor], // 设置图片视图位于 X 轴居中
        // [self.pictureView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor], // 设置图片视图位于 Y 轴居中
        [self.pictureView.widthAnchor constraintEqualToConstant:250], // 设置图片视图的宽度为 250px
        [self.pictureView.heightAnchor constraintEqualToConstant:250] // 设置图片视图的高度为 250px
    ]];
    // sightLabel 位于 pictureView 下方 30px 处，距离屏幕左边界 20px
    [NSLayoutConstraint activateConstraints:@[
        [self.sightLabel.topAnchor constraintEqualToAnchor:self.pictureView.bottomAnchor constant:30],
        [self.sightLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [self.sightLabel.heightAnchor constraintEqualToConstant:80]
    ]];
    // starButton 位于 sightLabel 右侧，距离 4px
    [NSLayoutConstraint activateConstraints:@[
        [self.starButton.leadingAnchor constraintEqualToAnchor:self.sightLabel.trailingAnchor constant:4],
        [self.starButton.topAnchor constraintEqualToAnchor:self.sightLabel.topAnchor],
        [self.starButton.bottomAnchor constraintEqualToAnchor:self.sightLabel.bottomAnchor],
        [self.starButton.widthAnchor constraintEqualToConstant:25],
        [self.starButton.heightAnchor constraintEqualToConstant:25]
    ]];
    // scenicAreaLabel 位于 sightLabel 下方，距离 15px
    [NSLayoutConstraint activateConstraints:@[
        [self.scenicAreaLabel.topAnchor constraintEqualToAnchor:self.sightLabel.bottomAnchor constant:15],
        [self.scenicAreaLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [self.scenicAreaLabel.heightAnchor constraintEqualToConstant:20]
    ]];
    // stateLabel 与 scenicAreaLabel 水平，其右边界距离屏幕右边界 20px
    [NSLayoutConstraint activateConstraints:@[
        [self.stateLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        [self.stateLabel.topAnchor constraintEqualToAnchor:self.scenicAreaLabel.topAnchor],
        [self.stateLabel.bottomAnchor constraintEqualToAnchor:self.scenicAreaLabel.bottomAnchor],
        [self.stateLabel.heightAnchor constraintEqualToConstant:20]
    ]];
}

- (void)starButtonClicked:(UIButton *)sender
{
    sender.selected = !sender.selected;
    // [place setFavorite:sender.selected];
    self.favorite = sender.selected;
    // 首先判断代理人是否存在并且是否遵守协议并且实现了协议方法
    if (_detailViewControllerDelegate && [_detailViewControllerDelegate respondsToSelector:@selector(detailViewController:goBackWithFavorite:atIndex:)])
    {
        // 如果满足判断条件，则让代理执行协议方法，此处让代理人执行协议方法，在代理人那个控制器中的协议方法会被执行
        [_detailViewControllerDelegate detailViewController:self goBackWithFavorite:self.favorite atIndex:self.index];
    }
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
