# BlurView

## Project Description
BlurView is a versatile library for iOS and macOS that provides an easy way to add a blur effect to your applications. Whether you're looking to improve UI aesthetics or add some visual flair, BlurView is designed to be simple to integrate and use.

## Features
- Easy integration with iOS and macOS projects.
- Customizable blur intensity and style.
- Lightweight with minimal performance impact.

## Installation
```Swift
.package(url: "https://github.com/sentry.co/BlurView.git", branch: "main")
```

## Usage
To use BlurView in your project, import the library and apply it to your UI elements:

```swift
import BlurView
BlurView.applyTo(view, withStyle: .light)
```