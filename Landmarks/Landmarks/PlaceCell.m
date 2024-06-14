//
//  PlaceCell.m
//  Landmarks
//
//  Created by 刘文晨 on 2024/6/13.
//

#import "PlaceCell.h"

@interface PlaceCell()
{
    UIButton *_starButton;
}
@end

@implementation PlaceCell

@synthesize starButton;

//@synthesize photo;
//@synthesize labelStr;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self initSubView];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.y += 10;
    frame.size.height -= 10;
    [super setFrame:frame];
}

#pragma mark - 初始化视图

- (void)initSubView
{
    CGRect buttonFrame = CGRectMake(320, 12, 25, 25);
    // 创建并设置 UIButton 对象
    self.starButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.starButton setFrame:buttonFrame];
    [self.starButton setTitle:@"" forState:UIControlStateNormal];
    [self.starButton setImage:[UIImage imageNamed:@"Image_star"] forState:UIControlStateNormal];
    [self.starButton setImage:[UIImage imageNamed:@"Image_starred"] forState:UIControlStateSelected];
    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator]; // 辅助指示视图为箭头
    // 添加目标-动作对
    [self.starButton addTarget:self action:@selector(starButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:self.starButton];
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
    [self.placeCellDelegate updateFavorite:self.favorite atPlaceCell:self];
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
