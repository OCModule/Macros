//
//  OMPet.h
//  Macros_Example
//
//  Created by Steve on 30/11/2017.
//  Copyright © 2017 wangchengqvan@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Macros/Macros.h>

@interface OMPet : NSObject<NSCoding, NSSecureCoding>
DEF_SIGLETON()
    @property(nonatomic, strong) NSString *name;
    @property(nonatomic, assign) NSInteger age;
@end
