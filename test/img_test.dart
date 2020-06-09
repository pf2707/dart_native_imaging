// Copyright (c) 2020 Famedly GmbH
// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:native_imaging/native.dart';
import 'package:test/test.dart';
import 'dart:convert';
import 'dart:typed_data';

import 'dart:io';

void main() async {
  test("create image", () {
    final im = Image(800, 600, Uint8List(800 * 600 * 4));
    final im2 = im.resample(80, 60, Transform.lanczos);
    final blob = im2.toJpeg(70);
    final blurhash = im2.toBlurhash(4, 3);
    im.free();
    im2.free();

    new File('file.jpg').writeAsBytes(blob);
    print(blurhash);
  });
}
