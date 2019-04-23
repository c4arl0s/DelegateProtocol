//
//  SampleProtocol.h
//  ExampleOfDelegate
//
//  Created by Carlos Santiago Cruz on 4/23/19.
//  Copyright © 2019 Carlos Santiago Cruz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// This is the object which is going to receive the message

//Protocol SampleProtocolDelegate
@protocol SampleProtocolDelegate <NSObject>
@required
- (void)processCompleted;
@end

@interface SampleProtocol: NSObject
{
    //Delegate to respond back
    id <SampleProtocolDelegate> _delegate;
}

@property (nonatomic, strong) id delegate;

- (void)startSampleProcess; // instance method

@end

NS_ASSUME_NONNULL_END
