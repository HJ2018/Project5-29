

#import "AppSetting.h"


static AppSetting *sharedInstance = nil;

@implementation AppSetting

+ (AppSetting *)sharedAppSetting
{
    @synchronized (self) {
        if (sharedInstance == nil) {
            sharedInstance = [[AppSetting alloc] init];
        }
    }
    return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized (self) {
        if (sharedInstance == nil) {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}



@end
