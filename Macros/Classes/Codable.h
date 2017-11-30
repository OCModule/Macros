//
//  Codable.h
//  Macros
//
//  Created by Steve on 30/11/2017.
//

#ifndef Codable_h
#define Codable_h

/**
 *  宏定义实现NSCoding协议
 */
#undef IMP_CODING
#define IMP_CODING \
- (void)encodeWithCoder:(NSCoder *)encoder{\
unsigned int outCount = 0;\
Ivar *ivars = class_copyIvarList([self class], &outCount);\
\
for (int i = 0; i < outCount; i ++) {\
\
Ivar ivar = ivars[i];\
\
const char *name = ivar_getName(ivar);\
\
NSString *key = [NSString stringWithUTF8String:name];\
\
id value = [self valueForKey:key];\
\
[encoder encodeObject:value forKey:key];\
}\
free(ivars);\
}\
\
- (instancetype)initWithCoder:(NSCoder *)decoder{\
\
if (self = [super init]) {\
\
unsigned int outCount = 0;\
Ivar *ivars = class_copyIvarList([self class], &outCount);\
for (int i = 0; i < outCount; i ++) {\
\
Ivar ivar = ivars[i];\
\
const char *name = ivar_getName(ivar);\
\
NSString *key = [NSString stringWithUTF8String:name];\
\
id value = [decoder decodeObjectForKey:key];\
\
[self setValue:value forKey:key];\
\
}\
free(ivars);\
}\
return self;\
}\

#endif /* Codable_h */
