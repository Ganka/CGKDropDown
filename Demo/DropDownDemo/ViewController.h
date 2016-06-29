//
//  ViewController.h
//  DropDownDemo
//
//  Created by gankac on 22/06/16.
//  Copyright © 2016 NPCompete. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGKDropDownOverlay.h"

@interface ViewController : UIViewController <CGKDropDownDelegate, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

