//
//  OMViewController.m
//  Macros
//
//  Created by wangchengqvan@gmail.com on 11/30/2017.
//  Copyright (c) 2017 wangchengqvan@gmail.com. All rights reserved.
//

#import "OMViewController.h"
#import "OMPerson.h"
#import <objc/runtime.h>

@interface OMViewController ()

@end

@implementation OMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    OMPerson *person = [OMPerson shared];
    person.name = @"Tom";
    person.age = 14;
    OMPet *pet = [[OMPet alloc] init];
    pet.name = @"wangcai";
    pet.age = 4;
    person.pet = pet;
    [self archive:person];
}

- (void)archive:(NSObject<NSCoding> *)object {
    NSError *error = nil;
    NSData *data = nil;
    if (@available(iOS 11.0, *)) {
        data = [NSKeyedArchiver archivedDataWithRootObject:object    requiringSecureCoding:YES error:&error];
        if (!error) {
            [[NSUserDefaults standardUserDefaults]  setObject:data forKey:@"test"];
        }
    } else {
        data = [NSKeyedArchiver archivedDataWithRootObject:object];
        [[NSUserDefaults standardUserDefaults]  setObject:data forKey:@"test"];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSData *data = [[NSUserDefaults standardUserDefaults] dataForKey:@"test"];
    OMPerson *person = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSLog(@"🌹--%@\t%@---%@", person.pet.name, person.pet, person.name);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)encodeWithCoder:(NSCoder *)encoder{
//    [super encodeWithCoder:encoder];
//    unsigned int outCount = 0;
//    Ivar *ivars = class_copyIvarList([self class], &outCount);
//
//    for (int i = 0; i < outCount; i ++) {
//
//        Ivar ivar = ivars[i];
//
//        const char *name = ivar_getName(ivar);
//
//        NSString *key = [NSString stringWithUTF8String:name];
//        
//        if (!key) {
//            continue;
//        }
//        id value = [self valueForKey:key];
//        
//        if (!value) {
//            continue;
//        }
//        
//        [encoder encodeObject:value forKey:key];
//    }
//    free(ivars);
//}
//
//- (instancetype)initWithCoder:(NSCoder *)decoder {
//
//    if (self = [super initWithCoder:decoder]) {
//
//        unsigned int outCount = 0;
//        Ivar *ivars = class_copyIvarList([self class], &outCount);
//        for (int i = 0; i < outCount; i ++) {
//
//            Ivar ivar = ivars[i];
//
//            const char *name = ivar_getName(ivar);
//
//            NSString *key = [NSString stringWithUTF8String:name];
//
//            if (!key) {
//                continue;
//            }
//            
//            id value = [decoder decodeObjectForKey:key];
//            
//            if (!value) {
//                continue;
//            }
//
//            [self setValue:value forKey:key];
//
//        }
//        free(ivars);
//    }
//    return self;
//}

@end
