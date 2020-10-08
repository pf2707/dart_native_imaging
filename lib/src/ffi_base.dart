// Copyright (c) 2020 Famedly GmbH
// SPDX-License-Identifier: AGPL-3.0-or-later

import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

final libImaging = Platform.isIOS
    ? DynamicLibrary.process()
    : DynamicLibrary.open(Platform.isAndroid
        ? 'libImaging.so'
        : Platform.isWindows
            ? 'libImaging.dll'
            : Platform.isMacOS
                ? 'libImaging.dylib'
                : 'libImaging.so');
