//
//  Place.h
//  Landmarks
//
//  Created by 刘文晨 on 2024/6/12.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Place : NSObject

@property (nonatomic) NSString *sight; // 景点
@property (nonatomic) NSString *scenicArea; // 景区
@property (nonatomic) NSString *state; // 所在州
@property (nonatomic) UIImage *picture; // 照片
@property (nonatomic) BOOL favorite; // 收藏
@property (nonatomic) CLLocation* location; // 经纬度

- (instancetype)initWithSight:(NSString *)s
                    scenicArea:(NSString *)sa
                    state:(NSString *)st
                    picture:(UIImage *)pic
                    favorite:(BOOL)f
                    location:(CLLocation *)loc;

@end

NS_ASSUME_NONNULL_END
