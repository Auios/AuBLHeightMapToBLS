#include "bmpFile.bi"

dim as bmpFile file

printf(!"Blockland Heightmap to .BLS converter\nBy: Auios\n")
'input !"File name: ", file.fileName

file.getData("2.bmp")

'file.display()
'file.exportToText()
file.exportToBLS(0.5)
file.cleanUp()