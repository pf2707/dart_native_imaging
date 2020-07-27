// Auto-generated file.

import 'ffi_base.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';

final ImagingNew = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<Utf8> mode, Int32 xsize, Int32 ysize),
  Pointer<NativeType> Function(Pointer<Utf8> mode, int xsize, int ysize)
>('ImagingNew');

final ImagingNewDirty = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<Utf8> mode, Int32 xsize, Int32 ysize),
  Pointer<NativeType> Function(Pointer<Utf8> mode, int xsize, int ysize)
>('ImagingNewDirty');

final ImagingNew2Dirty = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<Utf8> mode, Pointer<NativeType> imOut, Pointer<NativeType> imIn),
  Pointer<NativeType> Function(Pointer<Utf8> mode, Pointer<NativeType> imOut, Pointer<NativeType> imIn)
>('ImagingNew2Dirty');

final ImagingDelete = libImaging.lookupFunction<
  Void Function(Pointer<NativeType> im),
  void Function(Pointer<NativeType> im)
>('ImagingDelete');

final ImagingNewBlock = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<Utf8> mode, Int32 xsize, Int32 ysize),
  Pointer<NativeType> Function(Pointer<Utf8> mode, int xsize, int ysize)
>('ImagingNewBlock');

final ImagingNewMap = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<Utf8> filename, Int32 readonly, Pointer<Utf8> mode, Int32 xsize, Int32 ysize),
  Pointer<NativeType> Function(Pointer<Utf8> filename, int readonly, Pointer<Utf8> mode, int xsize, int ysize)
>('ImagingNewMap');

final ImagingNewPrologue = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<Utf8> mode, Int32 xsize, Int32 ysize),
  Pointer<NativeType> Function(Pointer<Utf8> mode, int xsize, int ysize)
>('ImagingNewPrologue');

final ImagingNewPrologueSubtype = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<Utf8> mode, Int32 xsize, Int32 ysize, Int32 structure_size),
  Pointer<NativeType> Function(Pointer<Utf8> mode, int xsize, int ysize, int structure_size)
>('ImagingNewPrologueSubtype');

final ImagingCopyPalette = libImaging.lookupFunction<
  Void Function(Pointer<NativeType> destination, Pointer<NativeType> source),
  void Function(Pointer<NativeType> destination, Pointer<NativeType> source)
>('ImagingCopyPalette');

final ImagingHistogramDelete = libImaging.lookupFunction<
  Void Function(Pointer<NativeType> histogram),
  void Function(Pointer<NativeType> histogram)
>('ImagingHistogramDelete');

final ImagingAccessInit = libImaging.lookupFunction<
  Void Function(),
  void Function()
>('ImagingAccessInit');

final ImagingAccessNew = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im),
  Pointer<NativeType> Function(Pointer<NativeType> im)
>('ImagingAccessNew');

final ImagingPaletteNew = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<Utf8> mode),
  Pointer<NativeType> Function(Pointer<Utf8> mode)
>('ImagingPaletteNew');

final ImagingPaletteNewBrowser = libImaging.lookupFunction<
  Pointer<NativeType> Function(),
  Pointer<NativeType> Function()
>('ImagingPaletteNewBrowser');

final ImagingPaletteDuplicate = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> palette),
  Pointer<NativeType> Function(Pointer<NativeType> palette)
>('ImagingPaletteDuplicate');

final ImagingPaletteDelete = libImaging.lookupFunction<
  Void Function(Pointer<NativeType> palette),
  void Function(Pointer<NativeType> palette)
>('ImagingPaletteDelete');

final ImagingPaletteCachePrepare = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> palette),
  int Function(Pointer<NativeType> palette)
>('ImagingPaletteCachePrepare');

final ImagingPaletteCacheUpdate = libImaging.lookupFunction<
  Void Function(Pointer<NativeType> palette, Int32 r, Int32 g, Int32 b),
  void Function(Pointer<NativeType> palette, int r, int g, int b)
>('ImagingPaletteCacheUpdate');

final ImagingPaletteCacheDelete = libImaging.lookupFunction<
  Void Function(Pointer<NativeType> palette),
  void Function(Pointer<NativeType> palette)
