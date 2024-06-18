//
//  ViewController.m
//  Landmarks
//
//  Created by 刘文晨 on 2024/6/11.
//

#import "ViewController.h"
#import "Place.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:UIColor.whiteColor];

    CGRect labelTitleFrame = CGRectMake(0, 0, 200, 80);
    CGRect dividerView1Frame = CGRectMake(0, 0, 300, 1);
    CGRect labelFavorFrame = CGRectMake(0, 0, 150, 50);
    CGRect favoriteSwitchFrame = CGRectMake(0, 0, 51, 31);
    CGRect dividerView2Frame = CGRectMake(0, 0, 300, 1);
    CGRect placeTableFrame = CGRectMake(0, 0, 400, 500);

    // 创建并设置 labelTitle
    self.labelTitle = [[UILabel alloc] initWithFrame:labelTitleFrame];
    // 设置应用标题的字体
    UIFont *labelTitleFont = [UIFont fontWithName:@"Helvetica-Bold" size:38];
    [self.labelTitle setFont:labelTitleFont];
    [self.labelTitle setText:@"Landmarks"];
    self.labelTitle.translatesAutoresizingMaskIntoConstraints = NO;

    // 创建并设置 dividerView1
    self.dividerView1 = [[UIView alloc] initWithFrame:dividerView1Frame];
    [self.dividerView1 setBackgroundColor:[[UIColor lightGrayColor] colorWithAlphaComponent:0.5]];
    self.dividerView1.translatesAutoresizingMaskIntoConstraints = NO;

    // 创建并设置 labelFavor
    self.labelFavor = [[UILabel alloc] initWithFrame:labelFavorFrame];
    // 设置标签的字体
    UIFont *labelFavorFont = [UIFont systemFontOfSize:18];
    [self.labelFavor setFont:labelFavorFont];
    [self.labelFavor setText:@"Favorites only"];
    self.labelFavor.translatesAutoresizingMaskIntoConstraints = NO;

    // 创建并设置 favoriteSwitch
    self.favoriteSwitch = [[UISwitch alloc] initWithFrame:favoriteSwitchFrame];
    self.favoriteSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    // 添加目标-动作对
    [self.favoriteSwitch addTarget:self action:@selector(favoriteSwitchValueChanged:) forControlEvents:UIControlEventValueChanged];

    // 创建并设置 dividerView2
    self.dividerView2 = [[UIView alloc] initWithFrame:dividerView2Frame];
    [self.dividerView2 setBackgroundColor:[[UIColor lightGrayColor] colorWithAlphaComponent:0.5]];
    self.dividerView2.translatesAutoresizingMaskIntoConstraints = NO;

    // 创建并设置 placeTable
    self.placeTable = [[UITableView alloc] initWithFrame:placeTableFrame];
    [self.placeTable setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.placeTable setSeparatorColor:UIColor.lightGrayColor];
    self.placeTable.translatesAutoresizingMaskIntoConstraints = NO;
    // 将当前对象设置为 UITableView 对象的 dataSource
    [self.placeTable setDataSource:self];
    // 设置 UITableViewDelegate
    self.placeTable.delegate = self;
    // 需要创建新的单元格时，告诉 UITableView 对象要实例化哪个类
    [self.placeTable registerClass:[PlaceCell class] forCellReuseIdentifier:@"PlaceCellIdentfier"];
    self.placeTable.backgroundColor = [UIColor whiteColor];
    
    [self initPlaces];
    self.places = [NSMutableArray arrayWithArray:self.data];

    [self.view addSubview:self.labelTitle];
    [self.view addSubview:self.dividerView1];
    [self.view addSubview:self.labelFavor];
    [self.view addSubview:self.favoriteSwitch];
    [self.view addSubview:self.dividerView2];
    [self.view addSubview:self.placeTable];
    
    /* 添加约束 */
    [NSLayoutConstraint activateConstraints:@[
        [self.labelTitle.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:95],
        [self.labelTitle.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
    ]];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.dividerView1.topAnchor constraintEqualToAnchor:self.labelTitle.bottomAnchor constant:10],
        [self.dividerView1.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [self.dividerView1.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0],
        [self.dividerView1.heightAnchor constraintEqualToConstant:1]
    ]];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.labelFavor.topAnchor constraintEqualToAnchor:self.dividerView1.bottomAnchor constant:0],
        [self.labelFavor.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [self.labelFavor.heightAnchor constraintEqualToConstant:50]
    ]];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.favoriteSwitch.centerYAnchor constraintEqualToAnchor:self.labelFavor.centerYAnchor],
        [self.favoriteSwitch.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
    ]];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.dividerView2.topAnchor constraintEqualToAnchor:self.labelFavor.bottomAnchor constant:0],
        [self.dividerView2.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [self.dividerView2.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0],
        [self.dividerView2.heightAnchor constraintEqualToConstant:1]
    ]];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.placeTable.topAnchor constraintEqualToAnchor:self.dividerView2.bottomAnchor constant:0],
        [self.placeTable.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
        [self.placeTable.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0]
    ]];
}

