//
//  brain.h
//  Conversions
//
//  Created by Oliver Hallbauer on 2016-06-11.
//  Copyright © 2016 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface brain : NSObject

// Area Conversion function declaration

-(float) areaConversion:(int)fromIndex to:(int) toIndex val:(float) value;

// Length Conversion function declaration

-(float) lengthConversion:(int)fromIndex to:(int) toIndex val:(float) value;

// Temperature Conversion function declaration

-(float) temperatureConversion:(int)fromIndex to:(int) toIndex val:(float) value;


@end
