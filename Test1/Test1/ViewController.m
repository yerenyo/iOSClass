//
//  ViewController.m
//  Test1
//
//  Created by 郭栋 on 14-10-25.
//  Copyright (c) 2014年 郭栋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.testLable.text = @"test1";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    self.testLable.text = @"点击Save";
}

- (IBAction)open:(id)sender {
    self.testLable.text = @"点击Open";
}

- (IBAction)navSave:(id)sender {
    self.testLable.text = @"点击导航栏Save";
}

- (IBAction)navAdd:(id)sender {
    self.testLable.text = @"点击导航栏ADD";
}

- (IBAction)valueChanged:(id)sender {
    UISwitch *witchSwitch=(UISwitch *)sender;
    BOOL setting = witchSwitch.isOn;
    [self.leftSwitch setOn:setting animated:YES];
    [self.rightSwitch setOn:setting animated:YES];
    
}

- (IBAction)touchDown:(id)sender {
    if (_leftSwitch.hidden ==YES) {
        self.rightSwitch.hidden =NO;
        self.leftSwitch.hidden = NO;
    }else{
        self.leftSwitch.hidden =YES;
        self.rightSwitch.hidden=YES;
    }
}

- (IBAction)sliderValueChanged:(id)sender {
    UISlider * slider =(UISlider *)sender;
    int progressAsInt = (int)(slider.value +0.5f);
    NSString *newText = [[NSString alloc] initWithFormat:@"%d",progressAsInt];
    self.SliderValue.text=newText;
}


- (IBAction)testLoadHTMLString:(id)sender {
    NSString *htmlPath = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
    NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]bundlePath]];
    NSError *error =nil;
    
    
    NSString *html = [[NSString alloc]initWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:&error];
    
    if (error == nil) {
        [self.webView loadHTMLString:html baseURL:bundleUrl];
    }
    
    
    
}

- (IBAction)testLoadData:(id)sender {
    NSString *htmlPath = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
    NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]bundlePath]];
    NSError *error = nil;
    
    NSData *htmlData =[[NSData alloc]initWithContentsOfFile:htmlPath];

    if (error == nil) {
        [self.webView loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:bundleUrl];
    }
    
}


- (IBAction)testLoadRequest:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest * request =[NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    self.webView.delegate = self;

}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"%@",[webView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"]);
}

@end
