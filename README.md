# DBLive iOS Example
iOS example using DBLive to play Tic-Tac-Toe with another player.

## Run
Simply run this in a simulator to see how it works. 

**AppDelegate.swift**

You can change the appKey to one of your own.
```swift
let dbLive = DBLiveClient(appKey: "+EzwYKZrXI7eKn/KRtlhURsGsjyP2e+1++vqTDQH")
```

**TicTacToe.swift**

The example only uses one key, which you can change to whatever you want.
```swift
private let dbLiveKey = "tic-tac-toe-example"
```

## DBLive
[DBLive - Client (iOS/maxOS)](https://github.com/DBLive/dblive-client-ios-macos)
