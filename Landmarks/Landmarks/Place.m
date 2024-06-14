//
//  Place.m
//  Landmarks
//
//  Created by 刘文晨 on 2024/6/12.
//

#import "Place.h"

@implementation Place

- (instancetype)initWithSight:(NSString *)s
                    scenicArea:(NSString *)sa
                    state:(NSString *)st
                    picture:(UIImage *)pic
                    favorite:(BOOL)f
                    location:(CLLocation *)loc
{
    self = [super init];
    if (self)
    {
        _sight = [s copy];
        _scenicArea = [sa copy];
        _state = [st copy];
        _picture = [pic copy];
        _favorite = f;
        _location = [loc copy];
    }
    return self;
}

-(NSString *)description
{
    return [[NSString alloc] initWithFormat:@"sight = %@, scenicArea = %@, state = %@, picture = %@, favorite = %d, location = %@",[self sight], [self scenicArea], [self state], [self picture], [self favorite] , [self location]];
}

@end