>('ImagingPaletteCacheDelete');

final ImagingQuantize = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im, Int32 colours, Int32 mode, Int32 kmeans),
  Pointer<NativeType> Function(Pointer<NativeType> im, int colours, int mode, int kmeans)
>('ImagingQuantize');

final ImagingSectionEnter = libImaging.lookupFunction<
  Void Function(Pointer<NativeType> cookie),
  void Function(Pointer<NativeType> cookie)
>('ImagingSectionEnter');

final ImagingSectionLeave = libImaging.lookupFunction<
  Void Function(Pointer<NativeType> cookie),
  void Function(Pointer<NativeType> cookie)
>('ImagingSectionLeave');

final ImagingError_OSError = libImaging.lookupFunction<
  Pointer<Uint8> Function(),
  Pointer<Uint8> Function()
>('ImagingError_OSError');

final ImagingError_MemoryError = libImaging.lookupFunction<
  Pointer<Uint8> Function(),
  Pointer<Uint8> Function()
>('ImagingError_MemoryError');

final ImagingError_ModeError = libImaging.lookupFunction<
  Pointer<Uint8> Function(),
  Pointer<Uint8> Function()
>('ImagingError_ModeError');

final ImagingError_Mismatch = libImaging.lookupFunction<
  Pointer<Uint8> Function(),
  Pointer<Uint8> Function()
>('ImagingError_Mismatch');

final ImagingError_ValueError = libImaging.lookupFunction<
  Pointer<Uint8> Function(Pointer<Utf8> message),
  Pointer<Uint8> Function(Pointer<Utf8> message)
>('ImagingError_ValueError');

final ImagingError_Clear = libImaging.lookupFunction<
  Void Function(),
  void Function()
>('ImagingError_Clear');

final ImagingAlphaComposite = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2),
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2)
>('ImagingAlphaComposite');

final ImagingBlend = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2, Float alpha),
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2, double alpha)
>('ImagingBlend');

final ImagingCopy = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im),
  Pointer<NativeType> Function(Pointer<NativeType> im)
>('ImagingCopy');

final ImagingConvert = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im, Pointer<Utf8> mode, Pointer<NativeType> palette, Int32 dither),
  Pointer<NativeType> Function(Pointer<NativeType> im, Pointer<Utf8> mode, Pointer<NativeType> palette, int dither)
>('ImagingConvert');

final ImagingConvertInPlace = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im, Pointer<Utf8> mode),
  Pointer<NativeType> Function(Pointer<NativeType> im, Pointer<Utf8> mode)
>('ImagingConvertInPlace');

final ImagingConvertMatrix = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im, Pointer<Utf8> mode, Pointer<Float> m),
  Pointer<NativeType> Function(Pointer<NativeType> im, Pointer<Utf8> mode, Pointer<Float> m)
>('ImagingConvertMatrix');

final ImagingConvertTransparent = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im, Pointer<Utf8> mode, Int32 r, Int32 g, Int32 b),
  Pointer<NativeType> Function(Pointer<NativeType> im, Pointer<Utf8> mode, int r, int g, int b)
>('ImagingConvertTransparent');

final ImagingCrop = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im, Int32 x0, Int32 y0, Int32 x1, Int32 y1),
  Pointer<NativeType> Function(Pointer<NativeType> im, int x0, int y0, int x1, int y1)
>('ImagingCrop');

final ImagingExpand = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im, Int32 x, Int32 y, Int32 mode),
  Pointer<NativeType> Function(Pointer<NativeType> im, int x, int y, int mode)
>('ImagingExpand');

final ImagingFill = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im, Pointer<Uint8> ink),
  Pointer<NativeType> Function(Pointer<NativeType> im, Pointer<Uint8> ink)
>('ImagingFill');

final ImagingFill2 = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> into, Pointer<Uint8> ink, Pointer<NativeType> mask, Int32 x0, Int32 y0, Int32 x1, Int32 y1),
  int Function(Pointer<NativeType> into, Pointer<Uint8> ink, Pointer<NativeType> mask, int x0, int y0, int x1, int y1)
