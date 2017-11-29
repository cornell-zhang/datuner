#include <iostream>

#include "imageLib/imageLib.h"

int main(int argc, char *argv[])
{
  if (argc != 3) {
    std::cout << "Usage: convert <in> <out>" << std::endl;
    return -1;
  }
  CByteImage img;
  ReadImage(img, argv[1]);
  WriteImage(img, argv[2]);
  return 0;
}
