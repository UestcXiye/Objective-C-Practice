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
    
    // 设置应用标题的字体
    UIFont *labelTitleFont = [UIFont fontWithName:@"Helvetica-Bold" size:35];
    [labelTitle setFont:labelTitleFont];
    // 设置分隔线
    [dividerView1 setBackgroundColor:[[UIColor lightGrayColor] colorWithAlphaComponent:0.5f]];
    // 设置标签的字体
    UIFont *labelFavorFont = [UIFont systemFontOfSize:18];
    [labelFavor setFont:labelFavorFont];
    // 设置开关
    [favoriteSwitch setOn:NO];
    // 添加目标-动作对
    [favoriteSwitch addTarget:self action:@selector(favoriteSwitchValueChanged:) forControlEvents:UIControlEventValueChanged];
    // 设置分隔线
    [dividerView2 setBackgroundColor:[[UIColor lightGrayColor] colorWithAlphaComponent:0.5f]];
    // 设置 TableView
    // [placeTable setRowHeight:60];
    // [placeTable setSeparatorInset:UIEdgeInsetsMake(0, 10, 0, 0)];
    // [placeTable setLayoutMargins:UIEdgeInsetsMake(10, 10, 10, 10)];
    [placeTable setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [placeTable setSeparatorColor:UIColor.lightGrayColor];
    // 将当前对象设置为 UITableView 对象的 dataSource
    [placeTable setDataSource:self];
    // 设置 UITableViewDelegate
    placeTable.delegate = self;
    // 需要创建新的单元格时，告诉 UITableView 对象要实例化哪个类
    // [placeTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [placeTable registerClass:[PlaceCell class] forCellReuseIdentifier:@"PlaceCellIdentfier"];
    
    /* width: 393, height: 852 */
//    CGFloat viewFrameWidth = self.view.frame.size.width, viewFrameHeight = self.view.frame.size.height;
//    CGRect labelTitleFrame = CGRectMake(0, 0, 200, 80);
//    CGRect dividerViewFrame = CGRectMake(0, 0, viewFrameWidth - 20, 1);
//    CGRect labelFavorFrame = CGRectMake(0, 0, 150, 50);
//    CGRect favoriteSwitchFrame = CGRectMake(0, 0, 80, 50);
//    CGRect placeTableFrame = CGRectMake(0, 0, viewFrameWidth, 500);
//
//    // 创建并设置 labelTitle
//    self.labelTitle = [[UILabel alloc] initWithFrame:labelFavorFrame];
//    // 设置应用标题的字体
//    UIFont *labelTitleFont = [UIFont fontWithName:@"Helvetica-Bold" size:35];
//    [self.labelTitle setFont:labelTitleFont];
//    self.labelTitle.translatesAutoresizingMaskIntoConstraints = NO;
//
//    // 创建并设置 dividerView1
//    self.dividerView1 = [[UIView alloc] initWithFrame:dividerViewFrame];
//    [self.dividerView1 setBackgroundColor:UIColor.lightGrayColor];
//    self.dividerView1.translatesAutoresizingMaskIntoConstraints = NO;
//
//    // 创建并设置 labelFavor
//    self.labelFavor = [[UILabel alloc] initWithFrame:labelFavorFrame];
//    // 设置标签的字体
//    UIFont *labelFavorFont = [UIFont systemFontOfSize:18];
//    [self.labelFavor setFont:labelFavorFont];
//    self.labelFavor.translatesAutoresizingMaskIntoConstraints = NO;
//
//    // 创建并设置 favoriteSwitch
//    self.favoriteSwitch = [[UISwitch alloc] initWithFrame:favoriteSwitchFrame];
//    self.favoriteSwitch.translatesAutoresizingMaskIntoConstraints = NO;
//
//    // 创建并设置 dividerView2
//    self.dividerView2 = [[UIView alloc] initWithFrame:dividerViewFrame];
//    [self.dividerView2 setBackgroundColor:UIColor.lightGrayColor];
//    self.dividerView2.translatesAutoresizingMaskIntoConstraints = NO;
//
//    // 创建并设置 placeTable
//    self.placeTable = [[UITableView alloc] initWithFrame:placeTableFrame];
//    [self.placeTable setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
//    [self.placeTable setSeparatorColor:UIColor.lightGrayColor];
//    self.placeTable.translatesAutoresizingMaskIntoConstraints = NO;
//    // 将当前对象设置为 UITableView 对象的 dataSource
//    [self.placeTable setDataSource:self];
//    // 设置 UITableViewDelegate
//    self.placeTable.delegate = self;
//    // 需要创建新的单元格时，告诉 UITableView 对象要实例化哪个类
//    // [placeTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
//    [self.placeTable registerClass:[PlaceCell class] forCellReuseIdentifier:@"PlaceCellIdentfier"];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initPlaces];
    self.places = [NSMutableArray arrayWithArray:self.data];

//    [self.view addSubview:self.labelTitle];
//    [self.view addSubview:self.dividerView1];
//    [self.view addSubview:self.labelFavor];
//    [self.view addSubview:self.favoriteSwitch];
//    [self.view addSubview:self.dividerView2];
//    [self.view addSubview:self.placeTable];
    
//    /* 添加约束 */
//    [NSLayoutConstraint activateConstraints:@[
//        [self.labelTitle.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:95],
//        [self.labelTitle.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
//        [self.dividerView1.topAnchor constraintEqualToAnchor:self.labelTitle.bottomAnchor constant:10],
//        [self.dividerView1.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
//        [self.dividerView1.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0],
//        [self.labelFavor.topAnchor constraintEqualToAnchor:self.dividerView1.bottomAnchor constant:10],
//        [self.labelFavor.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
//        [self.favoriteSwitch.topAnchor constraintEqualToAnchor:self.dividerView1.bottomAnchor constant:10],
//        [self.favoriteSwitch.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
//        [self.dividerView2.topAnchor constraintEqualToAnchor:self.labelFavor.bottomAnchor constant:10],
//        [self.dividerView2.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
//        [self.dividerView2.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0],
//        [self.placeTable.topAnchor constraintEqualToAnchor:self.dividerView2.bottomAnchor constant:0],
//        [self.placeTable.widthAnchor constraintEqualToAnchor:self.view.widthAnchor]
//    ]];
}

