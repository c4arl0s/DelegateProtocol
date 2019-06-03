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
