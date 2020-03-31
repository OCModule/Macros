//
//  OMPerson.m
//  Macros_Example
//
//  Created by Steve on 30/11/2017.
//  Copyright © 2017 wangchengqvan@gmail.com. All rights reserved.
//

#import "OMPerson.h"
#import <objc/runtime.h>

@implementation OMPerson
IMP_SIGLETON()
IMP_CODING
+ (BOOL)supportsSecureCoding {
    return YES;
}
@end
