//
//  ViewController.m
//  KVO
//
//  Created by bbu on 2/27/15.
//  Copyright (c) 2015 bbu. All rights reserved.
//

#import "ViewController.h"
#import "StockData.h"


@interface ViewController ()
@property(nonatomic,strong) StockData *stockForKVO;
@property(nonatomic,strong) UILabel *myLabel;
@end

@implementation ViewController


- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.stockForKVO = [[StockData alloc] init];
    [self.stockForKVO setValue:@"searph" forKey:@"stockName"];
    [self.stockForKVO setValue:@"10.0" forKey:@"price"];
    [self.stockForKVO addObserver:self forKeyPath:@"price" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    
    self.myLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 30 )];
    self.myLabel.backgroundColor = [UIColor greenColor];
    self.myLabel.textColor = [UIColor redColor];
    self.myLabel.text = [self.stockForKVO valueForKey:@"price"];
    [self.view addSubview:self.myLabel];
    
    UIButton * b = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    b.frame = CGRectMake(0, 60, 100, 30);
    [b setTitle:@"Click Me" forState:UIControlStateNormal];
    b.backgroundColor = [UIColor redColor];
    [b addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    
    
}

-(void) buttonAction:(id)sender
{
    [self.stockForKVO setValue:@"200.0" forKey:@"price"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"price"])
    {
        self.myLabel.text = [self.stockForKVO valueForKey:@"price"];
    }
}

@end
