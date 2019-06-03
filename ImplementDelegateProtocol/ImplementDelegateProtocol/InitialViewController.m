//
//  ViewController.m
//  ImplementDelegateProtocol
//
//  Created by Carlos Santiago Cruz on 6/1/19.
//  Copyright © 2019 Carlos Santiago Cruz. All rights reserved.
//

#import "InitialViewController.h"
#import "NextViewController.h"

@interface InitialViewController () <NextViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *acceptButton;
@end

@implementation InitialViewController
{
    NextViewController *nextViewController;
}
- (id)init
{
    self = [super init];
    if (self) {
        nextViewController = [[NextViewController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)acceptButtonTapped:(id)sender
{    
    [self presentViewController:nextViewController animated:NO completion:nil];
}
- (void)buttonDidTapped:(NSInteger)times
{
    NSLog(@"the button on nextViewController was tapped: %ld times", (long)times);
}

@end
