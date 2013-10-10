/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

//
//  MainViewController.h
//  WSO2Con
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    // Set the main view to utilize the entire application frame space of the device.
    // Change this to suit your view's UI footprint needs in your application.

    UIView* rootView = [[[[UIApplication sharedApplication] keyWindow] rootViewController] view];
    CGRect webViewFrame = [[[rootView subviews] objectAtIndex:0] frame];  // first subview is the UIWebView

    if (CGRectEqualToRect(webViewFrame, CGRectZero)) { // UIWebView is sized according to its parent, here it hasn't been sized yet
        self.view.frame = [[UIScreen mainScreen] applicationFrame]; // size UIWebView's parent according to application frame, which will in turn resize the UIWebView
        self.twitterView.frame = self.view.frame;
        CGRect theFrame = [self.twitterView frame];
        theFrame.origin.y = 0.0;
        self.twitterView.frame = theFrame;
    }

    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  //  UIImage *navBar = [UIImage imageNamed:@"www/style/images/header-logo.png"];
   // [self.titleBar setBackgroundImage:navBar forBarMetrics:UIBarMetricsDefault];
    
    [self.titleBar setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
    
    //[self.titleBar setBackgroundColor:[UIColor colorWithPatternImage:navBar]];
    //[self.navigationBar setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"myImage.png"]]];
}

- (void)viewDidUnload
{
    [self setTwitterView:nil];
    [self setTwitterWebView:nil];
    [self setBackButton:nil];
    [self setTitleBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
   CGFloat xSize = [self.view frame].size.width;
    CGFloat ySize = [self.view frame].size.height;
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
        self.twitterView.frame = CGRectMake(0, 0, ySize, xSize);
    } else {
        self.twitterView.frame = CGRectMake(0, 0, xSize, ySize);
    }
   
   
    
    
    return [super shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

/* Comment out the block below to over-ride */

/*
- (CDVCordovaView*) newCordovaViewWithFrame:(CGRect)bounds
{
    return[super newCordovaViewWithFrame:bounds];
}
*/

/* Comment out the block below to over-ride */

/*
#pragma CDVCommandDelegate implementation

- (id) getCommandInstance:(NSString*)className
{
    return [super getCommandInstance:className];
}

- (BOOL) execute:(CDVInvokedUrlCommand*)command
{
    return [super execute:command];
}

- (NSString*) pathForResource:(NSString*)resourcepath;
{
    return [super pathForResource:resourcepath];
}

- (void) registerPlugin:(CDVPlugin*)plugin withClassName:(NSString*)className
{
    return [super registerPlugin:plugin withClassName:className];
}
*/

#pragma UIWebDelegate implementation

- (void)webViewDidFinishLoad:(UIWebView*)theWebView
{
    // only valid if ___PROJECTNAME__-Info.plist specifies a protocol to handle
    if (self.invokeString) {
        // this is passed before the deviceready event is fired, so you can access it in js when you receive deviceready
        NSLog(@"DEPRECATED: window.invokeString - use the window.handleOpenURL(url) function instead, which is always called when the app is launched through a custom scheme url.");
        NSString* jsString = [NSString stringWithFormat:@"var invokeString = \"%@\";", self.invokeString];
        [theWebView stringByEvaluatingJavaScriptFromString:jsString];
    }

    // Black base color for background matches the native apps
    theWebView.backgroundColor = [UIColor blackColor];

    return [super webViewDidFinishLoad:theWebView];
}

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSURL *url = request.URL;
    NSString *urlString = url.relativeString;
    if ([urlString rangeOfString:@"wso2://loginerror1"].location != NSNotFound) {
        
        [[[[UIAlertView alloc] initWithTitle:@"WSO2 Con"
                                     message:@"Unable to log in with this combination of username and password."
                                     delegate:self
                                     cancelButtonTitle:@"Ok"
                                     otherButtonTitles: nil] autorelease] show];
    }else if ([urlString rangeOfString:@"wso2://loginerror2"].location != NSNotFound) {
        
        [[[[UIAlertView alloc] initWithTitle:@"WSO2 Con"
                                     message:@"Unable to locate registration, is this the email address you used to register?"
                                    delegate:self
                           cancelButtonTitle:@"Ok"
                           otherButtonTitles: nil] autorelease] show];
    }else if ([urlString rangeOfString:@"wso2://loginerror3"].location != NSNotFound) {
        
        [[[[UIAlertView alloc] initWithTitle:@"WSO2 Con"
                                     message:@"Unable to log in with this combination of username and password."
                                    delegate:self
                           cancelButtonTitle:@"Ok"
                           otherButtonTitles: nil] autorelease] show];
    }
    else if ([urlString rangeOfString:@"twitter.com"].location != NSNotFound)
    {
        self.backButton.enabled = TRUE;
        
    } else {
        if ([self.webView canGoBack])
            self.backButton.enabled = TRUE;
        else
            self.backButton.enabled = FALSE;
    }
    return YES;
}

/* Comment out the block below to over-ride */

/*

- (void) webViewDidStartLoad:(UIWebView*)theWebView
{
    return [super webViewDidStartLoad:theWebView];
}

- (void) webView:(UIWebView*)theWebView didFailLoadWithError:(NSError*)error
{
    return [super webView:theWebView didFailLoadWithError:error];
}

- (BOOL) webView:(UIWebView*)theWebView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    return [super webView:theWebView shouldStartLoadWithRequest:request navigationType:navigationType];
}
*/

- (void)dealloc {
    [_twitterView release];
    [_twitterWebView release];
    [_backButton release];
    [_titleBar release];
    [super dealloc];
}
- (IBAction)close:(id)sender {
    
    
    [self.twitterView removeFromSuperview];
}

- (IBAction)back_btn:(id)sender {

    [self.webView goBack];
}
@end