#pragma mark - 读 PlaceInfo.plist 初始化 data 数组

- (void)initPlaces
{
    // 创建数组
    self.data = [NSMutableArray array];
    
    // 读文件
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistUrl = [bundle URLForResource:@"PlaceInfo" withExtension:@"plist"];
    NSDictionary *placesInfoDic = [NSDictionary dictionaryWithContentsOfURL:plistUrl];
    // 遍历
    for (int i = 0; i< [placesInfoDic count]; i++)
    {
        NSString *key = [[NSString alloc] initWithFormat:@"%i", i];
        NSDictionary *placeInfo = [placesInfoDic objectForKey:key];
        // 初始化对象
        Place *place = [Place alloc];
        [place setSight:[placeInfo objectForKey:@"sight"]];
        [place setScenicArea:[placeInfo objectForKey:@"scenicArea"]];
        [place setState:[placeInfo objectForKey:@"state"]];
        [place setPicture:[UIImage imageNamed:[placeInfo objectForKey:@"pictureUrl"]]];
        // [place setFavorite:[placeInfo valueForKey:@"favorite"]]; // wrong
        [place setFavorite:[(NSNumber *)[placeInfo objectForKey:@"favorite"] boolValue]];
        // NSLog(@"placeInfo favorite: %@", [placeInfo objectForKey:@"favorite"]);
        [place setLocation:[[CLLocation alloc] initWithLatitude:[[placeInfo objectForKey:@"latitude"] doubleValue] longitude:[[placeInfo objectForKey:@"longitude"] doubleValue]]];
        NSLog(@"place inserted: <%@>", place);
        // 插入数组
        [self.data addObject:place];
    }
}

- (void)favoriteSwitchValueChanged:(UISwitch *)sender {
    if ([sender isOn])
    {
        [self.places removeAllObjects];
        for (Place *p in self.data)
        {
            if ([p favorite])
            {
                [self.places addObject:p];
            }
        }
    }
    else
    {
        self.places = [NSMutableArray arrayWithArray:self.data];
    }
    [self.placeTable reloadData];
}

#pragma mark - TableView Data Source Methods

// 根据指定的表格段索引给出相应表格段所包含的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 只有一个表格段，所以直接返回 places 数组的对象个数
    return [self.places count];
}
// 根据指定的表格段索引和行索引给出相应的 UITableViewCell 对象
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 此方法的调用十分频繁，cell 的标示声明为静态变量有利于性能优化
    static NSString *placeCellIdentfier = @"PlaceCellIdentfier";
    // 首先从可重用队列里弹出一个 cell
    PlaceCell *cell = [tableView dequeueReusableCellWithIdentifier:placeCellIdentfier];
    if (cell == nil) // 没找到
    {
        // 创建新的 PlaceCell 实例
        cell = [[PlaceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:placeCellIdentfier];
    }
    // 根据模型对象（places 数组）重新设置 PlaceCell 对象
    Place *item = [self.places objectAtIndex:indexPath.row];
    cell.textLabel.text = [item sight];
    cell.imageView.image = [item picture];
    
    // 设置 PlaceCellDelegate
    cell.placeCellDelegate = self;
    [cell configureWithFavorite:[item favorite]];
    return cell;
}

#pragma mark - TableView Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 初始化详情视图控制器
    DetailViewController *detailViewController = [DetailViewController new];
    [detailViewController setPlace:[self.places objectAtIndex:indexPath.row]];
    [detailViewController setIndex:indexPath.row];
    // 设置代理，并且遵守 DetailViewControllerDelegate
    detailViewController.detailViewControllerDelegate = self;
    // 设置返回按钮
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Landmarks" style:UIBarButtonItemStylePlain target:nil action:nil];
    // 界面跳转
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark - PlaceCellDelegate Method

- (void)placeCell:(PlaceCell *)cell updateFavorite:(BOOL)favorite
{
    // NSLog(@"before starButton in row %ld clicked: %d", indexPath.row, [self.places[indexPath.row] favorite]);
    // 去 TableView 查该 cell 对应的 indexPath
    NSIndexPath *indexPath = [self.placeTable indexPathForCell:cell];
    // 修改数据源对应的对象
    [self.places[indexPath.row] setFavorite:favorite];
    // NSLog(@"after starButton in row %ld clicked: %d", indexPath.row, [self.places[indexPath.row] favorite]);
    // TableView 重新加载被修改了的那一行
    [self.placeTable reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

# pragma mark - DtailViewControllerDelegate Method

// 实现协议方法，获取值
- (void)detailViewController:(DetailViewController *)detailViewController goBackWithFavorite:(BOOL)favorite atIndex:(NSInteger)index
{
    // 修改数据源对应的对象
    [self.places[index] setFavorite:favorite];
    // TableView 重新加载被修改了的那一行
    [self.placeTable reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}

@end
