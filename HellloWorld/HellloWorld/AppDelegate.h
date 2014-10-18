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


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]]autorelease];
    self.viewController = [[[ViewController alloc]initWithNibName:@"ViewControlle" bundle:nil]autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}




@end

