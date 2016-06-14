//
//  AVPlayer+WaitUntilReady.h
//
//  Created by Manabu Hashimoto on 2016/06/14.
//
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface AVPlayer (WaitUntilReady)

+ (instancetype _Nonnull)playerWithPlayerItem:(nonnull AVPlayerItem *)item waitUntilReady:(BOOL)waitUntilReady;
+ (instancetype _Nonnull)playerWithURL:(nonnull NSURL *)url waitUntilReady:(BOOL)waitUntilReady;

@end
