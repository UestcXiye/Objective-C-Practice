//
//  ViewController.h
//  Landmarks
//
//  Created by 刘文晨 on 2024/6/11.
//

#import <UIKit/UIKit.h>
#import "PlaceCell.h"
#import "DetailViewController.h"

@interface ViewController : UIViewController
    <UITableViewDelegate, UITableViewDataSource, PlaceCellDelegate, DetailViewControllerDelegate>

@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UIView *dividerView1;
@property (nonatomic, strong) UILabel *labelFavor;
@property (nonatomic, strong) UISwitch *favoriteSwitch;
@property (nonatomic, strong) UIView *dividerView2;
@property (nonatomic, strong) UITableView *placeTable;

@property (nonatomic, strong) NSMutableArray *data; // 完整数据源
@property (nonatomic, strong) NSMutableArray *places; // 过滤数据源

- (void)initPlaces;

@end
