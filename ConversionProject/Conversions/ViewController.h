//
//  ViewController.h
//  Conversions
//
//  Created by admin on 18/05/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

// The main Picker.
@property (weak, nonatomic) IBOutlet UIPickerView *units;

// The units picker, responsible for conversions "FROM" and "TO"
@property (weak, nonatomic) IBOutlet UIPickerView *unitspicker;
@property (weak, nonatomic) IBOutlet UITextField *convert;

// Label for displaying results
@property (weak, nonatomic) IBOutlet UILabel *labelresult;

// Text field for entering conversion values
@property (weak, nonatomic) IBOutlet UITextField *number;

// An array stores the values of conversion
@property NSArray *scales;

// This array stores units for length
@property NSArray *lengthunits;

// This array stores the units for area
@property NSArray *areaunits;

// This array stores units for temperature
@property NSArray *tempunits;

// This array populates the "UNITPicker" according to the selection in the "MAINPICKER"
@property NSArray *selected;

@end


