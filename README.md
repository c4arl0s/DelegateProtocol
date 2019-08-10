# ImplementDelegateProtocol
ImplementDelegateProtocol

- You can think of a protocol as an *interface definition between two classes.
- The class that defines the protocol can be thought of as *delegating the work defined by the methods in the protocol to the class that implements them.
- In that way, the class can be defined to be more general, with specific actions taken by the delegate class in response to certain events or to define specific parameters.

# Understanding 

The key to understand delegates is to kwno that a delegate is a separate object consulted in order to augment the behavior of a host object.
Thus you can create an application delegate object that can affect the behavior of the iOS NSApplication object without subclassing or changing the NSApplication class. 
The object you create is the delegate object, and the messages that NSApplication will send your object are called delegate methods.

# InitalViewController.m

``` objective-c
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
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.blueColor;
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
    NSLog(@"the button on nextViewController was tapped: %ld times", (long)times);
}

@end
```

# NextViewController.h

``` objective-c
//
//  NextViewController.h
//  ImplementDelegateProtocol
//
//  Created by Carlos Santiago Cruz on 6/1/19.
//  Copyright © 2019 Carlos Santiago Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NextViewControllerDelegate;

@interface NextViewController : UIViewController

@property (nonatomic, weak) id<NextViewControllerDelegate> delegate;

@end

@protocol NextViewControllerDelegate <NSObject>
@optional
- (void)buttonDidTapped:(NSInteger)times;
- (void)buttonDidChangeColor;
@end

NS_ASSUME_NONNULL_END
```


# NextViewController.m

``` objective-c
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
    self.view.backgroundColor = UIColor.cyanColor;
}
- (IBAction)backButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)buttonTapped:(id)sender {
    counter = counter+1;
    [self.delegate buttonDidTapped:counter];
}

@end
```

# AppDelegate.m

``` objective-c
//
//  AppDelegate.m
//  ImplementDelegateProtocol
//
//  Created by Carlos Santiago Cruz on 6/1/19.
//  Copyright © 2019 Carlos Santiago Cruz. All rights reserved.
//

#import "AppDelegate.h"
#import "InitialViewController.h"

@interface AppDelegate ()
{
    InitialViewController *initialViewController;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    initialViewController = [[InitialViewController alloc] initWithNibName:@"InitialViewController" bundle:nil];
    self.window.rootViewController = initialViewController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
```

``` console
2019-06-03 00:21:41.057866-0600 ImplementDelegateProtocol[98306:21144300] libMobileGestalt MobileGestalt.c:890: MGIsDeviceOneOfType is not supported on this platform.
2019-06-03 00:22:10.869995-0600 ImplementDelegateProtocol[98306:21144300] the button on nextViewController was tapped: 1 times
2019-06-03 00:22:11.995787-0600 ImplementDelegateProtocol[98306:21144300] the button on nextViewController was tapped: 2 times
2019-06-03 00:22:12.291603-0600 ImplementDelegateProtocol[98306:21144300] the button on nextViewController was tapped: 3 times
2019-06-03 00:22:12.533584-0600 ImplementDelegateProtocol[98306:21144300] the button on nextViewController was tapped: 4 times
2019-06-03 00:22:12.766085-0600 ImplementDelegateProtocol[98306:21144300] the button on nextViewController was tapped: 5 times
2019-06-03 00:22:13.004204-0600 ImplementDelegateProtocol[98306:21144300] the button on nextViewController was tapped: 6 times

```





