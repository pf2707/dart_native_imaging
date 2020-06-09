#import "NativeImagingPlugin.h"
#if __has_include(<native_imaging/native_imaging-Swift.h>)
#import <native_imaging/native_imaging-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "native_imaging-Swift.h"
#endif

@implementation NativeImagingPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNativeImagingPlugin registerWithRegistrar:registrar];
}
@end
