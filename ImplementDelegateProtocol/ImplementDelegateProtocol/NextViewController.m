//
//  NextViewController.m
//  ImplementDelegateProtocol
//
//  Created by Carlos Santiago Cruz on 6/1/19.
//  Copyright © 2019 Carlos Santiago Cruz. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@end

@implementation NextViewController
{
    NSInteger counter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)buttonTapped:(id)sender {
    counter = counter+1;
    [self.delegate buttonDidTapped:counter];
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
