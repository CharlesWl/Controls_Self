//
//  PageViewChildVC.m
//  Controls_Self
//
//  Created by charles on 2016/10/27.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "PageViewChildVC.h"

@interface PageViewChildVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *pageViewTV;
@end

@implementation PageViewChildVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageViewTV.delegate = self;
    self.pageViewTV.dataSource = self;
    self.pageViewTV.contentInset = UIEdgeInsetsMake(200,0,0,0);
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *celler = @"celler";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:celler];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:celler];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"Model";
    cell.detailTextLabel.text = @"Model";
    return cell;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"滑动%f",scrollView.contentOffset.y);
    self.scrollBlock(200 + scrollView.contentOffset.y);

}



@end
