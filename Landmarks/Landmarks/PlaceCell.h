//
//  PlaceCell.h
//  Landmarks
//
//  Created by 刘文晨 on 2024/6/13.
//

#import <UIKit/UIKit.h>

@class PlaceCell;

NS_ASSUME_NONNULL_BEGIN

@protocol PlaceCellDelegate <NSObject>

@optional

- (void)placeCell:(PlaceCell *)cell updateFavorite:(BOOL)favorite;

@end

@interface PlaceCell : UITableViewCell

@property (nonatomic, strong) UIButton *starButton;

@property (nonatomic, weak) id<PlaceCellDelegate> placeCellDelegate;
@property (nonatomic) BOOL favorite;

- (void)configureWithFavorite:(BOOL)favor;

@end

NS_ASSUME_NONNULL_END