#pragma mark - 初始化 places 数组

- (void)initPlaces
{
    // 创建数组
    self.data = [NSMutableArray array];
    // self.places = [NSMutableArray array];
    
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
        // Place *place = [[Place alloc] initWithSight:[placeInfo objectForKey:@"sight"] scenicArea:[placeInfo objectForKey:@"scenicArea"] state:[placeInfo objectForKey:@"state"] picture:[UIImage imageNamed:[placeInfo objectForKey:@"pictureUrl"]] favorite:[placeInfo objectForKey:@"favorite"] location:[[CLLocation alloc] initWithLatitude:[[placeInfo objectForKey:@"latitude"] doubleValue] longitude:[[placeInfo objectForKey:@"longitude"] doubleValue]]];
        // 插入数组
        [self.data addObject:place];
        // [self.places addObject:place];
    }
    // self.places = [NSMutableArray arrayWithArray:self.data];
}

- (IBAction)favoriteSwitchValueChanged:(UISwitch *)sender {
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
    [placeTable reloadData];
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
//    static BOOL nibsRegistered = NO;
//    if (!nibsRegistered)
//    {
//        UINib *nib = [UINib nibWithNibName:@"PlaceCell" bundle:nil];
//        [tableView registerNib:nib forCellReuseIdentifier:identifier];
//        nibsRegistered = YES;
//    }
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
    // 设置 PlaceCell 对象的 starButton 的 tag 为对应的行号
    // cell.starButton.tag = indexPath.row;
    // 添加目标-动作对
    // [cell.starButton addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    // cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // 返回设置好的 PlaceCell 对象
    return cell;
}
//#pragma mark - starButton click method
//
//- (void)btnClicked:(UIButton *)sender
//{
//    NSLog(@"before starButton in row %ld clicked: %d", sender.tag,  [self.places[sender.tag] favorite]);
//    // 修改按钮的状态，切换图片
//    sender.selected = !sender.selected;
//    // 修改数据源（根据当前按钮状态设置对应行号的 Place 对象的 favorite 属性）
//    [self.places[sender.tag] setFavorite:sender.selected];
//    NSLog(@"after starButton in row %ld clicked: %d", sender.tag, [self.places[sender.tag] favorite]);
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // 创建新的 UITableViewCell 对象
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//    // NSLog(@"image width: %f, image height: %f",cell.imageView.frame.size.width, cell.imageView.frame.size.height);
//    NSLog(@"cell width: %f, cell height: %f",cell.contentView.frame.size.width, cell.contentView.frame.size.height);
//
//    // 根据模型对象（places 数组）重新设置 UITableViewCell 对象
//    Place *item = [self.places objectAtIndex:indexPath.row];
//    cell.imageView.image = [item picture];
//    // NSLog(@"image width: %f, image height: %f",cell.image.size.width, cell.image.size.height);
      /* cell width: 320.0, cell height: 44.0 */
//    cell.textLabel.text = [item sight]; // 中间文字
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // 辅助指示视图为箭头
//    // 返回设置后的 UITableViewCell 对象
//    return cell;
//}

#pragma mark - TableView Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // NSLog(@"row %ld clicked", indexPath.row);
    // 初始化详情视图控制器
    DetailViewController *detailViewController = [DetailViewController new];
    [detailViewController setPlace:[self.places objectAtIndex:indexPath.row]];
    [detailViewController setIndex:indexPath.row];
    // 设置代理，并且遵守 DetailViewControllerDelegate
    detailViewController.detailViewControllerDelegate = self;
    // 设置返回按钮
    self.navigationItem.backBarButtonItem =
        [[UIBarButtonItem alloc] initWithTitle:@"Landmarks" style:UIBarButtonItemStylePlain target:nil action:nil];
    // 界面跳转
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark - PlaceCellDelegate Method

- (void)updateFavorite:(BOOL)newFavorite atPlaceCell:(PlaceCell *)cell
{
    // 去 TableView 查该 cell 对应的 indexPath
    NSIndexPath *indexPath = [placeTable indexPathForCell:cell];
    // NSIndexPath *indexPath = [self.placeTable indexPathForCell:cell];
    // NSLog(@"before starButton in row %ld clicked: %d", indexPath.row, [self.places[indexPath.row] favorite]);
    // 修改数据源对应的对象
    [self.places[indexPath.row] setFavorite:newFavorite];
    // NSLog(@"after starButton in row %ld clicked: %d", indexPath.row, [self.places[indexPath.row] favorite]);
    // TableView 重新加载被修改了的那一行
    [placeTable reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    // [self.placeTable reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

# pragma mark - DtailViewControllerDelegate Method

// 实现协议方法，获取值
- (void)detailViewController:(DetailViewController *)detailViewController goBackWithFavorite:(BOOL)favorite atIndex:(NSInteger)index
{
    
    // 修改数据源对应的对象
    [self.places[index] setFavorite:favorite];
    // TableView 重新加载被修改了的那一行
    [placeTable reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    // [self.placeTable reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}

@end
