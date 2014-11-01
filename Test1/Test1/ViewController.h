//
//  ViewController.h
//  Test1
//
//  Created by 郭栋 on 14-10-25.
//  Copyright (c) 2014年 郭栋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *testLable;
//toolbar demo
- (IBAction)save:(id)sender;
- (IBAction)open:(id)sender;

//navgationbar demo
- (IBAction)navSave:(id)sender;
- (IBAction)navAdd:(id)sender;


@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)testLoadHTMLString:(id)sender;
- (IBAction)testLoadData:(id)sender;
- (IBAction)testLoadRequest:(id)sender;


@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;

- (IBAction)valueChanged:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *SliderValue;

- (IBAction)touchDown:(id)sender;

- (IBAction)sliderValueChanged:(id)sender;
@end

