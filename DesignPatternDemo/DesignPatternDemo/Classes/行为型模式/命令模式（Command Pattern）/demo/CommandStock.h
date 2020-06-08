//
//  CommandStock.h
//  DesignPatternDemo
//
//   
//  
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommandStock : NSObject
{
    @private
    NSString *name;
    int quantity;
}

- (void)buy;
- (void)sell;

@end

NS_ASSUME_NONNULL_END
