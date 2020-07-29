// Copyright (c) 2020 Famedly GmbH
// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:native_imaging/native_imaging.dart';
import 'package:test/test.dart';
import 'dart:convert';
import 'dart:typed_data';

import 'dart:io';

void main() async {
  await init();

  test("create image", () async {
    final im = Image();
    im.loadRGBA(800, 600, Uint8List(800 * 600 * 4));
    final im2 = im.resample(80, 60, Transform.lanczos);
    final blob = await im2.toJpeg(70);
    final blurhash = im2.toBlurhash(4, 3);
    im.free();
    im2.free();

    expect(blob[0], 0xff);
    expect(blob[1], 0xd8);
    expect(blurhash, "L00000fQfQfQfQfQfQfQfQfQfQfQ");
  });
}
