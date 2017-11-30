//
//  OMViewController.m
//  Macros
//
//  Created by wangchengqvan@gmail.com on 11/30/2017.
//  Copyright (c) 2017 wangchengqvan@gmail.com. All rights reserved.
//

#import "OMViewController.h"
#import "OMPerson.h"

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
//    NSLog(@"%d", person.age);
    [self archive:person];
}

- (void)archive:(NSObject<NSCoding> *)object {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:object];
    [[NSUserDefaults standardUserDefaults]  setObject:data forKey:@"test"];
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

@end
