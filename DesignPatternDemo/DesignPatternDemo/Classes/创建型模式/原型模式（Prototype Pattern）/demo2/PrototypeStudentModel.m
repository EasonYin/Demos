//
//  PrototypeStudentModel.m
//  DesignPatternDemo
//
//      
//  
//

#import "PrototypeStudentModel.h"

@implementation PrototypeStudentModel

- (void)copyOperationWithObject:(PrototypeStudentModel *)object {
    object.name = self.name;
    object.age = self.age;
}

@end
