//
//  ViewController.m
//  JSAndOC
//
//  Created by MR.KING on 16/5/18.
//  Copyright © 2016年 Tmp. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@property (nonatomic, strong) JSContext *jsContext;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.webView];
}



- (UIWebView *)webView {
    if (_webView == nil) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        _webView.scalesPageToFit = YES;
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"html"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
        _webView.delegate = self;
    }
    
    return _webView;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [webView stringByEvaluatingJavaScriptFromString:@""];
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    CustomModel * model = [[CustomModel alloc]init];
    self.jsContext[@"OCModel"] = model; // 绑定 相当于 给 JS 中的OCModel 赋值
    
    
    // 调用JS
    JSValue * value = [self.jsContext evaluateScript:@"back('hello world')"];
    NSLog(@"%@",[value toObject]);
}


@end
