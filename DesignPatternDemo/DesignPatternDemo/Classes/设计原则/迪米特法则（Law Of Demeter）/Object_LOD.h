//
//  Object_LOD.h
//  DesignPatternDemo
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Object_LODIGasoline : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) BOOL isQuality;
@end

@interface Object_LODGasoline90 : Object_LODIGasoline

@end

@interface Object_LODGasoline93 : Object_LODIGasoline

@end

@interface Object_LODCar : NSObject
- (void)refuel:(Object_LODIGasoline *)gaso;
@end

@interface WorkerInPetrolStation : NSObject
- (void)refuel:(Object_LODCar*)car gaso:(Object_LODIGasoline*)gaso;

@end

@interface Person : NSObject
- (void)refuel:(Object_LODCar *)car worker:(WorkerInPetrolStation*)worker gaso:(Object_LODIGasoline*)gaso;

@end


NS_ASSUME_NONNULL_END
