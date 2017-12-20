//
//  iPhoneXResoultionMethod.m
//  Unity-iPhone
//
//  Created by hcjung on 2017. 11. 27..
//

#include "iPhoneXResoultionMethod.h"
#import <sys/utsname.h>

@implementation iPhoneXResolutionMethod

+(void)ChangeResolution:(UIWindow *)_uiwindow
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString* deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSLog(@"This Device Model Number : %@", deviceModel);
    if ([deviceModel isEqualToString:@"iPhone10,3"] || [deviceModel isEqualToString:@"iPhone10,6"]) {
        if (_uiwindow.bounds.size.width < _uiwindow.bounds.height) {
            CGRect tempframe = CGRectMake(0, 68, _uiwindow.bounds.size.width, _uiwindow.bounds.size.height-136);
            _uiwindow.rootViewController.view.frame = tempframe;
        } else {
            CGRect tempframe = CGRectMake(30, 0, _uiwindow.bounds.size.width - 60, _uiwindow.bounds.size.height - 30);
            _uiwindow.rootViewController.view.frame = tempframe;
        }
    }
}

@end

