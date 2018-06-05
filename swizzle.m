#include <AppKit/AppKit.h>
#include <objc/runtime.h>
#include <objc/message.h>

static IMP oldSetImage;
static void setImage(id self, SEL _cmd, NSImage *image) {
    if ([image isKindOfClass:[NSImage class]]) {
        oldSetImage(self, _cmd, image);
    }
}

__attribute__((constructor))
static void swizzle() {
    id cls = objc_getClass("NSButtonCell");
    oldSetImage = method_setImplementation(class_getInstanceMethod(cls, @selector(setImage:)), (IMP)setImage);
    if (!oldSetImage) printf("[!] WARNING: NSButtonCell swizzle failed\n");
}
