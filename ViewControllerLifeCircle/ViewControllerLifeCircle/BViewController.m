//
//  BViewController.m
//  ViewControllerLifeCircle
//
//  Created by 刘文晨 on 2024/6/27.
//

#import "BViewController.h"

@interface BViewController ()

@end

@implementation BViewController

#pragma mark - LifeCircle

- (void)loadView
{
    [super loadView];
    
    NSLog(@"BViewController: loadView");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:UIColor.whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [label setText:@"AViewController"];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 200, 50);
    button.center = self.view.center;
    [button setTitle:@"Back to AViewController" forState:UIControlStateNormal];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:label];
    [self.view addSubview:button];
    
    [NSLayoutConstraint activateConstraints:@[
        [label.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:100],
        [label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        
        [button.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:500],
        [button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor]
    ]];
    
    NSLog(@"BViewController: viewDidLoad");
}

- (void) viewWillAppear:(BOOL)animated
{
    NSLog(@"BViewController: viewWillAppear");
}
 
- (void) viewDidAppear:(BOOL)animated
{
    NSLog(@"BViewController: viewDidAppear");
}
 
- (void) viewWillDisappear:(BOOL)animated
{
    NSLog(@"BViewController: viewWillDisappear");
}
 
- (void) viewDidDisappear:(BOOL)animated
{
    NSLog(@"BViewController: viewDidDisappear");
}
 
- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    NSLog(@"BViewController: didReceiveMemoryWarning");
}
 
- (void) press:(UIButton*)sender
{
    NSLog(@"B->A");
    [self dismissViewControllerAnimated:NO completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
