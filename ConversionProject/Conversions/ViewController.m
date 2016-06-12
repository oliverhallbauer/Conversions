//
//  ViewController.m
//  Conversions
//
//  Created by admin on 18/05/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "ViewController.h"
#import "brain.h"

@interface ViewController ()


@property(nonatomic) brain *convertObject;
@end

@implementation ViewController

@synthesize units,unitspicker,convert,number,labelresult,scales,areaunits,lengthunits,tempunits,selected;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Does any additional setup after loading the view, typically from a nib.
    
    // This creates an object of the brain instance
    _convertObject = [[brain alloc] init];
    
    // Populating the arrays
    selected = @[@"KM²",@"Meter²",@"Feet²"];
    scales = @[@"Area",@"Length",@"Temperature"];
    areaunits = @[@"KM²",@"Meter²",@"Feet²"];
    lengthunits = @[@"Meter",@"Kilometers",@"Mile",@"Feet"];
    tempunits = @[@"Celsius",@"Fahrenheit",@"Kelvin"];
    
    units.dataSource=self;
    units.delegate=self;
    unitspicker.dataSource=self;
    unitspicker.delegate=self;
    number.delegate=self;
    
}

- (BOOL) textFieldShouldReturn:(UITextField *)inputMeasurement{
    
    // Returns value function for UI text field
    
    [self.number becomeFirstResponder];
    [self.number resignFirstResponder];
    
    return false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    // This function sets the number of componenets as ONE
    if(pickerView == units) {
        return 1;
    }
    // This function sets the number of componenets as TWO
    if (pickerView == unitspicker) {
        return 2;
    }
    return 0 ;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    // This function returns the desired number of rows in the first picker view.
    if (pickerView == units) {
        return scales.count;
    }
    
    // This function returns the desired number of rows in the second picker view.
    if (pickerView == unitspicker) {
        return selected.count;
    }
    
    return  0;
    
}


- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    // return _scales[row];
    
    if (pickerView == units) {
        return [scales objectAtIndex:row];
    }
    if (pickerView == unitspicker) {
        return [selected objectAtIndex:row];
    }
    return  0;
}



- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (pickerView == units){
        switch (row) {
            case 0:
                selected = areaunits;
                return [unitspicker reloadAllComponents];
            case 1:
                selected = lengthunits;
                return [unitspicker reloadAllComponents];
                break;
            case 2:
                selected = tempunits;
                return [unitspicker reloadAllComponents];
                break;
            default:
                break;
        }
    }
    
    
    
    // The result label updates automatically as per values entered in the text field
    double inText = [ number.text doubleValue];
    if (inText == 0.000){
        self.labelresult.textColor = [UIColor redColor];
        self.labelresult.text = @"Enter a proper value!!";
    }
    else{
        
        double res = 0;
        if(row == 0){
            res = [_convertObject areaConversion:(int)[unitspicker selectedRowInComponent:0] to: (int)[unitspicker selectedRowInComponent:1] val: [number.text floatValue]];
            
        }
        else if(row == 1){
            res = [_convertObject lengthConversion:(int)[unitspicker selectedRowInComponent:0] to: (int)[unitspicker selectedRowInComponent:1] val: [number.text floatValue]];
            
        }
        else if(row == 2){
            res = [_convertObject temperatureConversion:(int)[unitspicker selectedRowInComponent:0] to: (int)[unitspicker selectedRowInComponent:1] val: [number.text floatValue]];
            
        }
        
        self.labelresult.text = [NSString stringWithFormat:@"%0.3f",res];
        
    }
}
@end