#!/bin/bash
SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk
xcrun --sdk iphoneos clang++ -arch armv7 -arch armv7s -arch arm64 -isystem/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk --sysroot=$SYSROOT -I/opt/theos/include/ -I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1  -std=c++11 -stdlib=libc++ -lc++ -mios-version-min=5.0  -O3 Patch.cpp -c
xcrun --sdk iphoneos clang++ -arch armv7 -arch armv7s -arch arm64 -isystem/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk --sysroot=$SYSROOT -I/opt/theos/include/ -std=c++11 -stdlib=libc++ -lc++ -mios-version-min=5.0 -O3 Settings.mm -c
xcrun --sdk iphoneos clang++ -arch armv7 -arch armv7s -arch arm64 -isystem/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk --sysroot=$SYSROOT -I/opt/theos/include/ -stdlib=libc++ -lc++ -mios-version-min=5.0 -O3 Network.m -c
libtool -static Patch.o Settings.o Network.o -o libLiberation.a
