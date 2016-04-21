#pragma once

#include "fbgfx.bi"
#include "crt.bi"
#include "file.bi"
#include "string.bi"

type bmpFile
    private:
    fileName as string
    bmpWidth as ulong
    bmpHeight as ulong
    image as fb.image ptr
    
    size as uinteger
    
    public:
    declare sub getData(fileName as string)
    declare function exists() as boolean
    declare function getFileName() as string
    declare function getWidth() as ulong
    declare function getHeight() as ulong
    declare function getSize() as uinteger
    declare sub exportToText()
    declare sub exportToBLS(modify as single)
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

sub bmpFile.cleanUp()
    imageDestroy(this.image)
end sub

function bmpFile.getSize() as uinteger
    return this.getWidth() * this.getHeight()
end function

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

sub bmpFile.exportToText()
    dim as uinteger pixel
    dim as string lineStr
    dim as integer ff = freefile
    open "C:\Users\LoneA\Documents\Blockland\saves\SaveTest.bls" for output as #ff
    for yy as integer = 0 to this.getHeight()-1
        for xx as integer = 0 to this.getWidth()-1
            pixel = point(xx,yy,image)
            lineStr += chr(pixel)
        next xx
        print #ff, lineStr + !"\n"
    next yy
    close #ff
end sub

