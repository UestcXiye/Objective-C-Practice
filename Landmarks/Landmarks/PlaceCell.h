//
//  PlaceCell.h
//  Landmarks
//
//  Created by 刘文晨 on 2024/6/13.
//

#import <UIKit/UIKit.h>
#import "PlaceCellDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlaceCell : UITableViewCell

@property (nonatomic) UIButton *starButton;

//@property (nonatomic, strong) UIImage *photo;
//@property (nonatomic, strong) NSString *labelStr;

@property (nonatomic, weak) id<PlaceCellDelegate> placeCellDelegate;
@property (nonatomic) BOOL favorite;

- (void)configureWithFavorite:(BOOL)favor;

@end

NS_ASSUME_NONNULL_END
