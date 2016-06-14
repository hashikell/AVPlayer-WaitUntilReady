AVPlayer+WaitUntilReady
============================

`AVPlayer+WaitUntilReady` is an `AVPlayer` category which enables to wait until ready.

Internally the category uses GCD to wait for the tasks to finish.

## Installation

[CocoaPods](http://cocoapods.org) is the recommended method of installing `AVPlayer-WaitUntilReady`. Simply add the following line to your `Podfile`:

#### Podfile

```ruby
pod 'AVPlayer-WaitUntilReady'
```

## Usage

### Synchronous load with URL.

```objc
NSURL *url = ...
AVPlayer *player = [AVPlayer playerWithURL:url waitUntilReady:YES];
if (player.status == AVPlayerStatusReadyToPlay) {
  player.play();
}
```

### Synchronous load with AVPlayerItem.

```objc
AVPlayerItem *item = ...
AVPlayer *player = [AVPlayer playerWithPlayerItem:item waitUntilReady:YES];
if (player.status == AVPlayerStatusReadyToPlay) {
  player.play();
}
```

---

## Contact

Manabu Hashimoto

- http://github.com/hashikell
- http://twitter.com/hashikell

## License

AVPlayer+WaitUntilReady is available under the MIT license. See the LICENSE file for more info.