sub bmpFile.exportToBLS(modify as single)
        dim as single highestBrick, lowestBrick, brickHeight
    dim as integer pixel, clr
    dim as integer ff = freefile
    
    open "map.bls" for output as #ff
    
    print #ff, "This is a Blockland save file.  You probably shouldn't modify it cause you'll screw it up."
    print #ff, !"1\n"
    print #ff, "0.486275 0.066667 0.039216 1.000000"
    print #ff, "0.768627 0.066667 0.054902 1.000000"
    print #ff, "0.909804 0.529412 0.501961 1.000000"
    print #ff, "0.713726 0.239216 0.000000 1.000000"
    print #ff, "0.909804 0.447059 0.000000 1.000000"
    print #ff, "0.909804 0.647059 0.474510 1.000000"
    print #ff, "0.658824 0.419608 0.000000 1.000000"
    print #ff, "1.000000 0.749020 0.000000 1.000000"
    print #ff, "0.921569 0.811765 0.600000 1.000000"
    print #ff, "0.109804 0.349020 0.066667 1.000000"
    print #ff, "0.000000 0.600000 0.266667 1.000000"
    print #ff, "0.709804 0.831373 0.603922 1.000000"
    print #ff, "0.109804 0.219608 0.384314 1.000000"
    print #ff, "0.211765 0.419608 0.674510 1.000000"
    print #ff, "0.666667 0.701961 0.803922 1.000000"
    print #ff, "0.301961 0.094118 0.392157 1.000000"
    print #ff, "0.831373 0.266667 0.466667 1.000000"
    print #ff, "0.909804 0.666667 0.674510 1.000000"
    print #ff, "0.137255 0.266667 0.094118 1.000000"
    print #ff, "0.000000 0.309804 0.239216 1.000000"
    print #ff, "0.458824 0.603922 0.266667 1.000000"
    print #ff, "0.164706 0.392157 0.474510 1.000000"
    print #ff, "0.364706 0.592157 0.658824 1.000000"
    print #ff, "0.509804 0.666667 0.686275 1.000000"
    print #ff, "0.694118 0.600000 0.509804 1.000000"
    print #ff, "0.521569 0.431373 0.364706 1.000000"
    print #ff, "0.384314 0.313726 0.274510 1.000000"
    print #ff, "0.266667 0.411765 0.266667 1.000000"
    print #ff, "0.200000 0.439216 0.321569 1.000000"
    print #ff, "0.392157 0.513726 0.294118 1.000000"
    print #ff, "0.384314 0.458824 0.576471 1.000000"
    print #ff, "0.494118 0.603922 0.631373 1.000000"
    print #ff, "0.592157 0.286275 0.231373 1.000000"
    print #ff, "0.458824 0.286275 0.231373 1.000000"
    print #ff, "0.576471 0.403922 0.247059 1.000000"
    print #ff, "0.619608 0.509804 0.309804 1.000000"
    print #ff, "0.886275 0.811765 0.686275 1.000000"
    print #ff, "0.858824 0.737255 0.592157 1.000000"
    print #ff, "0.792157 0.658824 0.486275 1.000000"
    print #ff, "0.647059 0.513726 0.356863 1.000000"
    print #ff, "0.509804 0.368627 0.239216 1.000000"
    print #ff, "0.337255 0.239216 0.149020 1.000000"
    print #ff, "0.200000 0.141176 0.090196 1.000000"
    print #ff, "0.337255 0.239216 0.090196 1.000000"
    print #ff, "0.494118 0.384314 0.203922 1.000000"
    print #ff, "0.984314 0.964706 0.941176 1.000000"
    print #ff, "0.886275 0.866667 0.839216 1.000000"
    print #ff, "0.729412 0.729412 0.686275 1.000000"
    print #ff, "0.603922 0.600000 0.564706 1.000000"
    print #ff, "0.419608 0.431373 0.411765 1.000000"
    print #ff, "0.313726 0.301961 0.286275 1.000000"
    print #ff, "0.176471 0.184314 0.168627 1.000000"
    print #ff, "0.078431 0.078431 0.066667 1.000000"
    print #ff, "0.000000 0.000000 0.000000 1.000000"
    print #ff, "0.839216 0.866667 1.000000 0.529412"
    print #ff, "0.509804 0.741176 1.000000 0.603922"
    print #ff, "0.066667 0.121569 0.203922 0.584314"
    print #ff, "1.000000 1.000000 1.000000 0.003922"
    print #ff, "0.674510 0.639216 0.564706 1.000000"
    print #ff, "0.549020 0.509804 0.431373 1.000000"
    print #ff, "0.403922 0.400000 0.349020 1.000000"
    print #ff, "0.341176 0.313726 0.274510 1.000000"
    print #ff, "0.286275 0.286275 0.258824 1.000000"
    print #ff, "1.000000 0.000000 1.000000 0.000000"
    print #ff, "Linecount " & this.getSize()
    
    for yy as integer = 0 to this.getHeight()-1
        for xx as integer = 0 to this.getWidth()-1
            pixel = point(xx,yy,image)
            brickHeight = (1.5+(pixel * 0.25) * -1)*0.000005
            if(brickHeight > highestBrick) then
                highestBrick = brickHeight
            else
                if(brickHeight < lowestBrick) then
                    lowestBrick = highestBrick
                end if
            end if
        next xx
    next yy
    
    for yy as integer = 0 to this.getHeight()-1
        for xx as integer = 0 to this.getWidth()-1
            pixel = point(xx,yy,image)
            brickHeight = abs(1.5+(pixel * modify)*0.000005)
            'clr = brickHeight/highestBrick
            'print #ff, !"2x6x3\" " & xx & " " & yy & " " & format(brickHeight, ".#") & " 3 1 29  0 0 1 1 1"
            'print #ff, !"2x2x5\" " & xx & " " & yy & " " & format(brickHeight, ".#") & " 3 1 29  0 0 1 1 1"
            print #ff, !"8x Cube\" " & xx*4 & " " & yy*4 & " " & format(brickHeight, ".00") & " 0 1 29  0 0 1 1 1"
        next xx
    next yy
    close #ff
end sub

sub bmpFile.display()
    dim as uinteger pixel
    
    for yy as integer = 0 to this.getHeight()-1
        for xx as integer = 0 to this.getWidth()-1
            pixel = point(xx,yy,image)
            pset(xx,yy),pixel
        next xx
    next yy
    sleep()
end sub
