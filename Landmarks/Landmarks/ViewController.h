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
{
    IBOutlet UILabel *labelTitle;
    IBOutlet UIView *dividerView1;
    IBOutlet UILabel *labelFavor;
    IBOutlet UISwitch *favoriteSwitch;
    IBOutlet UIView *dividerView2;
    IBOutlet UITableView *placeTable;
}

//@property (nonatomic) UILabel *labelTitle;
//@property (nonatomic) UIView *dividerView1;
//@property (nonatomic) UILabel *labelFavor;
//@property (nonatomic) UISwitch *favoriteSwitch;
//@property (nonatomic) UIView *dividerView2;
//@property (nonatomic) UITableView *placeTable;

@property (nonatomic) NSMutableArray *places;

- (void)initPlaces;

@end

