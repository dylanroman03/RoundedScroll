# Rounded Scroll

<!-- [![Pub Version](https://img.shields.io/pub/v/rounded_scroll)](https://pub.dev/packages/rounded_scroll) -->

Rounded Scroll is a Flutter package that provides a customizable rounded scrollable container widget with a scroll indicator icon. It is suitable for creating modern UI designs with scrollable content.

<p float="left">
  <img src="https://raw.githubusercontent.com/dylanroman03/RoundedScroll/main/screenshots/flutter_1.png" alt="real_example_1" width="200"/>
  <img src="https://raw.githubusercontent.com/dylanroman03/RoundedScroll/main/screenshots/flutter_2.png" alt="real_example_2" width="200"/>
</p>

## Features

- Rounded container with customizable background color.
- Scroll indicator icon that updates dynamically based on scroll direction.
- Easy to integrate into existing Flutter projects.

## Installation

To use this package, add `rounded_scroll` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  rounded_scroll: ^1.0.0
```

Then, import the package in your code:

```dart
import 'package:rounded_scroll/rounded_scroll.dart';
```

## Usage

Wrap your content inside a `RoundedScroll` widget and provide a list of children widgets. You can customize the container's background color and padding.

```dart
RoundedScroll(
  children: [
    // Your child widgets here
  ],
  color: Colors.blue, // Optional: specify background color
  padding: EdgeInsets.all(16), // Optional: specify padding
)
```

That's it! Your content will now be displayed inside a rounded scrollable container with a scroll indicator.

## Examples

Here's a simple example of how you can use `RoundedScroll` in your Flutter app:

```dart
import 'package:flutter/material.dart';
import 'package:rounded_scroll/rounded_scroll.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rounded Scroll Example'),
        ),
        body: RoundedScroll(
          children: [
            ListTile(
              title: Text('Item 1'),
            ),
            ListTile(
              title: Text('Item 2'),
            ),
            ListTile(
              title: Text('Item 3'),
            ),
            // Add more child widgets as needed
          ],
          color: Colors.green, // Customize background color
          padding: EdgeInsets.all(16), // Add padding if necessary
        ),
      ),
    );
  }
}
```

## License

This package is licensed under the [MIT License](LICENSE).

## Github Repository
[Github Repository](https://github.com/dylanroman03)
