//
//  ViewController.m
//  ButtonAndLabel
//
//  Created by 刘文晨 on 2024/6/12.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)setTitleLabel:(id)sender {
    [myTitleLabel setText:@"Hello World!"];
}
@end
