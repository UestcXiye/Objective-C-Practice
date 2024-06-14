//
//  ViewController.m
//  Landmarks
//
//  Created by 刘文晨 on 2024/6/11.
//

#import "ViewController.h"
#import "Place.h"
#import "DetailViewController.h"

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
    [dividerView1 setBackgroundColor:UIColor.lightGrayColor];
    // 设置标签的字体
    UIFont *labelFavorFont = [UIFont systemFontOfSize:18];
    [labelFavor setFont:labelFavorFont];
    // 设置分隔线
    [dividerView2 setBackgroundColor:UIColor.lightGrayColor];
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
    
    [self initPlaces];
}

#pragma mark - 初始化 places 数组

- (void)initPlaces
{
    // 创建数组
    self.places = [NSMutableArray array];
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
        [self.places addObject:place];
    }
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
    cell.starButton.selected = [item favorite];
    
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
    DetailViewController *detailViewController = [DetailViewController new];
    [detailViewController setPlace:[self.places objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark - PlaceCellDelegate Method

- (void)updateFavorite:(BOOL)newFavorite atPlaceCell:(PlaceCell *)cell
{
    // 去 TableView 查该 cell 对应的 indexPath
    NSIndexPath *indexPath = [placeTable indexPathForCell:cell];
    NSLog(@"before starButton in row %ld clicked: %d", indexPath.row, [self.places[indexPath.row] favorite]);
    // 修改数据源对应的对象
    [self.places[indexPath.row] setFavorite:newFavorite];
    NSLog(@"after starButton in row %ld clicked: %d", indexPath.row, [self.places[indexPath.row] favorite]);
    // TableView 重新加载被修改了的那一行
    [placeTable reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