>('ImagingFill2');

final ImagingFillBand = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im, Int32 band, Int32 color),
  Pointer<NativeType> Function(Pointer<NativeType> im, int band, int color)
>('ImagingFillBand');

final ImagingFillLinearGradient = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<Utf8> mode),
  Pointer<NativeType> Function(Pointer<Utf8> mode)
>('ImagingFillLinearGradient');

final ImagingFillRadialGradient = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<Utf8> mode),
  Pointer<NativeType> Function(Pointer<Utf8> mode)
>('ImagingFillRadialGradient');

final ImagingFilter = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im, Int32 xsize, Int32 ysize, Pointer<Float> kernel, Float offset),
  Pointer<NativeType> Function(Pointer<NativeType> im, int xsize, int ysize, Pointer<Float> kernel, double offset)
>('ImagingFilter');

final ImagingFlipLeftRight = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn),
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn)
>('ImagingFlipLeftRight');

final ImagingFlipTopBottom = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn),
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn)
>('ImagingFlipTopBottom');

final ImagingGaussianBlur = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn, Float radius, Int32 passes),
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn, double radius, int passes)
>('ImagingGaussianBlur');

final ImagingGetBand = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im, Int32 band),
  Pointer<NativeType> Function(Pointer<NativeType> im, int band)
>('ImagingGetBand');

final ImagingMerge = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<Utf8> mode, Pointer<Pointer<NativeType>> bands),
  Pointer<NativeType> Function(Pointer<Utf8> mode, Pointer<Pointer<NativeType>> bands)
>('ImagingMerge');

final ImagingSplit = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<Pointer<NativeType>> bands),
  int Function(Pointer<NativeType> im, Pointer<Pointer<NativeType>> bands)
>('ImagingSplit');

final ImagingGetBBox = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<Int32> bbox),
  int Function(Pointer<NativeType> im, Pointer<Int32> bbox)
>('ImagingGetBBox');

final ImagingGetColors = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im, Int32 maxcolors, Pointer<Int32> colors),
  Pointer<NativeType> Function(Pointer<NativeType> im, int maxcolors, Pointer<Int32> colors)
>('ImagingGetColors');

final ImagingGetExtrema = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<Uint8> extrema),
  int Function(Pointer<NativeType> im, Pointer<Uint8> extrema)
>('ImagingGetExtrema');

final ImagingGetProjection = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<Uint8> xproj, Pointer<Uint8> yproj),
  int Function(Pointer<NativeType> im, Pointer<Uint8> xproj, Pointer<Uint8> yproj)
>('ImagingGetProjection');

final ImagingGetHistogram = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im, Pointer<NativeType> mask, Pointer<Uint8> extrema),
  Pointer<NativeType> Function(Pointer<NativeType> im, Pointer<NativeType> mask, Pointer<Uint8> extrema)
>('ImagingGetHistogram');

final ImagingModeFilter = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im, Int32 size),
  Pointer<NativeType> Function(Pointer<NativeType> im, int size)
>('ImagingModeFilter');

final ImagingNegative = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im),
  Pointer<NativeType> Function(Pointer<NativeType> im)
>('ImagingNegative');

final ImagingOffset = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im, Int32 xoffset, Int32 yoffset),
  Pointer<NativeType> Function(Pointer<NativeType> im, int xoffset, int yoffset)
>('ImagingOffset');

final ImagingPaste = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> into, Pointer<NativeType> im, Pointer<NativeType> mask, Int32 x0, Int32 y0, Int32 x1, Int32 y1),
  int Function(Pointer<NativeType> into, Pointer<NativeType> im, Pointer<NativeType> mask, int x0, int y0, int x1, int y1)
>('ImagingPaste');

final ImagingPoint = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im, Pointer<Utf8> tablemode, Pointer<Uint8> table),
  Pointer<NativeType> Function(Pointer<NativeType> im, Pointer<Utf8> tablemode, Pointer<Uint8> table)
>('ImagingPoint');

