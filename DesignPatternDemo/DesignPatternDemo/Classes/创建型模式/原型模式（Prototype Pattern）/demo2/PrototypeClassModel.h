//
//  PrototypeClassModel.h
//  DesignPatternDemo
//
//      
//  
//

#import "PrototypeBaseObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface PrototypeClassModel : PrototypeBaseObject

@property (nonatomic, copy) NSString *className;
@property (nonatomic, copy) NSArray *students;

@end

NS_ASSUME_NONNULL_END
