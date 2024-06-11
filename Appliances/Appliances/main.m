//
//  main.m
//  Appliances
//
//  Created by 刘文晨 on 2024/6/10.
//

#import <Foundation/Foundation.h>
#import "BNROwnedAppliance.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNROwnedAppliance *a = [[BNROwnedAppliance alloc] init];
        NSLog(@"%@", a);
        int v = [[a valueForKey:@"voltage"] intValue];
    }
    return 0;
}
