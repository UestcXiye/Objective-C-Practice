//
//  ViewController.h
//  Landmarks
//
//  Created by 刘文晨 on 2024/6/11.
//

#import <UIKit/UIKit.h>
#import "PlaceCell.h"

@interface ViewController : UIViewController
    <UITableViewDelegate, UITableViewDataSource, PlaceCellDelegate>
{
    IBOutlet UILabel *labelTitle;
    IBOutlet UIView *dividerView1;
    IBOutlet UILabel *labelFavor;
    IBOutlet UIView *dividerView2;
    IBOutlet UITableView *placeTable;
}

@property (nonatomic) NSMutableArray *places;

- (void)initPlaces;

@end

