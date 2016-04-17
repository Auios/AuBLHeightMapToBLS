#pragma once

#include "fbgfx.bi"
#include "crt.bi"
#include "file.bi"

type bmpFile
    private:
    fileName as string
    bmpWidth as ulong
    bmpHeight as ulong
    image as fb.image ptr
    
    public:
    declare sub getData(fileName as string)
    declare function exists() as boolean
    declare function getFileName() as string
    declare function getWidth() as ulong
    declare function getHeight() as ulong
    declare sub exportToText()
    declare sub cleanUp()
    declare sub display()
end type

function bmpFile.getFileName() as string
    return this.fileName
end function

function bmpFile.getWidth() as ulong
    return bmpWidth
end function

function bmpFile.getHeight() as ulong
    return bmpHeight
end function

sub bmpFile.exportToText()
    dim as integer ff = freefile
    open this.fileName for input as #ff
    close #ff
end sub

sub bmpFile.cleanUp()
    imageDestroy(this.image)
end sub

function bmpFile.exists() as boolean
    if(len(this.fileName)) then
        if(fileExists(this.fileName)) then
            return true
        end if
    end if
    return false
end function

sub bmpFile.getData(fileName as string)
    dim as integer ff = freeFile()
    
    this.fileName = fileName
    if(this.exists()) then
        screenres(640,480,32,1)
        open this.fileName for input as #ff
        get #ff, 19, this.bmpWidth
        get #ff, 23, this.bmpHeight
        close #ff
        image = imageCreate(this.getWidth(),this.getHeight())
        bload this.fileName, image
    else
        printf(!"File does not exist!\n")
    end if
end sub

sub bmpFile.display()
    dim as uinteger pixel
    
    for yy as integer = 0 to this.getHeight()-1
        for xx as integer = 0 to this.getWidth()-1
            pixel = point(xx,yy,image)
            pset(xx,yy),pixel
        next xx
    next yy
end sub
