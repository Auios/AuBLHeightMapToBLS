#include "bmpFile.bi"

dim as bmpFile file

printf(!"Blockland Heightmap to .BLS converter\nBy: Auios\n")
'input !"File name: ", file.fileName

file.getData("map.bmp")

'file.display()
file.exportToText()
file.cleanUp()