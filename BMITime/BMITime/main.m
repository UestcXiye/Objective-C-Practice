//
//  main.m
//  BMITime
//
//  Created by 刘文晨 on 2024/6/7.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"
#import "BNRAsset.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 创建一数组，用来包含多个 BNREmployee 对象
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        for (int i = 0; i < 10; i++)
        {
            // 创建 BNREmployee 实例
            BNREmployee *mikey = [[BNREmployee alloc] init];
            // 为实例变量赋值
            mikey.weightInKilos = 90 + i;
            mikey.heightInMeters = 1.8 - i/10.0;
            mikey.employeeID = i;
            // 将新创建的 BNREmployee 实例加入数组
            [employees addObject:mikey];
        }
        
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        
        // 创建 10 个 BNRAsset 对象
        for (int i = 0; i < 10; i++)
        {
            // 创建一个 BNRAsset 对象
            BNRAsset *asset = [[BNRAsset alloc] init];
            // 为 BNRAsset 对象设置合适的标签
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            asset.label = currentLabel;
            asset.resaleValue = 350 + i * 17;
            
            NSUInteger randomIndex = random() % [employees count];
            BNREmployee *randomEmployee = [employees objectAtIndex:randomIndex];
            [randomEmployee addAsset:asset];
            
            [allAssets addObject:asset];
        }
        
        NSLog (@"Employees: %@", employees);
        NSLog(@"Giving up ownership of one employee");
        [employees removeObjectAtIndex:5];
        NSLog(@"allAsserts: %@", allAssets);
        NSLog(@"Giving up ownership of arrays");
            
        employees = nil;
        allAssets = nil;
    }
    return 0;
}
