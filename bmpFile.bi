#pragma once

#include "crt.bi"
#include "file.bi"

type bmpFile
    private:
    fileName as string
    bmpWidth as ulong
    bmpHeight as ulong
    
    public:
    declare sub setFileName(fileName as string)
    declare sub getData()
    declare function exists() as boolean
    declare function getFileName() as string
    declare function getWidth() as ulong
    declare function getHeight() as ulong
end type

sub bmpFile.setFileName(fileName as string)
    this.fileName = fileName
end sub

sub bmpFile.getData()
    dim as integer fileNum = freeFile()
    
    if(open(this.fileName for input as #fileNum)) then
        printf(!"Error opening file\n")
        end(-1)
    end if
    
    get #fileNum, 19, this.bmpWidth
    get #fileNum, 23, this.bmpHeight
    
    close #fileNum
end sub

function bmpFile.exists() as boolean
    if(this.fileName = "") then
        return false
    else
        if(fileExists(this.fileName) = false) then
            return false
        end if
    end if
end function

function bmpFile.getFileName() as string
    return this.fileName
end function

function bmpFile.getWidth() as ulong
    return bmpWidth
end function

function bmpFile.getHeight() as ulong
    return bmpHeight
end function
