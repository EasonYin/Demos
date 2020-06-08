//
//  CarDirector.m
//  DesignPatternDemo
//
//      
//  
//

#import "CarDirector.h"

@interface CarDirector()

@property (nonatomic,strong) id<CarBuilder> carBuilder;

@end

@implementation CarDirector

- (instancetype)initWithBuilder:(id<CarBuilder>)builder{
    
    self = [super init];
    if (self) {
        _carBuilder = builder;
    }
    return self;
}

- (id<CarCompanyProtocol>)constructWithBody:(NSString *)carBody
                                  andEngine:(NSString *)engine
                                    andTyre:(NSString *)tyre{
    
    return [[[[_carBuilder buildCarBody:carBody] buildEngine:engine] buildTyre:tyre] getCar];
    
}

@end
