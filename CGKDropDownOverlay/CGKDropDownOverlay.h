//
//  NPCDropDown.h
//  DropDownDemo
//
//  Created by gankac on 22/06/16.
//  Copyright © 2016 NPCompete. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol CGKDropDownDelegate <NSObject>

-(CGRect)boundaryForDropDown;
-(void) attachOverlay:(UIView *)overlay;

@end

@interface CGKDropDownOverlay : UIViewController

@property (strong, nonatomic) id<CGKDropDownDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *dropDownTable;
@property (weak, nonatomic) IBOutlet UIView *backgroudOverlayView;

-(void)showDropDown;
-(void)hideDropDown;

+(CGKDropDownOverlay *)dropDownOverlayWithDelegate:(id)delegate;

#pragma mark - AutoLayout
+(void) matchParent:(id)container withChild:(id)child;

@end
