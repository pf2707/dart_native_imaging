#include "Imaging.h"
#include "blurhash/encode.h"

Imaging imageFromRGBA(int width, int height, uint8_t* data);
const char* imageMode(Imaging im);
int imageWidth(Imaging im);
int imageHeight(Imaging im);
int imageLinesize(Imaging im);
uint8_t* imageBlock(Imaging im);
void jpegEncode(Imaging im, int quality, uint8_t** data, size_t* size);
