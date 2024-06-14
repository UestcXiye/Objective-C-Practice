//
//  PlaceCellDelegate.h
//  Landmarks
//
//  Created by 刘文晨 on 2024/6/14.
//

#import <Foundation/Foundation.h>

@class PlaceCell;

NS_ASSUME_NONNULL_BEGIN

@protocol PlaceCellDelegate <NSObject>

- (void)updateFavorite:(BOOL)newFavorite atPlaceCell:(PlaceCell *)cell;

@end

NS_ASSUME_NONNULL_END
