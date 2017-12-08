//
//  Thread.h
//  Pods-Macros_Example
//
//  Created by Steve on 08/12/2017.
//

#ifndef Thread_h
#define Thread_h

/**
 Execute block on the main thread
 */
#define execute_block_on_main_thread($block) \
if ($block) { \
if ([[NSThread currentThread] isMainThread]) { \
$block(); \
} else { \
dispatch_sync(dispatch_get_main_queue(), ^{ \
$block();\
}); \
} \
}\

#endif /* Thread_h */

