//
//  Object_LOD.m
//  DesignPatternDemo
//
//

#import "Object_LOD.h"

@implementation Object_LODIGasoline

@end

@implementation Object_LODGasoline90
- (NSString *)name{
    return @"90号";
}
- (BOOL)isQuality{
    return false;
}
@end

@implementation Object_LODGasoline93
- (NSString *)name{
    return @"93号";
}
- (BOOL)isQuality{
    return true;
}
@end

@implementation Object_LODCar
- (void)refuel:(Object_LODIGasoline *)gaso{
    NSLog(@"加%@汽油",gaso.name);
}
@end

@implementation WorkerInPetrolStation
- (void)refuel:(Object_LODCar *)car gaso:(Object_LODIGasoline *)gaso{
    if (gaso.isQuality) {//如果汽油质量过关，我们就给汽车加油
        NSLog(@"质量过关,准备加油");
        [car refuel:gaso];
    }
    else{
        NSLog(@"质量不过关,放弃加油");
    }
}
@end

@implementation Person
- (void)refuel:(Object_LODCar *)car worker:(WorkerInPetrolStation *)worker gaso:(Object_LODIGasoline *)gaso{
    NSLog(@"用户要加%@汽油",gaso.name);
    [worker refuel:car gaso:gaso];
}
@end
