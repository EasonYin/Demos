//
//  FilterPerson.h
//  DesignPatternDemo
//
//      
//  
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FilterPerson : NSObject

@property (nonatomic,strong,readonly) NSString *name;
@property (nonatomic,strong,readonly) NSString *gender;
@property (nonatomic,strong,readonly) NSString *maritalStatus;

- (instancetype)initPersonWithName:(NSString *)name Gender:(NSString *)gender MaritalStatus:(NSString *)maritalStatus;

@end

NS_ASSUME_NONNULL_END
