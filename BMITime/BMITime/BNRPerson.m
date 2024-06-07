//
//  BNRPerson.m
//  BMITime
//
//  Created by 刘文晨 on 2024/6/7.
//

#import "BNRPerson.h"

@implementation BNRPerson

- (float)bodyMassIndex
{
   float h = [self heightInMeters];
   return [self weightInKilos] / (h * h);
}

@end
