#include "bmpFile.bi"

dim as bmpFile file

printf(!"Blockland Heightmap to .BLS converter\nBy: Auios\n")
'input !"File name: ", file.fileName

'file.getData("2.bmp")
file.getData("earth.bmp")
'file.getData("C:\Users\LoneA\Desktop\Planets\Earth\earthbw.bmp")

'file.display()
'file.exportToText()
file.exportToBLS(0.3)
file.cleanUp()