final ImagingPointTransform = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn, Double scale, Double offset),
  Pointer<NativeType> Function(Pointer<NativeType> imIn, double scale, double offset)
>('ImagingPointTransform');

final ImagingPutBand = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im, Pointer<NativeType> imIn, Int32 band),
  Pointer<NativeType> Function(Pointer<NativeType> im, Pointer<NativeType> imIn, int band)
>('ImagingPutBand');

final ImagingRankFilter = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> im, Int32 size, Int32 rank),
  Pointer<NativeType> Function(Pointer<NativeType> im, int size, int rank)
>('ImagingRankFilter');

final ImagingRotate90 = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn),
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn)
>('ImagingRotate90');

final ImagingRotate180 = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn),
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn)
>('ImagingRotate180');

final ImagingRotate270 = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn),
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn)
>('ImagingRotate270');

final ImagingTranspose = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn),
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn)
>('ImagingTranspose');

final ImagingTransverse = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn),
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn)
>('ImagingTransverse');

final ImagingResample = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn, Int32 xsize, Int32 ysize, Int32 filter, Pointer<Float> box),
  Pointer<NativeType> Function(Pointer<NativeType> imIn, int xsize, int ysize, int filter, Pointer<Float> box)
>('ImagingResample');

final ImagingReduce = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn, Int32 xscale, Int32 yscale, Pointer<Int32> box),
  Pointer<NativeType> Function(Pointer<NativeType> imIn, int xscale, int yscale, Pointer<Int32> box)
>('ImagingReduce');

final ImagingTransform = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn, Int32 method, Int32 x0, Int32 y0, Int32 x1, Int32 y1, Pointer<Double> a, Int32 filter, Int32 fill),
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn, int method, int x0, int y0, int x1, int y1, Pointer<Double> a, int filter, int fill)
>('ImagingTransform');

final ImagingUnsharpMask = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> im, Float radius, Int32 percent, Int32 threshold),
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> im, double radius, int percent, int threshold)
>('ImagingUnsharpMask');

final ImagingBoxBlur = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn, Float radius, Int32 n),
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn, double radius, int n)
>('ImagingBoxBlur');

final ImagingColorLUT3D_linear = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn, Int32 table_channels, Int32 size1D, Int32 size2D, Int32 size3D, Pointer<Int16> table),
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn, int table_channels, int size1D, int size2D, int size3D, Pointer<Int16> table)
>('ImagingColorLUT3D_linear');

final ImagingCopy2 = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn),
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn)
>('ImagingCopy2');

final ImagingConvert2 = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn),
  Pointer<NativeType> Function(Pointer<NativeType> imOut, Pointer<NativeType> imIn)
>('ImagingConvert2');

final ImagingChopLighter = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2),
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2)
>('ImagingChopLighter');

final ImagingChopDarker = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2),
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2)
>('ImagingChopDarker');

final ImagingChopDifference = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2),
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2)
>('ImagingChopDifference');

final ImagingChopMultiply = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2),
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2)
>('ImagingChopMultiply');

final ImagingChopScreen = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2),
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2)
>('ImagingChopScreen');

final ImagingChopAdd = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2, Float scale, Int32 offset),
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2, double scale, int offset)
>('ImagingChopAdd');

final ImagingChopSubtract = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2, Float scale, Int32 offset),
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2, double scale, int offset)
>('ImagingChopSubtract');

final ImagingChopAddModulo = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2),
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2)
>('ImagingChopAddModulo');

final ImagingChopSubtractModulo = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2),
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2)
>('ImagingChopSubtractModulo');

final ImagingChopSoftLight = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2),
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2)
>('ImagingChopSoftLight');

final ImagingChopHardLight = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2),
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2)
>('ImagingChopHardLight');

final ImagingOverlay = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2),
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2)
>('ImagingOverlay');

final ImagingChopAnd = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2),
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2)
>('ImagingChopAnd');

final ImagingChopOr = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2),
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2)
>('ImagingChopOr');

final ImagingChopXor = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2),
  Pointer<NativeType> Function(Pointer<NativeType> imIn1, Pointer<NativeType> imIn2)
>('ImagingChopXor');

