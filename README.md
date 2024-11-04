[![Tests](https://github.com/sentryco/BlurView/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/BlurView/actions/workflows/Tests.yml)
[![codebeat badge](https://codebeat.co/badges/1cad746c-61eb-435c-bed6-a3817a2aec37)](https://codebeat.co/projects/github-com-sentryco-blurview-main)

# BlurView

> BlurView for iOS and macOS

## Project Description
BlurView is a versatile library for iOS and macOS that provides an easy way to add a blur effect to your applications. Whether you're looking to improve UI aesthetics or add some visual flair, BlurView is designed to be simple to integrate and use.

## Features
- Easy integration with iOS and macOS projects.
- Customizable blur intensity and style.
- Lightweight with minimal performance impact.

## Installation
```Swift
.package(url: "https://github.com/sentry.co/BlurView", branch: "main")
```

## Usage
To use BlurView in your project, import the library and apply it to your UI elements:

```swift
import BlurView
BlurView.applyTo(view, withStyle: .light)
```
