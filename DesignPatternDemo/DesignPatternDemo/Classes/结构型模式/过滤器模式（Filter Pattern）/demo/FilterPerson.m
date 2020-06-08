//
//  FilterPerson.m
//  DesignPatternDemo
//
//      
//  
//

#import "FilterPerson.h"

@interface FilterPerson ()

@property (nonatomic,strong,readwrite) NSString *name;
@property (nonatomic,strong,readwrite) NSString *gender;
@property (nonatomic,strong,readwrite) NSString *maritalStatus;

@end
@implementation FilterPerson

- (instancetype)initPersonWithName:(NSString *)name Gender:(NSString *)gender MaritalStatus:(NSString *)maritalStatus{
    
    if (self == [super init]) {
        self.name = name;
        self.gender = gender;
        self.maritalStatus = maritalStatus;
    }
    return self;
}

@end