final ImagingCrack = libImaging.lookupFunction<
  Void Function(Pointer<NativeType> im, Int32 x0, Int32 y0),
  void Function(Pointer<NativeType> im, int x0, int y0)
>('ImagingCrack');

final ImagingDrawArc = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Int32 x0, Int32 y0, Int32 x1, Int32 y1, Float start, Float end, Pointer<Uint8> ink, Int32 width, Int32 op),
  int Function(Pointer<NativeType> im, int x0, int y0, int x1, int y1, double start, double end, Pointer<Uint8> ink, int width, int op)
>('ImagingDrawArc');

final ImagingDrawBitmap = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Int32 x0, Int32 y0, Pointer<NativeType> bitmap, Pointer<Uint8> ink, Int32 op),
  int Function(Pointer<NativeType> im, int x0, int y0, Pointer<NativeType> bitmap, Pointer<Uint8> ink, int op)
>('ImagingDrawBitmap');

final ImagingDrawChord = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Int32 x0, Int32 y0, Int32 x1, Int32 y1, Float start, Float end, Pointer<Uint8> ink, Int32 fill, Int32 width, Int32 op),
  int Function(Pointer<NativeType> im, int x0, int y0, int x1, int y1, double start, double end, Pointer<Uint8> ink, int fill, int width, int op)
>('ImagingDrawChord');

final ImagingDrawEllipse = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Int32 x0, Int32 y0, Int32 x1, Int32 y1, Pointer<Uint8> ink, Int32 fill, Int32 width, Int32 op),
  int Function(Pointer<NativeType> im, int x0, int y0, int x1, int y1, Pointer<Uint8> ink, int fill, int width, int op)
>('ImagingDrawEllipse');

final ImagingDrawLine = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Int32 x0, Int32 y0, Int32 x1, Int32 y1, Pointer<Uint8> ink, Int32 op),
  int Function(Pointer<NativeType> im, int x0, int y0, int x1, int y1, Pointer<Uint8> ink, int op)
>('ImagingDrawLine');

final ImagingDrawWideLine = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Int32 x0, Int32 y0, Int32 x1, Int32 y1, Pointer<Uint8> ink, Int32 width, Int32 op),
  int Function(Pointer<NativeType> im, int x0, int y0, int x1, int y1, Pointer<Uint8> ink, int width, int op)
>('ImagingDrawWideLine');

final ImagingDrawPieslice = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Int32 x0, Int32 y0, Int32 x1, Int32 y1, Float start, Float end, Pointer<Uint8> ink, Int32 fill, Int32 width, Int32 op),
  int Function(Pointer<NativeType> im, int x0, int y0, int x1, int y1, double start, double end, Pointer<Uint8> ink, int fill, int width, int op)
>('ImagingDrawPieslice');

final ImagingDrawPoint = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Int32 x, Int32 y, Pointer<Uint8> ink, Int32 op),
  int Function(Pointer<NativeType> im, int x, int y, Pointer<Uint8> ink, int op)
>('ImagingDrawPoint');

final ImagingDrawPolygon = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Int32 points, Pointer<Int32> xy, Pointer<Uint8> ink, Int32 fill, Int32 op),
  int Function(Pointer<NativeType> im, int points, Pointer<Int32> xy, Pointer<Uint8> ink, int fill, int op)
>('ImagingDrawPolygon');

final ImagingDrawRectangle = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Int32 x0, Int32 y0, Int32 x1, Int32 y1, Pointer<Uint8> ink, Int32 fill, Int32 width, Int32 op),
  int Function(Pointer<NativeType> im, int x0, int y0, int x1, int y1, Pointer<Uint8> ink, int fill, int width, int op)
>('ImagingDrawRectangle');

final ImagingOutlineNew = libImaging.lookupFunction<
  Pointer<NativeType> Function(),
  Pointer<NativeType> Function()
>('ImagingOutlineNew');

final ImagingOutlineDelete = libImaging.lookupFunction<
  Void Function(Pointer<NativeType> outline),
  void Function(Pointer<NativeType> outline)
>('ImagingOutlineDelete');

