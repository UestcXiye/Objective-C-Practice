//
//  ViewController.m
//  iTahDoodle
//
//  Created by 刘文晨 on 2024/6/10.
//

#import "ViewController.h"

@interface ViewController ()

@end

// 辅助函数，返回保存用户任务数据的文件路径
NSString *docPath(void)
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [pathList[0] stringByAppendingPathComponent:@"data.td"];
}

@implementation ViewController

@synthesize taskTable = _taskTable;
@synthesize taskField = _taskField;
@synthesize insertButton = _insertButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tasks = [NSMutableArray array];
    
    // 设置 3 个对象的 frame 属性
    // NSLog(@"%lf, %lf", self.view.frame.size.width, self.view.frame.size.height);
    /* width: 393, height: 852 */
    CGRect tableFrame = CGRectMake(0, 115, self.view.frame.size.width, self.view.frame.size.height - 130);
    CGRect fieldFrame = CGRectMake(20, 80, 280, 30);
    CGRect buttonFrame = CGRectMake(310, 80, 70, 30);
    
    // 创建并设置 UITableView 对象
    self.taskTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    self.taskTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 将当前对象设置为 UITableView 对象的 dataSource
    self.taskTable.dataSource = self;
    // 需要创建新的单元格时，告诉 UITableView 对象要实例化哪个类
    [self.taskTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    // 创建并设置 UITextField 对象
    self.taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    self.taskField.borderStyle = UITextBorderStyleRoundedRect; // 圆角
    self.taskField.placeholder = @"Type a task, tap Insert";
    self.taskField.delegate = self;
    
    // 创建并设置 UIButton 对象
    self.insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect]; // 圆角
    self.insertButton.frame = buttonFrame;
    // 为按钮设置标题
    [self.insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    // 设置目标-动作对
    [self.insertButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    
    // 将 3 个 UI 对象加入 UIWindow 实例
    [self.view addSubview:self.taskTable];
    [self.view addSubview:self.taskField];
    [self.view addSubview:self.insertButton];
}

#pragma mark - 应用委托对象的回调方法

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if (plist)
    {
        NSLog(@"Loading data...");
        self.tasks = [plist mutableCopy];
    }
    else
    {
        self.tasks = [NSMutableArray array];
    }
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"Saving data...");
    // 将任务数组保存至文件
    [self.tasks writeToFile:docPath() atomically:YES];
}

#pragma mark - Actions

-(void)addTask:(id)sender
{
    NSString *text = [self.taskField text];
    if ([text length] == 0)
        return;
    NSLog(@"Task entered: %@", text);
    [self.tasks addObject:text];
    [self.taskTable reloadData];
    [self.taskField setText:@""]; // 清空文本
    [self.taskField resignFirstResponder]; // 关闭键盘
}

#pragma mark - 管理表格视图

// 根据指定的表格段索引给出相应表格段所包含的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 只有一个表格段，所以直接返回任务数组的对象个数
    return [self.tasks count];
}
// 根据指定的表格段索引和行索引给出相应的 UITableViewCell 对象
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建新的 UITableViewCell 对象
    UITableViewCell *c = [self.taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    // 根据模型对象（tasks 数组）重新设置 UITableViewCell 对象
    NSString *item = [self.tasks objectAtIndex:indexPath.row];
    c.textLabel.text = item;
    // 返回设置后的 UITableViewCell 对象
    return c;
}

@end
