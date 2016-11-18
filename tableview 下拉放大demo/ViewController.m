//
//  ViewController.m
//  tableview 下拉放大demo
//
//  Created by lhx on 16/11/3.
//  Copyright © 2016年 liuhanxiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    UIImageView * headview;
    UITableView * TableV;
    NSMutableArray * datasource;
    UIView * touxiang;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createui];
    [self createdatasource];
}
-(void)createui{
    TableV= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    TableV.delegate=self;
    TableV.dataSource=self;
    
    headview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    
    headview.image=[UIImage imageNamed:@"Cyuri03.jpg"];
    touxiang = [[UIView alloc]initWithFrame:CGRectMake(10, headview.frame.size.height-60, 50, 50)];
    touxiang.backgroundColor = [UIColor redColor];
    
    [headview addSubview:touxiang];

    [TableV addSubview:headview];
    
    TableV.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width , headview.frame.size.height)];

    [self.view addSubview:TableV];
    
}
-(void)createdatasource{
    datasource = [[NSMutableArray alloc]init];
    for (int i = 0; i<10; i++) {
        [datasource addObject:[NSString stringWithFormat:@"%d",i]];
        
        
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return datasource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.frame.size.height/10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
 {
    CGFloat offsetY = scrollView.contentOffset.y;
     
    if (scrollView.contentOffset.y < 0) {
        headview.frame=CGRectMake(offsetY/2, offsetY, self.view.frame.size.width - offsetY, 300 - offsetY);
        touxiang.frame=CGRectMake(10-offsetY/2, headview.frame.size.height- 60, 50, 50);
    }
     NSLog(@"%f,%f",headview.frame.size.height,TableV.tableHeaderView.frame.size.height);
     NSLog(@"宽度的%f",self.view.frame.size.width - offsetY);
     
//     TableV.tableHeaderView=headview;

    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    cell.textLabel.text=datasource[indexPath.section];
    return cell;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
