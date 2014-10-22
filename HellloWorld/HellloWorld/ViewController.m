//
//  ViewController.m
//  HellloWorld
//
//  Created by 郭栋 on 14-10-18.
//  Copyright (c) 2014年 郭栋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
//UILabel
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    1. 
//    UIScrollView..
//    2.
//    CALayer
//    UIView *view; view.layer
    ;
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [self.webView loadRequest:urlRequest];
    //html5
//    UINavigationController *a;
//    a.navigationItem.leftBarButtonItem
//    a.navigationItem.rightBarButtonItem
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;

}
-(BOOL) textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\N"]) {
        [textView resignFirstResponder];
        return NO;
    }

    return YES;
}


-(void) viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    [super viewWillAppear:animated];

}

-(void) viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    
    [super viewWillDisappear:animated];


}
-(void)keyboardDidShow:(NSNotification *)notif{
    NSLog(@"键盘打开");
}


-(void)keyboardDidHide:(NSNotification *)notif{
    NSLog(@"键盘关闭");
}
- (IBAction)silderValueChange:(id)sender {
    UISlider * slider = (UISlider *) sender;
    int progressAsInt = (int)(slider.value + 0.5f);
    NSString *newText = [[NSString alloc]initWithFormat:@"%d",progressAsInt ];
    self.SilderValue.text = newText;
    
}

- (IBAction)touchDown:(id)sender {
    if (_leftSwitch.hidden == YES) {
        self.rightSwitch.hidden = NO;
        self.leftSwitch.hidden = NO;
    }else{
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
    }

}

-(IBAction)testLoadHTMLString:(id)sender{
    NSString *htmlPath = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
    NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]bundlePath]];
    NSError *error = nil;
    
    NSString *html = [[NSString alloc]initWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:&error];
    
    if (error==nil) {
        [self.webView loadHTMLString:html baseURL:bundleUrl];
    }


}

-(IBAction)testLoadData:(id)sender{
    NSString *htmlPath = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
    NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]bundlePath]];
    NSError *error =nil;
    
    NSData *htmlData = [[NSData alloc]initWithContentsOfFile:htmlPath];
    if (error==nil) {
        [self.webView loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:bundleUrl];
    }
    
}
-(IBAction)testActionSheet:(id)sender{
    UIActionSheet * actionSheet=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"破坏性按钮" otherButtonTitles:@"Fackbook",@"新浪微博", nil];
    
    actionSheet.actionSheetStyle = UIActionSheetStyleAutomatic;
    [actionSheet showInView:self.view];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"buttonIndex = %i",buttonIndex);

}

-(IBAction)save:(id)sender{
    self.label.text = @"点击save";
}

-(IBAction)open:(id)sender{
    self.label.text = @"点击open";
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.scrollView.contentSize = CGSizeMake(320,600);

}

-(void)viewDidAppear:(BOOL)animated{
    [self.scrollView setContentOffset:CGPointMake(0,110) animated:YES];
    [super viewDidAppear:YES];

}


-(void)keyboardDidShow: (NSNotification *)notif{
    if (keyboardVisible) {
        return;
    }
    NSDictionary * info = [notif userInfo];
    NSValue * aValue = [info objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
    
    CGRect viewFram = self.scrollView.frame;
    viewFram.size.height -= (keyboardSize.height);
    self.scrollView.frame = viewFram;
    CGRect textFieldRect = [self.textField frame];
    [self.scrollView scrollRectToVisible:textFieldRect animated:YES];
    keyboardVisible = YES;
    
}

-(void) keyboardDidHide:(NSNotification *)notif{
    NSDictionary *info = [notif userInfo];
    NSValue * aValue = [info objectsForKeys:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
    CGRect viewFrame = self.scrollView.frame;
    viewFrame.size.height += keyboardSize.height;
    self.scrollView.frame = viewFrame;
    if (!keyboardVisible) {
        return;
    }
    keyboardVisible = NO;

}

-(IBAction)startToMove:(id)sender{
    if ([self.myActiviIndicatorView isAnimating]) {
        [self.myActiviIndicatorView stopAnimating];
    }else{
        [self.myActiviIndicatorView startAnimating];
    }
}

-(IBAction)downloadProgess:(id)sender{
    myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(download) userInfo:nil repeats:YES];

}


-(void)download{
    self.myProgressView.progress=self.myProgressView.progress+0.1;
    if (self.myProgressView.progress==1.0) {
        [myTimer invalidate];
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"download completed!" message:@"" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    }

}




@end


