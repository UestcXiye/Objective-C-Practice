//
//  PlaceCell.m
//  Landmarks
//
//  Created by 刘文晨 on 2024/6/13.
//

#import "PlaceCell.h"

@interface PlaceCell()

@end

@implementation PlaceCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self initSubView];
    }
    return self;
}

#pragma mark - 初始化视图

- (void)initSubView
{
    self.backgroundColor = [UIColor whiteColor];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGRect buttonFrame = CGRectMake(0, 0, 25, 25);
    // 创建并设置 UIButton 对象
    self.starButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.starButton setFrame:buttonFrame];
    // [self.starButton setTitle:@"" forState:UIControlStateNormal];
    [self.starButton setImage:[UIImage imageNamed:@"Image_star"] forState:UIControlStateNormal];
    [self.starButton setImage:[UIImage imageNamed:@"Image_starred"] forState:UIControlStateSelected];
//    self.accessibilityElements = YES;
//    self.accessibilityLabel =
    
    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator]; // 辅助指示视图为箭头
    self.starButton.translatesAutoresizingMaskIntoConstraints = NO;
    // 添加目标-动作对
    [self.starButton addTarget:self action:@selector(starButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:self.starButton];
    
    // 添加约束
    [NSLayoutConstraint activateConstraints:@[
        [self.imageView.widthAnchor constraintEqualToConstant:50],
        [self.imageView.heightAnchor constraintEqualToConstant:50],
        [self.imageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20],
        [self.imageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:5],
        [self.imageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-5],
        
        [self.textLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        [self.textLabel.leadingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:10],
        
        [self.starButton.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor], // 设置图片视图位于 Y 轴居中
        [self.starButton.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10],
        [self.starButton.widthAnchor constraintEqualToConstant:25],
        [self.starButton.heightAnchor constraintEqualToConstant:25]
    ]];
}

- (void)configureWithFavorite:(BOOL)favor
{
    self.favorite = favor;
    self.starButton.selected = self.favorite;
}

- (void)starButtonClicked:(UIButton *)sender
{
    sender.selected = !sender.selected;
    self.favorite = sender.selected;
    // 通知 placeCellDelegate
    if (self.placeCellDelegate && [self.placeCellDelegate respondsToSelector:@selector(updateFavorite:atPlaceCell:)])
    {
        [self.placeCellDelegate updateFavorite:self.favorite atPlaceCell:self];
    }
    // NSLog(@"tag: %ld", sender.tag);
    // PlaceCell *curCell = (PlaceCell *)[sender superview];
    // NSIndexPath *indexPath = [IndexPath indexPathForRow:sender.tag inSection:[tableView reloadRows];
}

//- (void)setPhoto:(UIImage *)img
//{
//    if (![img isEqual:photo])
//    {
//        photo = [img copy];
//        self.imageView.image = photo;
//    }
//}
//
//- (void)setLabelStr:(NSString *)lab
//{
//    if (![lab isEqualToString:labelStr])
//    {
//        labelStr = [lab copy];
//        self.textLabel.text = labelStr;
//    }
//}
@end
