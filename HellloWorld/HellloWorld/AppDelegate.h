//
//  AppDelegate.h
//  HellloWorld
//
//  Created by 郭栋 on 14-10-18.
//  Copyright (c) 2014年 郭栋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

int main(int argc,char * argv[]){
    @autoreleasepool{
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    
    }
}

@end

