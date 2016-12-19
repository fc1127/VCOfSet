//
//  ViewController.m
//  手势
//
//  Created by 方超 on 16/8/21.
//  Copyright © 2016年 方超. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,weak)UIView * leftV;
@property(nonatomic,weak)UIView * rightV;
@property(nonatomic,weak)UIView * mainV;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUI];
    
    UIPanGestureRecognizer * pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.mainV addGestureRecognizer:pan];
    
    
}
-(void)pan:(UIPanGestureRecognizer* )pan{

//    获取偏移量
    CGPoint  transpamP=[pan translationInView:self.mainV];
    NSLog(@"====++=====%f",transpamP.x);
//    开始偏移
//    self.mainV.transform=CGAffineTransformTranslate(self.mainV.transform, transpamP.x,0);
    
    CGRect frame=self.mainV.frame;
    frame.origin.x+=transpamP.x;
    self.mainV.frame=frame;
//    复位
    [pan setTranslation:CGPointZero inView:self.mainV];
    
    
}

-(void)setUI{

    UIView * leftview=[[UIView alloc]initWithFrame:self.view.bounds];
    leftview.backgroundColor=[UIColor blueColor];
    self.leftV=leftview;
    [self.view addSubview:leftview];
    
    UIView * rightview=[[UIView alloc]initWithFrame:self.view.bounds];
    rightview.backgroundColor=[UIColor greenColor];
    self.rightV=rightview;
    [self.view addSubview:rightview];

    UIView * mainview=[[UIView alloc]initWithFrame:self.view.bounds];
    mainview.backgroundColor=[UIColor redColor];
    self.mainV=mainview;
    [self.view addSubview:mainview];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
