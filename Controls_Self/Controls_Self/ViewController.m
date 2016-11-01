//
//  ViewController.m
//  Controls_Self
//
//  Created by charles on 2016/10/26.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "ViewController.h"
#import "PageViewVC.h"

@interface Model : NSObject
@property (nonatomic, copy) NSString *titleModel;
@property (nonatomic, copy) NSString *detailModel;
@end

@implementation Model

@end


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *viewTV;
@property (nonatomic, strong) NSArray *models;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewTV.delegate = self;
    self.viewTV.dataSource = self;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentfier = @"cellIndentfier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentfier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndentfier];
    }
    Model *model = self.models[indexPath.row];
    cell.textLabel.text = model.titleModel;
    cell.detailTextLabel.text = model.detailModel;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PageViewVC *pageViewVC = [[PageViewVC alloc]init];
    [self presentViewController:pageViewVC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSArray *)models {
    if (!_models) {
        Model *model = [[Model alloc]init];
        model.titleModel = @"PageViewController";
        model.detailModel = @"PageViewVC";
        _models = @[model];
    }
    return _models;
}


@end
