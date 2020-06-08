//
//  PrototypeStudentModel.h
//  DesignPatternDemo
//
//      
//  
//

#import "PrototypeBaseObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface PrototypeStudentModel : PrototypeBaseObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;

@end

NS_ASSUME_NONNULL_END
