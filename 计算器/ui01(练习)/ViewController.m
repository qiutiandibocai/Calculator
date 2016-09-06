//
//  ViewController.m
//  ui01(练习)
//
//  Created by Ibokan2 on 16/5/23.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
    double number1;
    double number2;
    NSString *operation;
    NSRange range;
}
@property (weak, nonatomic) IBOutlet UILabel *Label;
@property BOOL isOperation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"视图加载完成时候调用");
   
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"视图将要出现");
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"视图已经出现");
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"视图将要消失");
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"视图已经消失");
}
//-(void)didReceiveMemoryWarning{
//    [super didReceiveMemoryWarning];
//    NSLog(@"内存警告,程序将要推出");
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)percent:(UIButton *)sender {
        self.Label.text =[@"" stringByAppendingFormat:@"%f",[self.Label.text doubleValue]/100];
}
- (IBAction)point:(UIButton *)sender {
    if (_isOperation) {
        range = [self.Label.text rangeOfString:@"."];
        if (range.location ==NSNotFound) {
            self.Label.text = [self.Label.text stringByAppendingString:sender.titleLabel.text];
        }
    }else{
        self.Label.text = @"0.";
        self.isOperation = YES;
    }
}
- (IBAction)two:(UIButton *)sender {
    self.Label.text = [@"" stringByAppendingFormat:@"%f",[self.Label.text doubleValue]*(-1)];
}
- (IBAction)numberAction:(UIButton *)sender {
    if (self.isOperation) {
        self.Label.text = [self.Label.text stringByAppendingString:sender.titleLabel.text];
    }else{
        self.Label.text =sender.titleLabel.text;
        self.isOperation = YES;
    }
}
- (IBAction)operation:(UIButton *)sender {
        number1  = [self.Label.text doubleValue];
        operation = sender.titleLabel.text;
        self.isOperation = NO;
  NSLog(@"number1=%f,operation=%@",number1,operation);
}
- (IBAction)equal:(UIButton *)sender {
    
   number2 = [self.Label.text doubleValue];
    NSLog(@"number2 = %f",number2);
    if ([operation isEqualToString:@"+"]) {
        self.Label.text = [NSString stringWithFormat:@"%f",number1 + number2];
        number1 = [self.Label.text doubleValue];
        self.isOperation = NO;
    }else if ([operation isEqualToString:@"-"]){
        self.Label.text = [NSString stringWithFormat:@"%f",number1 - number2];
         number1 = [self.Label.text doubleValue];
       self.isOperation = NO;
    }else if ([operation isEqualToString:@"*"]){
        self.Label.text = [NSString stringWithFormat:@"%f",number1 * number2];
         number1 = [self.Label.text doubleValue];
        self.isOperation = NO;
    }else if ([operation isEqualToString:@"/"]){
       self.Label.text = [NSString stringWithFormat:@"%f",number1 / number2];
         number1 = [self.Label.text doubleValue];
       self.isOperation = NO;
    }
}
- (IBAction)clear:(UIButton *)sender {
    self.Label.text = @"0";
    self.isOperation = NO;
    operation = @"0";
    number1 = 0;
}
@end
