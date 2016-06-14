//
//  AVPlayer+WaitUntilReady.m
//
//  Created by Manabu Hashimoto on 2016/06/14.
//
#import "AVPlayer+WaitUntilReady.h"

@interface AVPlayer_WaitUntilReadyStatus : NSObject
@property (nonatomic) dispatch_semaphore_t semaphore;
@end

@implementation AVPlayer_WaitUntilReadyStatus
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context {
  AVPlayerStatus status = [change[NSKeyValueChangeNewKey] integerValue];
  if (status == AVPlayerStatusReadyToPlay || status == AVPlayerStatusFailed) {
    dispatch_semaphore_signal(self.semaphore);
  }
}
@end


static NSString *const kPlayerItemStatusKeyPath = @"status";

@implementation AVPlayer (WaitUntilReady)

+ (instancetype _Nonnull)playerWithPlayerItem:(nonnull AVPlayerItem *)item waitUntilReady:(BOOL)waitUntilReady {
  if (waitUntilReady) {
    AVPlayer_WaitUntilReadyStatus *status = [[AVPlayer_WaitUntilReadyStatus alloc] init];

    [item addObserver:status
           forKeyPath:kPlayerItemStatusKeyPath
              options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
              context:nil];
    AVPlayer *player = [self playerWithPlayerItem:item];

    status.semaphore = dispatch_semaphore_create(0);
    dispatch_semaphore_wait(status.semaphore, DISPATCH_TIME_FOREVER);

    [item removeObserver:status
              forKeyPath:kPlayerItemStatusKeyPath
                 context:nil];

    return player;
  } else {
    return [self playerWithPlayerItem:item];
  }
}

+ (instancetype _Nonnull)playerWithURL:(nonnull NSURL *)url waitUntilReady:(BOOL)waitUntilReady {
  AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
  return [self playerWithPlayerItem:item waitUntilReady:waitUntilReady];
}

@end
