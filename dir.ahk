; The NeverEnding dir /s AutoHotkey script :)

; Scammers often open a fake scan on poor Edna's computer. They open a DOS window, and issue
; commands. It's typically done like this -
; Start > Run > cmd
; You'll get a prompt that looks something like C:\Users\username
; The scammers typically type "cd .." a couple times (or cd /), and then type "dir /s".
; It's a legit command but is used by scammers claiming it's a virus scanner. They then type
; something like "VIRUS DETECTED" fooling the victim into thinking they have a virus.

; Let's see what happens when the can't do that.

; First, save the contents of https://pastebin.com/pKC7Gemf to dir.txt
; Then compile this with AutoHotKey, name it dir.exe, and place both files in C:\

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoTrayIcon  ; Disables the showing of the AutoHotKey tray icon.
#SingleInstance

Run, %comspec%,,, PID  ; Opens cmd.exe
Sleep, 50

Loop,
    SendInput, type dir.txt{Enter}
	#IfWinExist ahk_exe cmd.exe
	RControl::return
	LControl::return  ; Prevents ^C from stopping the script
