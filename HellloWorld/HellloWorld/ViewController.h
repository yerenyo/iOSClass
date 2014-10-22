//
//  ViewController.h
//  HellloWorld
//
//  Created by 郭栋 on 14-10-18.
//  Copyright (c) 2014年 郭栋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@interface ViewController : UIViewController<UIWebViewDelegate>

-(IBAction)testLoadHTMLString:(id)sender;
-(IBAction)testLoadData:(id)sender;
-(IBAction)testLoadRequest:(id)sender;



@interface ViewController : UIViewController <UialertViewDelegate,UIActionSheetDelegate>

-(IBAction)testAlertView:(id)sender;
-(IBAction)testActionSheet:(id)sender;

@property (weak ,nonatomic)IBOutlet UILabel * label;
-(IBAction)save:(id)sender;
-(IBAction)open:(id)sender;



@property (weak,nonatomic)IBOutlet UIScrollView *scrollView;

@interface ViewController : UIViewController <UITextFieldDelegate>{
    BOOL keyboardVisible;
}

@property (weak, nonatomic)IBOutlet UITextField *textField;


@property (weak,nonatomic) IBOutlet UIActivityIndicatorView * myActiviIndicatorView;

-(IBAction)startToMove:(id)sender;

@interface ViewController : UIViewController{
    NSTimer * myTimer;
}

@property (nonatomic,strong) NSTimer *myTimer;
@property (weak,nonatomic)IBOutlet UIProgressView * myProgressView;
-(IBAction)downloadProgess:(id)sender;





@end

