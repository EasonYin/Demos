//
//  PrototypeClassModel.m
//  DesignPatternDemo
//
//      
//  
//

#import "PrototypeClassModel.h"

@implementation PrototypeClassModel

- (void)copyOperationWithObject:(PrototypeClassModel *)object{
    object.className = self.className;
    
    //深拷贝
    object.students = [[NSArray alloc]initWithArray:self.students copyItems:YES];
}

@end