final ImagingDrawOutline = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> outline, Pointer<Uint8> ink, Int32 fill, Int32 op),
  int Function(Pointer<NativeType> im, Pointer<NativeType> outline, Pointer<Uint8> ink, int fill, int op)
>('ImagingDrawOutline');

final ImagingOutlineMove = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> outline, Float x, Float y),
  int Function(Pointer<NativeType> outline, double x, double y)
>('ImagingOutlineMove');

final ImagingOutlineLine = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> outline, Float x, Float y),
  int Function(Pointer<NativeType> outline, double x, double y)
>('ImagingOutlineLine');

final ImagingOutlineCurve = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> outline, Float x1, Float y1, Float x2, Float y2, Float x3, Float y3),
  int Function(Pointer<NativeType> outline, double x1, double y1, double x2, double y2, double x3, double y3)
>('ImagingOutlineCurve');

final ImagingOutlineTransform = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> outline, Pointer<Double> a),
  int Function(Pointer<NativeType> outline, Pointer<Double> a)
>('ImagingOutlineTransform');

final ImagingOutlineClose = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> outline),
  int Function(Pointer<NativeType> outline)
>('ImagingOutlineClose');

final ImagingEffectSpread = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<NativeType> imIn, Int32 distance),
  Pointer<NativeType> Function(Pointer<NativeType> imIn, int distance)
>('ImagingEffectSpread');

final ImagingEffectNoise = libImaging.lookupFunction<
  Pointer<NativeType> Function(Int32 xsize, Int32 ysize, Float sigma),
  Pointer<NativeType> Function(int xsize, int ysize, double sigma)
>('ImagingEffectNoise');

final ImagingEffectMandelbrot = libImaging.lookupFunction<
  Pointer<NativeType> Function(Int32 xsize, Int32 ysize, Pointer<Double> extent, Int32 quality),
  Pointer<NativeType> Function(int xsize, int ysize, Pointer<Double> extent, int quality)
>('ImagingEffectMandelbrot');

final ImagingToString = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Int32 orientation, Pointer<Utf8> buffer),
  int Function(Pointer<NativeType> im, int orientation, Pointer<Utf8> buffer)
>('ImagingToString');

final ImagingFromString = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Int32 orientation, Pointer<Utf8> buffer),
  int Function(Pointer<NativeType> im, int orientation, Pointer<Utf8> buffer)
>('ImagingFromString');

final ImagingOpenPPM = libImaging.lookupFunction<
  Pointer<NativeType> Function(Pointer<Utf8> filename),
  Pointer<NativeType> Function(Pointer<Utf8> filename)
>('ImagingOpenPPM');

final ImagingSavePPM = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<Utf8> filename),
  int Function(Pointer<NativeType> im, Pointer<Utf8> filename)
>('ImagingSavePPM');

final ImagingCRC32 = libImaging.lookupFunction<
  Uint32 Function(Uint32 crc, Pointer<Uint8> buffer, Int32 bytes),
  int Function(int crc, Pointer<Uint8> buffer, int bytes)
>('ImagingCRC32');

final ImagingBcnDecode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, IntPtr bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingBcnDecode');

final ImagingBitDecode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, IntPtr bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingBitDecode');

final ImagingEpsEncode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, Int32 bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingEpsEncode');

final ImagingFliDecode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, IntPtr bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingFliDecode');

final ImagingGifDecode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, IntPtr bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingGifDecode');

final ImagingGifEncode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, Int32 bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingGifEncode');

final ImagingHexDecode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, IntPtr bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingHexDecode');

final ImagingMspDecode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, IntPtr bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingMspDecode');

final ImagingPackbitsDecode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, IntPtr bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingPackbitsDecode');

final ImagingPcdDecode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, IntPtr bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingPcdDecode');

final ImagingPcxDecode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, IntPtr bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingPcxDecode');

final ImagingPcxEncode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, Int32 bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingPcxEncode');

final ImagingRawDecode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, IntPtr bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingRawDecode');

final ImagingRawEncode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, Int32 bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingRawEncode');

