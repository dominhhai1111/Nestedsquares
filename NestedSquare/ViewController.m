//
//  ViewController.m
//  NestedSquare
//
//  Created by Do Minh Hai on 8/22/15.
//  Copyright (c) 2015 Do Minh Hai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer *_timer;
    int n;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawNestedSquares];
   // [self performSelector:@selector(rotateAllSquares)
    //          withObject:nil
    //           afterDelay:2];
    //[self rotateAllSquares];
    n=0;
     _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(rotateAllSquares) userInfo:nil repeats:true];
};

-(void) drawNestedSquares {
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat margin = 20;
    CGFloat recWidth = mainViewSize.width - margin * 2.0;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    
    CGPoint center = CGPointMake(mainViewSize.width * 0.5, (mainViewSize.height + statusNavigationBarHeight)* 0.5);
    
    for (int i=0; i<10 ; i++) {
        UIView* square;
        if (i%2 == 0) {
            square = [self drawSquareByWidth:recWidth
                                   andRotate:false
                                    atCenter:center];
        }else {
            square = [self drawSquareByWidth:recWidth
                                   andRotate:true
                                    atCenter:center];
        }
        [self.view addSubview:square];
        recWidth = recWidth * 0.707;
    }
}
- (UIView*) drawSquareByWidth: (CGFloat) width
                    andRotate: (BOOL) rotate
                     atCenter: (CGPoint) center
{
    UIView *square = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    square.center = center;
    square.backgroundColor = rotate ? [UIColor whiteColor] : [UIColor darkGrayColor];
    square.transform = rotate ? CGAffineTransformMakeRotation(M_PI_4) : CGAffineTransformIdentity;
    return square;
}
-(void) rotateAllSquares {
    [UIView animateWithDuration:2.0 animations:^{
        for (int i=0;i< self.view.subviews.count ; i++) {
            if ((i-n)%2== 0) {
              ((UIView*)self.view.subviews[i]).transform = CGAffineTransformMakeRotation(M_PI_4);
            }else {
                ((UIView*)self.view.subviews[i]).transform = CGAffineTransformIdentity;
            }
        }
        
    }];
}

@end