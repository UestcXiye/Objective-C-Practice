//
//  ViewController.h
//  iTahDoodle
//
//  Created by 刘文晨 on 2024/6/10.
//

#import <UIKit/UIKit.h>

NSString *docPath(void);

@interface ViewController : UIViewController
    <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_taskTable; // 表格视图，显示所有任务
    UITextField *_taskField; // 输入框
    UIButton *_insertButton; // 插入任务按钮
}

@property (nonatomic) UITableView *taskTable; // 表格视图，显示所有任务
@property (nonatomic, retain) UITextField *taskField; // 输入框
@property (nonatomic) UIButton *insertButton; // 插入任务按钮

@property (nonatomic) NSMutableArray *tasks; // 任务数组

-(void)addTask:(id)sender;

@end

