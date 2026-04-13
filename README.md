# HerosDragonBallSwiftUI

Dragon Ball API application built with Swift and SwiftUI.

## Features
- Browse Dragon Ball characters from a REST API
- Asynchronous data handling with Combine and async/await
- Reactive UI using Swift's `@Observable` macro
- In-app contextual guidance with TipKit
- Unit and UI tests with XCTest

## Tech Stack
| Layer | Technology |
|---|---|
| UI | SwiftUI |
| State | @Observable |
| Networking | URLSession + async/await |
| Reactive | Combine |
| Guidance | TipKit |
| Testing | XCTest |

## Architecture
MVVM — clear separation between data, business logic, and UI layers.

## Requirements
- iOS 17+
- Xcode 15+

## How to Run
1. Clone the repo
2. Open `HerosDragonBallSwiftUI.xcodeproj` in Xcode
3. Run on simulator or device (iOS 17+)
4. To run tests: `Cmd + U`

## Preview

<div align="center">
  <img src="images/1.png" width="300"/>
  <img src="images/2.png" width="300"/>
</div>

<div align="center" style="margin-top: 10px;">
  <img src="images/3.png" width="300"/>
  <img src="images/4.png" width="300"/>
</div>

<div align="center" style="margin-top: 10px;">
  <img src="images/5.png" width="300"/>
  <img src="images/6.png" width="300"/>
</div>
