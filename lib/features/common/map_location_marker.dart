import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

Future<Uint8List> renderRedLocationMarker() async {
  const icon = Icons.location_pin;
  const canvasSize = 64.0;
  const iconSize = 54.0;
  const pixelRatio = 3.0;
  final glyph = String.fromCharCode(icon.codePoint);

  TextPainter makePainter(TextStyle style) => TextPainter(
    text: TextSpan(text: glyph, style: style),
    textDirection: TextDirection.ltr,
  )..layout();

  final baseStyle = TextStyle(
    fontFamily: icon.fontFamily,
    package: icon.fontPackage,
    fontSize: iconSize,
  );
  final outlinePainter = makePainter(
    baseStyle.copyWith(
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..strokeJoin = StrokeJoin.round
        ..color = Colors.white,
    ),
  );
  final fillPainter = makePainter(
    baseStyle.copyWith(color: const Color(0xFFD50000)),
  );
  final offset = Offset(
    (canvasSize - fillPainter.width) / 2,
    (canvasSize - fillPainter.height) / 2,
  );

  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder)..scale(pixelRatio);
  outlinePainter.paint(canvas, offset);
  fillPainter.paint(canvas, offset);

  final image = await recorder.endRecording().toImage(
    (canvasSize * pixelRatio).round(),
    (canvasSize * pixelRatio).round(),
  );
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  image.dispose();
  if (byteData == null) {
    throw StateError('Could not render the Flutter location marker.');
  }
  return byteData.buffer.asUint8List();
}
