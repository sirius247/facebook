#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TouchFix.h"
#import "BBWeeAppController-Protocol.h"

@interface FaceBookController : NSObject <BBWeeAppController, UIWebViewDelegate>
{
    UIView *_view;
    UIWebView *webView;
}

+ (void)initialize;
- (UIView *)view;

@end

@implementation FaceBookController

//- (id)launchURLForTapLocation:(CGPoint)point
//{
//    // Hack to fix the touch bug
//    UITouch *touch = [[UITouch alloc] initWithPoint:[[self view] convertPoint:point toView:[self view].window] andView:[self view]];
//    UIEvent *eventDown = [[UIEvent alloc] initWithTouch:touch];
//    [touch.view touchesBegan:[eventDown allTouches] withEvent:eventDown];
//    [touch setPhase:UITouchPhaseEnded];
//    UIEvent *eventUp = [[UIEvent alloc] initWithTouch:touch];
//    [touch.view touchesEnded:[eventUp allTouches] withEvent:eventUp];
//    [eventDown release];
//    [eventUp release];
//    [touch release];
//    return nil;
//}

+ (void)initialize
{
    
}

- (void)dealloc
{
    [_view release];
    [super dealloc];
}

- (UIView *)view
{
    if (_view == nil)
    {
        _view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 316, 330.0)];
        
        CGRect webFrame = CGRectMake(0.0, 30.0, 316.0, 300.0);
        webView = [[UIWebView alloc] initWithFrame:webFrame];
        [webView setBackgroundColor:[UIColor clearColor]];
	webView.delegate = self;
        NSString *urlAddress = @"http://m.facebook.com";
        NSURL *url = [NSURL URLWithString:urlAddress];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        [webView loadRequest:requestObj];
        webView.userInteractionEnabled = YES;
        [_view addSubview:webView];
        [webView release];
        
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [button addTarget:self 
//                   action:@selector(goHome:)
//         forControlEvents:UIControlEventTouchUpInside];
//        [button setTitle:@"Go home" forState:UIControlStateNormal];
//        button.frame = CGRectMake(0.0, 00.0, 20.0, 30.0);
//        [_view addSubview:button];
//        [_view bringSubviewToFront:webView];
//        
//        [button release];
        
    }
    
    return _view;
}

//- (void)goHome: (id)sender{
//    NSString *urlAddress = @"http://m.twitter.com";
//    NSURL *url = [NSURL URLWithString:urlAddress];
//    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//    [webView loadRequest:requestObj];
//}


- (float)viewHeight
{
    return 325.0f;
}


- (void)willAnimateRotationToInterfaceOrientation:(int)arg1
{
	if (UIInterfaceOrientationIsLandscape(arg1)) {
		CGRect rect=[self view].frame;
		rect.size.width=476;
		[self view].frame=rect;
		for(UIView* v__ in [[self view] subviews]){
	                CGRect rect=v__.frame;
        	        rect.size.width=476;
                	v__.frame=rect;
		}
	} else {
		CGRect rect=[self view].frame;
		rect.size.width=316;
		[self view].frame=rect;
		for(UIView* v__ in [[self view] subviews]){
	                CGRect rect=v__.frame;
        	        rect.size.width=316;
                	v__.frame=rect;
		}
	}
}

@end
