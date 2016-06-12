//
//  brain.m
//  Conversions
//
//  Created by Oliver Hallbauer on 2016-06-11.
//  Copyright © 2016 admin. All rights reserved.
//

#import "brain.h"

@implementation brain

-(float) areaConversion:(int)fromIndex to:(int)toIndex val:(float)value
{
    switch (fromIndex) {
        case 0: // KM2
            if(toIndex == 1) {
                value*=1000000;
            } else if (toIndex == 2) {
                value*=10763910.417;
            }
            break;
        case 1: // M2
            if(toIndex == 0) {
                value/=1000000;
            } else if (toIndex == 2) {
                value*=10.763910417;
            }
            break;
        case 2:// feet
            if(toIndex == 0) {
                value*=0.00000009290304;
            } else if (toIndex == 1) {
                value= value * 0.092903;
            }
            break;
    }
    return value;
}


-(float) lengthConversion:(int)fromIndex to:(int)toIndex val:(float)value
{
    switch (fromIndex) {
        case 0: // meter
            if(toIndex == 1) {
                value/=1000;
            } else if (toIndex == 2) {
                value*=0.000621371;
            } else if (toIndex == 3) {
                value*=3.28084;
            }
            break;
        case 1: // KM
            if(toIndex == 0) {
                value*=1000;
            } else if (toIndex == 2) {
                value*=0.62137121212121;
            } else if (toIndex == 3) {
                value*=3280.8399999999887768;
            }
            break;
        case 2: // Mile
            if(toIndex == 0) {
                value*=1609.3440514990027168;
            } else if (toIndex == 1) {
                value*=1.6093440514990027257;
            } else if (toIndex == 3) {
                value*=5280.0001689599821475;
            }
            break;
        case 3: // Feet
            if(toIndex == 0) {
                value*=0.3048000097535989994;
            } else if (toIndex == 1) {
                value*=0.00030480000975359900633;
            } else if (toIndex == 2) {
                value*=0.00018939394545454483467;
            }
            break;
    }
    return value;
}
-(float) temperatureConversion:(int)fromIndex to:(int)toIndex val:(float)value
{
    switch (fromIndex) {
        case 0:
            if(toIndex == 1) {
                value= (value - 32) *1.8;
            } else if (toIndex == 2) {
                value= value + 273.15;
            }
            break;
        case 1:
            if(toIndex == 0) {
                value= (value * 1.8) + 32;
            } else if (toIndex == 2) {
                value= (value + 459.67 ) * (5/9)  ;
            }
            break;
        case 2:
            if(toIndex == 0) {
                value= value - 273.15;
            } else if (toIndex == 1) {
                value= value* (9/5) - 459.67;
            }
            break;
    }
    return value;
}
@end