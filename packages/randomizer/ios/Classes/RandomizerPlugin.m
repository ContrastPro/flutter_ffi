#import "RandomizerPlugin.h"
#if __has_include(<randomizer/randomizer-Swift.h>)
#import <randomizer/randomizer-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "randomizer-Swift.h"
#endif

@implementation RandomizerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRandomizerPlugin registerWithRegistrar:registrar];
}
@end
