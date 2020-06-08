//
//  NullAbstractCustomer.h
//  DesignPatternDemo
//
//        
//  
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NullAbstractCustomer : NSObject

@property (nonatomic,strong) NSString *name;

- (BOOL)isNull;

@end

NS_ASSUME_NONNULL_END
