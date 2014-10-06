//
//  LoginViewController.m
//  loopback-passport
//
//  Created by Yuumi Yoshida on 2014/10/06.
//  Copyright (c) 2014年 Yuumi Yoshida. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation LoginViewController


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:3000/login.html"]]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *url = [request.URL absoluteString];
    NSLog(@"+++ load: %@", url);
    
    if ([url containsString:@"close="]) {
        [self performSelector:@selector(closeViewController) withObject:nil afterDelay:0.3];
    }
    return YES;
}

- (void) closeViewController {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"--- OK");
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
