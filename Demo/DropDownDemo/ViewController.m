//
//  ViewController.m
//  DropDownDemo
//
//  Created by gankac on 22/06/16.
//  Copyright © 2016 NPCompete. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CGKDropDownOverlay *dropDownOverlay;
    NSIndexPath *selectedIndexPath;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dropDownOverlay = [CGKDropDownOverlay dropDownOverlayWithDelegate:self];
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"cell_id";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell_id"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row %d",(int)indexPath.row+1];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *text = [NSString stringWithFormat:@"Row %d",(int)indexPath.row+1];
    _textField.text = text;
    [dropDownOverlay hideDropDown];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [dropDownOverlay showDropDown];
    return NO;
}


#pragma mark - CGKDropDown Delegate

-(CGRect)boundaryForDropDown{
    
    CGRect sourceRect = _textField.frame;
    
    CGFloat xPadding = 0;
    CGFloat yPadding = 10;
    CGFloat x = sourceRect.origin.x + xPadding;
    CGFloat y = sourceRect.origin.y + sourceRect.size.height + yPadding;
    CGFloat width = sourceRect.size.width;
    CGFloat height = 300;
    
    return CGRectMake(x,y,width,height);
}

-(void)attachOverlay:(UIView *)overlay{
    [self.view addSubview:overlay];
    [CGKDropDownOverlay matchParent:self.view withChild:overlay];
}

@end
