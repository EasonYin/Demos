//
//  MediatorUser.h
//  DesignPatternDemo
//
//        
//  
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MediatorUser : NSObject

@property (nonatomic,copy) NSString *name;

- (instancetype)initWithName:(NSString *)name;

- (void)sendMessage:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