final ImagingSgiRleDecode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, IntPtr bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingSgiRleDecode');

final ImagingSgiRleDecodeCleanup = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> state),
  int Function(Pointer<NativeType> state)
>('ImagingSgiRleDecodeCleanup');

final ImagingSunRleDecode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, IntPtr bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingSunRleDecode');

final ImagingTgaRleDecode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, IntPtr bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingTgaRleDecode');

final ImagingTgaRleEncode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, Int32 bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingTgaRleEncode');

final ImagingXbmDecode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, IntPtr bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingXbmDecode');

final ImagingXbmEncode = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, Int32 bytes),
  int Function(Pointer<NativeType> im, Pointer<NativeType> state, Pointer<Uint8> buffer, int bytes)
>('ImagingXbmEncode');

final ImagingPackBGR = libImaging.lookupFunction<
  Void Function(Pointer<Uint8> c_out, Pointer<Uint8> c_in, Int32 pixels),
  void Function(Pointer<Uint8> c_out, Pointer<Uint8> c_in, int pixels)
>('ImagingPackBGR');

final ImagingUnpackYCC = libImaging.lookupFunction<
  Void Function(Pointer<Uint8> c_out, Pointer<Uint8> c_in, Int32 pixels),
  void Function(Pointer<Uint8> c_out, Pointer<Uint8> c_in, int pixels)
>('ImagingUnpackYCC');

final ImagingUnpackYCCA = libImaging.lookupFunction<
  Void Function(Pointer<Uint8> c_out, Pointer<Uint8> c_in, Int32 pixels),
  void Function(Pointer<Uint8> c_out, Pointer<Uint8> c_in, int pixels)
>('ImagingUnpackYCCA');

final ImagingConvertRGB2YCbCr = libImaging.lookupFunction<
  Void Function(Pointer<Uint8> c_out, Pointer<Uint8> c_in, Int32 pixels),
  void Function(Pointer<Uint8> c_out, Pointer<Uint8> c_in, int pixels)
>('ImagingConvertRGB2YCbCr');

final ImagingConvertYCbCr2RGB = libImaging.lookupFunction<
  Void Function(Pointer<Uint8> c_out, Pointer<Uint8> c_in, Int32 pixels),
  void Function(Pointer<Uint8> c_out, Pointer<Uint8> c_in, int pixels)
>('ImagingConvertYCbCr2RGB');

final imageFromRGBA = libImaging.lookupFunction<
  Pointer<NativeType> Function(Int32 width, Int32 height, Pointer<Uint8> data),
  Pointer<NativeType> Function(int width, int height, Pointer<Uint8> data)
>('imageFromRGBA');

final imageMode = libImaging.lookupFunction<
  Pointer<Utf8> Function(Pointer<NativeType> im),
  Pointer<Utf8> Function(Pointer<NativeType> im)
>('imageMode');

final imageWidth = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im),
  int Function(Pointer<NativeType> im)
>('imageWidth');

final imageHeight = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im),
  int Function(Pointer<NativeType> im)
>('imageHeight');

final imageLinesize = libImaging.lookupFunction<
  Int32 Function(Pointer<NativeType> im),
  int Function(Pointer<NativeType> im)
>('imageLinesize');

final imageBlock = libImaging.lookupFunction<
  Pointer<Uint8> Function(Pointer<NativeType> im),
  Pointer<Uint8> Function(Pointer<NativeType> im)
>('imageBlock');

final blurHashForImage = libImaging.lookupFunction<
  Pointer<Utf8> Function(Pointer<NativeType> im, Int32 xComponents, Int32 yComponents),
  Pointer<Utf8> Function(Pointer<NativeType> im, int xComponents, int yComponents)
>('blurHashForImage');

final jpegEncode = libImaging.lookupFunction<
  Void Function(Pointer<NativeType> im, Int32 quality, Pointer<Pointer<Uint8>> data, Pointer<IntPtr> size),
  void Function(Pointer<NativeType> im, int quality, Pointer<Pointer<Uint8>> data, Pointer<IntPtr> size)
>('jpegEncode');
