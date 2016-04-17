#include "bmpFile.bi"

dim as bmpFile file

printf(!"Blockland Heightmap to .BLS converter\nBy: Auios\n")
'input !"File name: ", file.fileName
file.setFileName("test.bmp")

file.getData()

