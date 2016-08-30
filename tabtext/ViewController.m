//
//  ViewController.m
//  tabtext
//
//  Created by LNXD1 on 16/8/10.
//  Copyright © 2016年 LNXD1. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    UIImageView *_img;
    UIVisualEffectView *_effectview;
    CGFloat _oldOffset;
}
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.barTintColor = [UIColor brownColor];
  
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(rightBtnClick)];
    [self configUI];
}

-(void)rightBtnClick
{
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:0];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:1];
}

-(void)configUI
{
    _img = [[UIImageView alloc] initWithFrame:CGRectMake(0, -64, 375, 220)];
    _img.image = [UIImage imageNamed:@"0.jpg"];
    [_topView addSubview:_img];
    
    
//    _myTableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
//    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    _effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
//    _effectview.alpha = 0;
//    _effectview.frame = CGRectMake(0, 0, _img.frame.size.width, 200);
  //  [_img addSubview:_effectview];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = [NSString stringWithFormat:@"--- %ld",indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NextViewController * nVC = [[NextViewController alloc] init];
    [self.navigationController pushViewController:nVC animated:YES];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat a = scrollView.contentOffset.y;

   [self setNeedsStatusBarAppearanceUpdate];
    NSLog(@"%lf === ",scrollView.contentOffset.y);
    if ((a + 64) > 0) {
        [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:(a + 64) / 64.0];
    
    }
    else
    {
        [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:0];
       
    }
    if (scrollView.contentOffset.y <= -64) {
        a += 64;
        CGRect f = _img.frame;
        
        f.origin.y = a - 64;
        f.origin.x = a / 2;
        
        f.size.height =220 - a;
        f.size.width = 375 - a;
        _img.frame = f;
        
        
//        _effectview.alpha =  - scrollView.contentOffset.y / 100;
//        _effectview.frame = CGRectMake(0, 0, f.size.width, f.size.height);
    }
    
    NSLog(@"%lf ===  %lf",scrollView.contentOffset.y,a);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
