/*
 * The Python Imaging Library
 * $Id$
 *
 * declarations for the imaging core library
 *
 * Copyright (c) 1997-2005 by Secret Labs AB
 * Copyright (c) 1995-2005 by Fredrik Lundh
 *
 * See the README file for information on usage and redistribution.
 */


#include "ImPlatform.h"
#include "imaging_export.h"


#if defined(__cplusplus)
extern "C" {
#endif


#ifndef M_PI
#define M_PI    3.1415926535897932384626433832795
#endif


/* -------------------------------------------------------------------- */

/*
 * Image data organization:
 *
 * mode     bytes       byte order
 * -------------------------------
 * 1        1           1
 * L        1           L
 * P        1           P
 * I        4           I (32-bit integer, native byte order)
 * F        4           F (32-bit IEEE float, native byte order)
 * RGB      4           R, G, B, -
 * RGBA     4           R, G, B, A
 * CMYK     4           C, M, Y, K
 * YCbCr    4           Y, Cb, Cr, -
 * Lab      4           L, a, b, -
 *
 * experimental modes (incomplete):
 * LA       4           L, -, -, A
 * PA       4           P, -, -, A
 * I;16     2           I (16-bit integer, native byte order)
 *
 * "P" is an 8-bit palette mode, which should be mapped through the
 * palette member to get an output image.  Check palette->mode to
 * find the corresponding "real" mode.
 *
 * For information on how to access Imaging objects from your own C
 * extensions, see http://www.effbot.org/zone/pil-extending.htm
 */

/* Handles */

struct ImagingMemoryInstance;
struct ImagingAccessInstance;
struct ImagingHistogramInstance;
struct ImagingOutlineInstance;
struct ImagingPaletteInstance;

#define Imaging struct ImagingMemoryInstance*
#define ImagingAccess struct ImagingAccessInstance*
#define ImagingHistogram struct ImagingHistogramInstance*
#define ImagingOutline struct ImagingOutlineInstance*
#define ImagingPalette struct ImagingPaletteInstance*

/* handle magics (used with PyCObject). */
#define IMAGING_MAGIC "PIL Imaging"

/* pixel types */
#define IMAGING_TYPE_UINT8 0
#define IMAGING_TYPE_INT32 1
#define IMAGING_TYPE_FLOAT32 2
#define IMAGING_TYPE_SPECIAL 3 /* check mode for details */

#define IMAGING_MODE_LENGTH 6+1 /* Band names ("1", "L", "P", "RGB", "RGBA", "CMYK", "YCbCr", "BGR;xy") */

typedef struct {
    char *ptr;
    int size;
} ImagingMemoryBlock;

struct ImagingMemoryInstance {

    /* Format */
    char mode[IMAGING_MODE_LENGTH];     /* Band names ("1", "L", "P", "RGB", "RGBA", "CMYK", "YCbCr", "BGR;xy") */
    int type;           /* Data type (IMAGING_TYPE_*) */
    int depth;          /* Depth (ignored in this version) */
    int bands;          /* Number of bands (1, 2, 3, or 4) */
    int xsize;          /* Image dimension. */
    int ysize;

    /* Colour palette (for "P" images only) */
    ImagingPalette palette;

    /* Data pointers */
    UINT8 **image8;     /* Set for 8-bit images (pixelsize=1). */
    INT32 **image32;    /* Set for 32-bit images (pixelsize=4). */

    /* Internals */
    char **image;       /* Actual raster data. */
    char *block;        /* Set if data is allocated in a single block. */
    ImagingMemoryBlock *blocks;     /* Memory blocks for pixel storage */

    int pixelsize;      /* Size of a pixel, in bytes (1, 2 or 4) */
    int linesize;       /* Size of a line, in bytes (xsize * pixelsize) */

    /* Virtual methods */
    void (*destroy)(Imaging im);
};


#define IMAGING_PIXEL_1(im,x,y) ((im)->image8[(y)][(x)])
#define IMAGING_PIXEL_L(im,x,y) ((im)->image8[(y)][(x)])
#define IMAGING_PIXEL_LA(im,x,y) ((im)->image[(y)][(x)*4])
#define IMAGING_PIXEL_P(im,x,y) ((im)->image8[(y)][(x)])
#define IMAGING_PIXEL_PA(im,x,y) ((im)->image[(y)][(x)*4])
#define IMAGING_PIXEL_I(im,x,y) ((im)->image32[(y)][(x)])
#define IMAGING_PIXEL_F(im,x,y) (((FLOAT32*)(im)->image32[y])[x])
#define IMAGING_PIXEL_RGB(im,x,y) ((im)->image[(y)][(x)*4])
#define IMAGING_PIXEL_RGBA(im,x,y) ((im)->image[(y)][(x)*4])
#define IMAGING_PIXEL_CMYK(im,x,y) ((im)->image[(y)][(x)*4])
#define IMAGING_PIXEL_YCbCr(im,x,y) ((im)->image[(y)][(x)*4])

#define IMAGING_PIXEL_UINT8(im,x,y) ((im)->image8[(y)][(x)])
#define IMAGING_PIXEL_INT32(im,x,y) ((im)->image32[(y)][(x)])
#define IMAGING_PIXEL_FLOAT32(im,x,y) (((FLOAT32*)(im)->image32[y])[x])

struct ImagingAccessInstance {
  const char* mode;
  void* (*line)(Imaging im, int x, int y);
  void (*get_pixel)(Imaging im, int x, int y, void* pixel);
  void (*put_pixel)(Imaging im, int x, int y, const void* pixel);
};

struct ImagingHistogramInstance {

    /* Format */
    char mode[IMAGING_MODE_LENGTH];     /* Band names (of corresponding source image) */
    int bands;          /* Number of bands (1, 3, or 4) */

    /* Data */
    long *histogram;    /* Histogram (bands*256 longs) */

};


struct ImagingPaletteInstance {

    /* Format */
    char mode[IMAGING_MODE_LENGTH];     /* Band names */

    /* Data */
    UINT8 palette[1024];/* Palette data (same format as image data) */

    INT16* cache;       /* Palette cache (used for predefined palettes) */
    int keep_cache;     /* This palette will be reused; keep cache */

};

typedef struct ImagingMemoryArena {
    int alignment;        /* Alignment in memory of each line of an image */
    int block_size;       /* Preferred block size, bytes */
    int blocks_max;       /* Maximum number of cached blocks */
    int blocks_cached;    /* Current number of blocks not associated with images */
    ImagingMemoryBlock *blocks_pool;
    int stats_new_count;           /* Number of new allocated images */
    int stats_allocated_blocks;    /* Number of allocated blocks */
    int stats_reused_blocks;       /* Number of blocks which were retrieved from a pool */
    int stats_reallocated_blocks;  /* Number of blocks which were actually reallocated after retrieving */
    int stats_freed_blocks;        /* Number of freed blocks */
} *ImagingMemoryArena;


/* Objects */
/* ------- */

extern IMAGING_EXPORT struct ImagingMemoryArena ImagingDefaultArena;
extern IMAGING_EXPORT int ImagingMemorySetBlocksMax(ImagingMemoryArena arena, int blocks_max);
extern IMAGING_EXPORT void ImagingMemoryClearCache(ImagingMemoryArena arena, int new_size);

extern IMAGING_EXPORT Imaging ImagingNew(const char* mode, int xsize, int ysize);
extern IMAGING_EXPORT Imaging ImagingNewDirty(const char* mode, int xsize, int ysize);
extern IMAGING_EXPORT Imaging ImagingNew2Dirty(const char* mode, Imaging imOut, Imaging imIn);
extern IMAGING_EXPORT void    ImagingDelete(Imaging im);

extern IMAGING_EXPORT Imaging ImagingNewBlock(const char* mode, int xsize, int ysize);
extern IMAGING_EXPORT Imaging ImagingNewMap(const char* filename, int readonly,
                             const char* mode, int xsize, int ysize);

extern IMAGING_EXPORT Imaging ImagingNewPrologue(const char *mode,
                                  int xsize, int ysize);
extern IMAGING_EXPORT Imaging ImagingNewPrologueSubtype(const char *mode,
                                         int xsize, int ysize,
                                         int structure_size);

extern IMAGING_EXPORT void ImagingCopyPalette(Imaging destination, Imaging source);

extern IMAGING_EXPORT void ImagingHistogramDelete(ImagingHistogram histogram);

extern IMAGING_EXPORT void ImagingAccessInit(void);
extern IMAGING_EXPORT ImagingAccess ImagingAccessNew(Imaging im);
extern IMAGING_EXPORT void _ImagingAccessDelete(Imaging im, ImagingAccess access);
#define ImagingAccessDelete(im, access) /* nop, for now */

extern IMAGING_EXPORT ImagingPalette ImagingPaletteNew(const char *mode);
extern IMAGING_EXPORT ImagingPalette ImagingPaletteNewBrowser(void);
extern IMAGING_EXPORT ImagingPalette ImagingPaletteDuplicate(ImagingPalette palette);
extern IMAGING_EXPORT void           ImagingPaletteDelete(ImagingPalette palette);

extern IMAGING_EXPORT int  ImagingPaletteCachePrepare(ImagingPalette palette);
extern IMAGING_EXPORT void ImagingPaletteCacheUpdate(ImagingPalette palette,
                                      int r, int g, int b);
extern IMAGING_EXPORT void ImagingPaletteCacheDelete(ImagingPalette palette);

#define ImagingPaletteCache(p, r, g, b)\
    p->cache[(r>>2) + (g>>2)*64 + (b>>2)*64*64]

extern IMAGING_EXPORT Imaging ImagingQuantize(Imaging im, int colours, int mode, int kmeans);

/* Threading */
/* --------- */

typedef void* ImagingSectionCookie;

extern IMAGING_EXPORT void ImagingSectionEnter(ImagingSectionCookie* cookie);
extern IMAGING_EXPORT void ImagingSectionLeave(ImagingSectionCookie* cookie);

/* Exceptions */
/* ---------- */

extern IMAGING_EXPORT void* ImagingError_OSError(void);
extern IMAGING_EXPORT void* ImagingError_MemoryError(void);
extern IMAGING_EXPORT void* ImagingError_ModeError(void); /* maps to ValueError by default */
extern IMAGING_EXPORT void* ImagingError_Mismatch(void); /* maps to ValueError by default */
extern IMAGING_EXPORT void* ImagingError_ValueError(const char* message);
extern IMAGING_EXPORT void ImagingError_Clear(void);

/* Transform callbacks */
/* ------------------- */

/* standard transforms */
#define IMAGING_TRANSFORM_AFFINE 0
#define IMAGING_TRANSFORM_PERSPECTIVE 2
#define IMAGING_TRANSFORM_QUAD 3


/* standard filters */
#define IMAGING_TRANSFORM_NEAREST 0
#define IMAGING_TRANSFORM_BOX 4
#define IMAGING_TRANSFORM_BILINEAR 2
#define IMAGING_TRANSFORM_HAMMING 5
#define IMAGING_TRANSFORM_BICUBIC 3
#define IMAGING_TRANSFORM_LANCZOS 1

typedef int (*ImagingTransformMap)(double* X, double* Y,
                                   int x, int y, void* data);
typedef int (*ImagingTransformFilter)(void* out, Imaging im,
                                      double x, double y);

/* Image Manipulation Methods */
/* -------------------------- */

extern IMAGING_EXPORT Imaging ImagingAlphaComposite(Imaging imIn1, Imaging imIn2);
extern IMAGING_EXPORT Imaging ImagingBlend(Imaging imIn1, Imaging imIn2, float alpha);
extern IMAGING_EXPORT Imaging ImagingCopy(Imaging im);
extern IMAGING_EXPORT Imaging ImagingConvert(Imaging im, const char* mode, ImagingPalette palette, int dither);
extern IMAGING_EXPORT Imaging ImagingConvertInPlace(Imaging im, const char* mode);
extern IMAGING_EXPORT Imaging ImagingConvertMatrix(Imaging im, const char *mode, float m[]);
extern IMAGING_EXPORT Imaging ImagingConvertTransparent(Imaging im, const char *mode, int r, int g, int b);
extern IMAGING_EXPORT Imaging ImagingCrop(Imaging im, int x0, int y0, int x1, int y1);
extern IMAGING_EXPORT Imaging ImagingExpand(Imaging im, int x, int y, int mode);
extern IMAGING_EXPORT Imaging ImagingFill(Imaging im, const void* ink);
extern IMAGING_EXPORT int ImagingFill2(
    Imaging into, const void* ink, Imaging mask,
    int x0, int y0, int x1, int y1);
extern IMAGING_EXPORT Imaging ImagingFillBand(Imaging im, int band, int color);
extern IMAGING_EXPORT Imaging ImagingFillLinearGradient(const char* mode);
extern IMAGING_EXPORT Imaging ImagingFillRadialGradient(const char* mode);
extern IMAGING_EXPORT Imaging ImagingFilter(
    Imaging im, int xsize, int ysize, const FLOAT32* kernel,
    FLOAT32 offset);
extern IMAGING_EXPORT Imaging ImagingFlipLeftRight(Imaging imOut, Imaging imIn);
extern IMAGING_EXPORT Imaging ImagingFlipTopBottom(Imaging imOut, Imaging imIn);
extern IMAGING_EXPORT Imaging ImagingGaussianBlur(Imaging imOut, Imaging imIn, float radius,
                                   int passes);
extern IMAGING_EXPORT Imaging ImagingGetBand(Imaging im, int band);
extern IMAGING_EXPORT Imaging ImagingMerge(const char* mode, Imaging bands[4]);
extern IMAGING_EXPORT int ImagingSplit(Imaging im, Imaging bands[4]);
extern IMAGING_EXPORT int ImagingGetBBox(Imaging im, int bbox[4]);
typedef struct { int x, y; INT32 count; INT32 pixel; } ImagingColorItem;
extern IMAGING_EXPORT ImagingColorItem* ImagingGetColors(Imaging im, int maxcolors,
                                          int *colors);
extern IMAGING_EXPORT int ImagingGetExtrema(Imaging im, void *extrema);
extern IMAGING_EXPORT int ImagingGetProjection(Imaging im, UINT8* xproj, UINT8* yproj);
extern IMAGING_EXPORT ImagingHistogram ImagingGetHistogram(
    Imaging im, Imaging mask, void *extrema);
extern IMAGING_EXPORT Imaging ImagingModeFilter(Imaging im, int size);
extern IMAGING_EXPORT Imaging ImagingNegative(Imaging im);
extern IMAGING_EXPORT Imaging ImagingOffset(Imaging im, int xoffset, int yoffset);
extern IMAGING_EXPORT int ImagingPaste(
    Imaging into, Imaging im, Imaging mask,
    int x0, int y0, int x1, int y1);
extern IMAGING_EXPORT Imaging ImagingPoint(
    Imaging im, const char* tablemode, const void* table);
extern IMAGING_EXPORT Imaging ImagingPointTransform(
    Imaging imIn, double scale, double offset);
extern IMAGING_EXPORT Imaging ImagingPutBand(Imaging im, Imaging imIn, int band);
extern IMAGING_EXPORT Imaging ImagingRankFilter(Imaging im, int size, int rank);
extern IMAGING_EXPORT Imaging ImagingRotate90(Imaging imOut, Imaging imIn);
extern IMAGING_EXPORT Imaging ImagingRotate180(Imaging imOut, Imaging imIn);
extern IMAGING_EXPORT Imaging ImagingRotate270(Imaging imOut, Imaging imIn);
extern IMAGING_EXPORT Imaging ImagingTranspose(Imaging imOut, Imaging imIn);
extern IMAGING_EXPORT Imaging ImagingTransverse(Imaging imOut, Imaging imIn);
extern IMAGING_EXPORT Imaging ImagingResample(Imaging imIn, int xsize, int ysize, int filter, float box[4]);
extern IMAGING_EXPORT Imaging ImagingReduce(Imaging imIn, int xscale, int yscale, int box[4]);
extern IMAGING_EXPORT Imaging ImagingTransform(
    Imaging imOut, Imaging imIn, int method, int x0, int y0, int x1, int y1,
    double *a, int filter, int fill);
extern IMAGING_EXPORT Imaging ImagingUnsharpMask(
    Imaging imOut, Imaging im, float radius, int percent, int threshold);
extern IMAGING_EXPORT Imaging ImagingBoxBlur(Imaging imOut, Imaging imIn, float radius, int n);
extern IMAGING_EXPORT Imaging ImagingColorLUT3D_linear(Imaging imOut, Imaging imIn,
    int table_channels, int size1D, int size2D, int size3D, INT16* table);

extern IMAGING_EXPORT Imaging ImagingCopy2(Imaging imOut, Imaging imIn);
extern IMAGING_EXPORT Imaging ImagingConvert2(Imaging imOut, Imaging imIn);

/* Channel operations */
/* any mode, except "F" */
extern IMAGING_EXPORT Imaging ImagingChopLighter(Imaging imIn1, Imaging imIn2);
extern IMAGING_EXPORT Imaging ImagingChopDarker(Imaging imIn1, Imaging imIn2);
extern IMAGING_EXPORT Imaging ImagingChopDifference(Imaging imIn1, Imaging imIn2);
extern IMAGING_EXPORT Imaging ImagingChopMultiply(Imaging imIn1, Imaging imIn2);
extern IMAGING_EXPORT Imaging ImagingChopScreen(Imaging imIn1, Imaging imIn2);
extern IMAGING_EXPORT Imaging ImagingChopAdd(
    Imaging imIn1, Imaging imIn2, float scale, int offset);
extern IMAGING_EXPORT Imaging ImagingChopSubtract(
    Imaging imIn1, Imaging imIn2, float scale, int offset);
extern IMAGING_EXPORT Imaging ImagingChopAddModulo(Imaging imIn1, Imaging imIn2);
extern IMAGING_EXPORT Imaging ImagingChopSubtractModulo(Imaging imIn1, Imaging imIn2);
extern IMAGING_EXPORT Imaging ImagingChopSoftLight(Imaging imIn1, Imaging imIn2);
extern IMAGING_EXPORT Imaging ImagingChopHardLight(Imaging imIn1, Imaging imIn2);
extern IMAGING_EXPORT Imaging ImagingOverlay(Imaging imIn1, Imaging imIn2);

/* "1" images only */
extern IMAGING_EXPORT Imaging ImagingChopAnd(Imaging imIn1, Imaging imIn2);
extern IMAGING_EXPORT Imaging ImagingChopOr(Imaging imIn1, Imaging imIn2);
extern IMAGING_EXPORT Imaging ImagingChopXor(Imaging imIn1, Imaging imIn2);

/* Image measurement */
extern IMAGING_EXPORT void ImagingCrack(Imaging im, int x0, int y0);

/* Graphics */
extern IMAGING_EXPORT int ImagingDrawArc(Imaging im, int x0, int y0, int x1, int y1,
                          float start, float end, const void* ink, int width,
                          int op);
extern IMAGING_EXPORT int ImagingDrawBitmap(Imaging im, int x0, int y0, Imaging bitmap,
                             const void* ink, int op);
extern IMAGING_EXPORT int ImagingDrawChord(Imaging im, int x0, int y0, int x1, int y1,
                            float start, float end, const void* ink, int fill,
                            int width, int op);
extern IMAGING_EXPORT int ImagingDrawEllipse(Imaging im, int x0, int y0, int x1, int y1,
                              const void* ink, int fill, int width, int op);
extern IMAGING_EXPORT int ImagingDrawLine(Imaging im, int x0, int y0, int x1, int y1,
                           const void* ink, int op);
extern IMAGING_EXPORT int ImagingDrawWideLine(Imaging im, int x0, int y0, int x1, int y1,
                               const void* ink, int width, int op);
extern IMAGING_EXPORT int ImagingDrawPieslice(Imaging im, int x0, int y0, int x1, int y1,
                               float start, float end, const void* ink, int fill,
                               int width, int op);
extern IMAGING_EXPORT int ImagingDrawPoint(Imaging im, int x, int y, const void* ink, int op);
extern IMAGING_EXPORT int ImagingDrawPolygon(Imaging im, int points, int *xy,
                              const void* ink, int fill, int op);
extern IMAGING_EXPORT int ImagingDrawRectangle(Imaging im, int x0, int y0, int x1, int y1,
                                const void* ink, int fill, int width, int op);

/* Level 2 graphics (WORK IN PROGRESS) */
extern IMAGING_EXPORT ImagingOutline ImagingOutlineNew(void);
extern IMAGING_EXPORT void ImagingOutlineDelete(ImagingOutline outline);

extern IMAGING_EXPORT int ImagingDrawOutline(Imaging im, ImagingOutline outline,
                              const void* ink, int fill, int op);

extern IMAGING_EXPORT int ImagingOutlineMove(ImagingOutline outline, float x, float y);
extern IMAGING_EXPORT int ImagingOutlineLine(ImagingOutline outline, float x, float y);
extern IMAGING_EXPORT int ImagingOutlineCurve(ImagingOutline outline, float x1, float y1,
                               float x2, float y2, float x3, float y3);
extern IMAGING_EXPORT int ImagingOutlineTransform(ImagingOutline outline, double a[6]);

extern IMAGING_EXPORT int ImagingOutlineClose(ImagingOutline outline);

/* Special effects */
extern IMAGING_EXPORT Imaging ImagingEffectSpread(Imaging imIn, int distance);
extern IMAGING_EXPORT Imaging ImagingEffectNoise(int xsize, int ysize, float sigma);
extern IMAGING_EXPORT Imaging ImagingEffectMandelbrot(int xsize, int ysize,
                                       double extent[4], int quality);

/* Obsolete */
extern IMAGING_EXPORT int ImagingToString(Imaging im, int orientation, char *buffer);
extern IMAGING_EXPORT int ImagingFromString(Imaging im, int orientation, char *buffer);


/* File I/O */
/* -------- */

/* Built-in drivers */
extern IMAGING_EXPORT Imaging ImagingOpenPPM(const char* filename);
extern IMAGING_EXPORT int ImagingSavePPM(Imaging im, const char* filename);

/* Utility functions */
extern IMAGING_EXPORT UINT32 ImagingCRC32(UINT32 crc, UINT8* buffer, int bytes);

/* Codecs */
struct ImagingCodecStateInstance;
#define ImagingCodecState struct ImagingCodecStateInstance *
typedef int (*ImagingCodec)(Imaging im, ImagingCodecState state,
                            UINT8* buffer, int bytes);

extern IMAGING_EXPORT int ImagingBcnDecode(Imaging im, ImagingCodecState state,
                            UINT8* buffer, Py_ssize_t bytes);
extern IMAGING_EXPORT int ImagingBitDecode(Imaging im, ImagingCodecState state,
                            UINT8* buffer, Py_ssize_t bytes);
extern IMAGING_EXPORT int ImagingEpsEncode(Imaging im, ImagingCodecState state,
                            UINT8* buffer, int bytes);
extern IMAGING_EXPORT int ImagingFliDecode(Imaging im, ImagingCodecState state,
                            UINT8* buffer, Py_ssize_t bytes);
extern IMAGING_EXPORT int ImagingGifDecode(Imaging im, ImagingCodecState state,
                            UINT8* buffer, Py_ssize_t bytes);
extern IMAGING_EXPORT int ImagingGifEncode(Imaging im, ImagingCodecState state,
                            UINT8* buffer, int bytes);
extern IMAGING_EXPORT int ImagingHexDecode(Imaging im, ImagingCodecState state,
                            UINT8* buffer, Py_ssize_t bytes);
#ifdef  HAVE_LIBJPEG
extern IMAGING_EXPORT int ImagingJpegDecode(Imaging im, ImagingCodecState state,
                             UINT8* buffer, Py_ssize_t bytes);
extern IMAGING_EXPORT int ImagingJpegDecodeCleanup(ImagingCodecState state);
extern IMAGING_EXPORT int ImagingJpegUseJCSExtensions(void);

extern IMAGING_EXPORT int ImagingJpegEncode(Imaging im, ImagingCodecState state,
                             UINT8* buffer, int bytes);
#endif
#ifdef HAVE_OPENJPEG
extern IMAGING_EXPORT int ImagingJpeg2KDecode(Imaging im, ImagingCodecState state,
                               UINT8* buffer, Py_ssize_t bytes);
extern IMAGING_EXPORT int ImagingJpeg2KDecodeCleanup(ImagingCodecState state);
extern IMAGING_EXPORT int ImagingJpeg2KEncode(Imaging im, ImagingCodecState state,
                               UINT8* buffer, int bytes);
extern IMAGING_EXPORT int ImagingJpeg2KEncodeCleanup(ImagingCodecState state);
#endif
#ifdef  HAVE_LIBTIFF
extern IMAGING_EXPORT int ImagingLibTiffDecode(Imaging im, ImagingCodecState state,
                                UINT8* buffer, Py_ssize_t bytes);
extern IMAGING_EXPORT int ImagingLibTiffEncode(Imaging im, ImagingCodecState state,
                                UINT8* buffer, int bytes);
#endif
#ifdef  HAVE_LIBMPEG
extern IMAGING_EXPORT int ImagingMpegDecode(Imaging im, ImagingCodecState state,
                             UINT8* buffer, Py_ssize_t bytes);
#endif
extern IMAGING_EXPORT int ImagingMspDecode(Imaging im, ImagingCodecState state,
                            UINT8* buffer, Py_ssize_t bytes);
extern IMAGING_EXPORT int ImagingPackbitsDecode(Imaging im, ImagingCodecState state,
                                 UINT8* buffer, Py_ssize_t bytes);
extern IMAGING_EXPORT int ImagingPcdDecode(Imaging im, ImagingCodecState state,
                            UINT8* buffer, Py_ssize_t bytes);
extern IMAGING_EXPORT int ImagingPcxDecode(Imaging im, ImagingCodecState state,
                            UINT8* buffer, Py_ssize_t bytes);
extern IMAGING_EXPORT int ImagingPcxEncode(Imaging im, ImagingCodecState state,
                            UINT8* buffer, int bytes);
extern IMAGING_EXPORT int ImagingRawDecode(Imaging im, ImagingCodecState state,
                            UINT8* buffer, Py_ssize_t bytes);
extern IMAGING_EXPORT int ImagingRawEncode(Imaging im, ImagingCodecState state,
                            UINT8* buffer, int bytes);
extern IMAGING_EXPORT int ImagingSgiRleDecode(Imaging im, ImagingCodecState state,
                               UINT8* buffer, Py_ssize_t bytes);
extern IMAGING_EXPORT int ImagingSgiRleDecodeCleanup(ImagingCodecState state);
extern IMAGING_EXPORT int ImagingSunRleDecode(Imaging im, ImagingCodecState state,
                               UINT8* buffer, Py_ssize_t bytes);
extern IMAGING_EXPORT int ImagingTgaRleDecode(Imaging im, ImagingCodecState state,
                               UINT8* buffer, Py_ssize_t bytes);
extern IMAGING_EXPORT int ImagingTgaRleEncode(Imaging im, ImagingCodecState state,
                               UINT8* buffer, int bytes);
extern IMAGING_EXPORT int ImagingXbmDecode(Imaging im, ImagingCodecState state,
                            UINT8* buffer, Py_ssize_t bytes);
extern IMAGING_EXPORT int ImagingXbmEncode(Imaging im, ImagingCodecState state,
                            UINT8* buffer, int bytes);
#ifdef  HAVE_LIBZ
extern IMAGING_EXPORT int ImagingZipDecode(Imaging im, ImagingCodecState state,
                            UINT8* buffer, Py_ssize_t bytes);
extern IMAGING_EXPORT int ImagingZipDecodeCleanup(ImagingCodecState state);
extern IMAGING_EXPORT int ImagingZipEncode(Imaging im, ImagingCodecState state,
                            UINT8* buffer, int bytes);
extern IMAGING_EXPORT int ImagingZipEncodeCleanup(ImagingCodecState state);
#endif

typedef void (*ImagingShuffler)(UINT8* out, const UINT8* in, int pixels);

/* Public shufflers */
extern IMAGING_EXPORT void ImagingPackBGR(UINT8* out, const UINT8* in, int pixels);
extern IMAGING_EXPORT void ImagingUnpackYCC(UINT8* out, const UINT8* in, int pixels);
extern IMAGING_EXPORT void ImagingUnpackYCCA(UINT8* out, const UINT8* in, int pixels);

extern IMAGING_EXPORT void ImagingConvertRGB2YCbCr(UINT8* out, const UINT8* in, int pixels);
extern IMAGING_EXPORT void ImagingConvertYCbCr2RGB(UINT8* out, const UINT8* in, int pixels);

extern IMAGING_EXPORT ImagingShuffler ImagingFindUnpacker(const char* mode,
                                           const char* rawmode, int* bits_out);
extern IMAGING_EXPORT ImagingShuffler ImagingFindPacker(const char* mode,
                                         const char* rawmode, int* bits_out);

struct ImagingCodecStateInstance {
    int count;
    int state;
    int errcode;
    int x, y;
    int ystep;
    int xsize, ysize, xoff, yoff;
    ImagingShuffler shuffle;
    int bits, bytes;
    UINT8 *buffer;
    void *context;
    PyObject *fd;
};



/* Codec read/write python fd */
extern Py_ssize_t _imaging_read_pyFd(PyObject *fd, char* dest, Py_ssize_t bytes);
extern Py_ssize_t _imaging_write_pyFd(PyObject *fd, char* src, Py_ssize_t bytes);
extern int _imaging_seek_pyFd(PyObject *fd, Py_ssize_t offset, int whence);
extern Py_ssize_t _imaging_tell_pyFd(PyObject *fd);



/* Errcodes */
#define IMAGING_CODEC_END        1
#define IMAGING_CODEC_OVERRUN   -1
#define IMAGING_CODEC_BROKEN    -2
#define IMAGING_CODEC_UNKNOWN   -3
#define IMAGING_CODEC_CONFIG    -8
#define IMAGING_CODEC_MEMORY    -9



#include "ImagingUtils.h"
extern UINT8 *clip8_lookups;


#if defined(__cplusplus)
}
#endif
