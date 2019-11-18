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
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@end

@implementation InitialViewController
{
    NextViewController *nextViewController;
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
    {
        return self;
    }
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.blueColor;
    self.infoLabel.text = @"wait for the tap on the second view";
}

- (IBAction)acceptButtonTapped:(id)sender
{   // method always displays the view controller modally.
    // The view controller that calls this method might not ultimately handle the presentation but the presentation is always modal.
    // This method adapts the presentation style for horizontally compact environments.
    
    nextViewController = [[NextViewController alloc] init];
    nextViewController.delegate = self;
    [self presentViewController:nextViewController animated:NO completion:nil];
    
}
- (void)buttonDidTapped:(NSInteger)times
{
    NSString *infoString = [NSString stringWithFormat:@"the button on nextViewController was tapped: %ld times", (long)times];
    _infoLabel.text = infoString;
}

@end
