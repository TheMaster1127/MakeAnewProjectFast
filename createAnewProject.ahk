;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#singleinstance force
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;;;;;;;;;;;;;;;;;;;;;

Sleep, 100

if not A_IsAdmin
{
Run *RunAs "%A_ScriptFullPath%" ; (A_AhkPath is usually optional if the script has the .ahk extension.) You would typically check  first.
}
StartTime := A_TickCount

; no spaces
ProjectName := "THE_AI_COMBINE_2.0_IN_AHK"
; line 1 Token
; line 2 UserName
; line 3 Email

FileReadLine, token, MyData.txt, 1
FileReadLine, UserName, MyData.txt, 2
FileReadLine, Email, MyData.txt, 3


; Specify the directory path
dirPath := "C:\Users\The_M\OneDrive\Desktop\GitHub Projects\" . ProjectName

; Check if the directory exists
if (FileExist(dirPath))
{
;MsgBox, The directory exists!

exists := 1
}
else
{
;MsgBox, The directory does not exist.
exists := 0
FileCreateDir, C:\Users\The_M\OneDrive\Desktop\GitHub Projects\%ProjectName%
}

Sleep, 300


ReadMeText =
(
"This is a new project called %ProjectName%"
)



LICENCE =
(
MIT License

Copyright (c) %A_Year% %UserName%

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
)








Sleep, 300
sendThisToCMD =
(
cd C:\Users\The_M\OneDrive\Desktop\GitHub Projects\%ProjectName%
git init

git branch -m main

git add .

git commit -m "Initial commit"

git branch -m master main



set GITHUB_TOKEN=%token%

hub create
hub create

git config --global user.name "%UserName%"
git config --global user.email "%Email%"

git remote add origin https://github.com/TheMaster1127/%ProjectName%.git

git clone https://github.com/TheMaster1127/%ProjectName%.git


hub api -X PATCH -H "Authorization: token $GITHUB_TOKEN" -F "%ReadMeText%" /repos/%UserName%/%ProjectName%


)
FileDelete, tempGitScript.bat
FileAppend, %sendThisToCMD%, tempGitScript.bat
Sleep, 500
RunWait, tempGitScript.bat


if (exists = 1)
{


ErrorCount := MoveFilesAndFolders("C:\Users\The_M\OneDrive\Desktop\GitHub Projects\" . ProjectName . "\*.*", "C:\Users\The_M\OneDrive\Desktop\GitHub Projects\" . ProjectName . "\" . ProjectName)
if (ErrorCount != 0)
    MsgBox %ErrorCount% files/folders could not be moved.


MoveFilesAndFolders(SourcePattern, DestinationFolder, DoOverwrite = false)
; Moves all files and folders matching SourcePattern into the folder named DestinationFolder and
; returns the number of files/folders that could not be moved. This function requires [v1.0.38+]
; because it uses FileMoveDir's mode 2.
{
    if (DoOverwrite = 1)
        DoOverwrite := 2  ; See FileMoveDir for description of mode 2 vs. 1.
    ; First move all the files (but not the folders):
    FileMove, %SourcePattern%, %DestinationFolder%, %DoOverwrite%
    ErrorCount := ErrorLevel
    ; Now move all the folders:
    Loop, %SourcePattern%, 2  ; 2 means "retrieve folders only".
    {
        FileMoveDir, %A_LoopFileFullPath%, %DestinationFolder%\%A_LoopFileName%, %DoOverwrite%
        ErrorCount += ErrorLevel
        if ErrorLevel  ; Report each problem folder by name.
            MsgBox Could not move %A_LoopFileFullPath% into %DestinationFolder%.
    }
    return ErrorCount
}



sendThisToCMD =
(
cd C:\Users\The_M\OneDrive\Desktop\GitHub Projects\%ProjectName%\%ProjectName%
git init

git branch -m main

git add .

git commit -m "Added files"


git push origin main

)
FileDelete, tempGitScript.bat
FileAppend, %sendThisToCMD%, tempGitScript.bat
Sleep, 500
RunWait, tempGitScript.bat

Sleep, 300

}



FileAppend, %ReadMeText%, C:\Users\The_M\OneDrive\Desktop\GitHub Projects\%ProjectName%\%ProjectName%\README.md
Sleep, 100


Sleep, 300
sendThisToCMD =
(
cd C:\Users\The_M\OneDrive\Desktop\GitHub Projects\%ProjectName%\%ProjectName%
git init

git branch -m main

git add .

git commit -m "Create README.md"


git push origin main

)
FileDelete, tempGitScript.bat
FileAppend, %sendThisToCMD%, tempGitScript.bat
Sleep, 500
RunWait, tempGitScript.bat

Sleep, 300




FileAppend, %LICENCE%, C:\Users\The_M\OneDrive\Desktop\GitHub Projects\%ProjectName%\%ProjectName%\LICENCE
Sleep, 100


Sleep, 300
sendThisToCMD =
(
cd C:\Users\The_M\OneDrive\Desktop\GitHub Projects\%ProjectName%\%ProjectName%

git add .

git commit -m "Added a LICENCE"

git push origin main

)
FileDelete, tempGitScript.bat
FileAppend, %sendThisToCMD%, tempGitScript.bat
Sleep, 500
RunWait, tempGitScript.bat

Sleep, 300




Run, https://github.com/%UserName%

ElapsedTime := A_TickCount - StartTime


ms := ElapsedTime
; Calculate the components
hours := Floor(ms / 3600000)
ms := Mod(ms, 3600000)
minutes := Floor(ms / 60000)
ms := Mod(ms, 60000)
seconds := Floor(ms / 1000)
milliseconds := Mod(ms, 1000)

; Display the result
ElapsedTime123 := ""
ElapsedTime123 .= hours "h " minutes "m " seconds "s " milliseconds "ms"

MsgBox, 262144, , Done in %ElapsedTime123%
ExitApp
