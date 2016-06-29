//
//  NPCDropDown.m
//  DropDownDemo
//
//  Created by gankac on 22/06/16.
//  Copyright © 2016 NPCompete. All rights reserved.
//

#import "CGKDropDownOverlay.h"

@interface CGKDropDownOverlay ()

@end

@implementation CGKDropDownOverlay


#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideDropDown)];
    [self.backgroudOverlayView addGestureRecognizer:tap];
    
    _dropDownTable.layer.borderColor = [UIColor darkGrayColor].CGColor;
    _dropDownTable.layer.borderWidth = 2.0;
    _dropDownTable.layer.cornerRadius = 4;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Init

+(CGKDropDownOverlay *)dropDownOverlayWithDelegate:(id)delegate{
    
    
    if([delegate respondsToSelector:@selector(attachOverlay:)]){
        CGKDropDownOverlay *dd = [[CGKDropDownOverlay alloc] init];
        dd.delegate = delegate;
        [dd didMoveToParentViewController:delegate];
        [delegate attachOverlay:dd.view];
        dd.view.hidden = YES;
        return dd;
    }
    return nil;
    
}

-(void)showDropDown{
    self.view.hidden = NO;
    [self prepareTable];
    _dropDownTable.hidden = NO;
}

-(void)hideDropDown{
    self.view.hidden = YES;
}

-(void)prepareTable{
    
    _dropDownTable.frame = [_delegate boundaryForDropDown];
    _dropDownTable.delegate = (id)_delegate;
    _dropDownTable.dataSource = (id)_delegate;
    
}

#pragma mark - AutoLayout

+(void) matchParent:(id)container withChild:(id)child{
    
    CGRect parentFrame = ((UIView *)container).frame;
    [(UIView *)child setFrame:CGRectMake(0, 0, parentFrame.size.width, parentFrame.size.height)];
    
    [ child setAutoresizingMask:( UIViewAutoresizingFlexibleWidth |
                                 UIViewAutoresizingFlexibleHeight )];
    [ container setAutoresizesSubviews:YES ];
    
}


@end
