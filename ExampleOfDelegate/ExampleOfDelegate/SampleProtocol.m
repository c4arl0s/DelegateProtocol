//
//  SampleProtocol.m
//  ExampleOfDelegate
//
//  Created by Carlos Santiago Cruz on 4/23/19.
//  Copyright © 2019 Carlos Santiago Cruz. All rights reserved.
//

#import "SampleProtocol.h"

@implementation SampleProtocol

- (void)startSampleProcess
{
    [NSTimer scheduledTimerWithTimeInterval:3.0
                                      target:self.delegate
                                    selector:@selector(processCompleted)
                                    userInfo:nil
                                     repeats:NO];
}
    

@end
