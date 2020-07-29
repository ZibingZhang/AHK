; Created by Asger Juul BRunshøj

; Note: Save with encoding UTF-8 with BOM if possible.
; I had issues with special characters like in ¯\_(ツ)_/¯ that wouldn't work otherwise.
; Notepad will save UTF-8 files with BOM automatically (even though it does not say so).
; Some editors however save without BOM, and then special characters look messed up in the AHK GUI.

; Write your own AHK commands in this file to be recognized by the GUI. Take inspiration from the samples provided here.

;-------------------------------------------------------------------------------
;;; SEARCH GOOGLE ;;;
;-------------------------------------------------------------------------------
if Command = g%A_Space% ; Search Google
{
    gui_search_title = Google
    gui_search(cYellow, "https://www.google.com/search?num=50&safe=off&site=&source=hp&q=REPLACEME&btnG=Search&oq=&gs_l=")
}
; else if Pedersen = m%A_Space% ; Open more than one URL
; {
;     gui_search_title = multiple
;     gui_search("https://www.google.com/search?&q=REPLACEME")
;     gui_search("https://www.bing.com/search?q=REPLACEME")
;     gui_search("https://duckduckgo.com/?q=REPLACEME")
; }
; else if Command = x%A_Space% ; Search Google as Incognito
;   A note on how this works:
;   The function name "gui_search()" is poorly chosen.
;   What you actually specify as the parameter value is a command to Run. It does not have to be a URL.
;   Before the command is Run, the word REPLACEME is replaced by your input.
;   It does not have to be a search url, that was just the application I had in mind when I originally wrote it.
;   So what this does is that it Runs chrome with the arguments "-incognito" and the google search URL where REPLACEME in the URL has been replaced by your input.
; {
;     gui_search_title = Google Search as Incognito
;     gui_search("C:\Program Files\Mozilla Firefox\firefox.exe -incognito https://www.google.com/search?safe=off&q=REPLACEME")
; }


;-------------------------------------------------------------------------------
;;; SEARCH OTHER THINGS ;;;
;-------------------------------------------------------------------------------
else if Command = fb%A_Space% ; Search Facebook
{
    gui_search_title = Search Facebook
    gui_search(cBlue, "https://www.facebook.com/search/results.php?q=REPLACEME")
}
else if Command = yt%A_Space% ; Search Youtube
{
    gui_search_title = Search Youtube
    gui_search(cRed, "https://www.youtube.com/results?search_query=REPLACEME")
}


;-------------------------------------------------------------------------------
;;; LAUNCH WEBSITES AND PROGRAMS ;;;
;-------------------------------------------------------------------------------
else if Command = r/ ; Go to subreddit
{
    gui_search_title := "Subreddit"
    gui_search(cBlue, "https://www.reddit.com/r/REPLACEME")
}
else if Command = face ; facebook.com
{
    gui_destroy()
    Run www.facebook.com
}
else if Command = red ; reddit.com
{
    gui_destroy()
    Run www.reddit.com
}
else if Command = cal ; Google Calendar
{
    gui_destroy()
    Run https://www.google.com/calendar
}
else if Command = vs ; VS Code
{
    gui_destroy()
    Run "C:\Users\Zibing\AppData\Local\Programs\Microsoft VS Code\Code.exe"
}
else if Command = note ; Notepad
{
    gui_destroy()
    Run Notepad
}
else if Command = paint ; MS Paint
{
    gui_destroy()
    Run "C:\Windows\system32\mspaint.exe"
}
else if Command = maps ; Google Maps focused on Boston
{
    gui_destroy()
    Run "https://www.google.com/maps/@42.3140089`,-71.2504676`,12z"
}
else if Command = inbox ; Open google inbox
{
    gui_destroy()
    Run https://inbox.google.com/u/0/
    ; Run https://mail.google.com/mail/u/0/#inbox  ; Maybe you prefer the old gmail
}
else if Command = mes ; Opens Facebook unread messages
{
    gui_destroy()
    Run https://www.facebook.com/messages?action=recent-messages
}
else if Command = url ; Open an URL from the clipboard
{
    gui_destroy()
    Run %ClipBoard%
}


;-------------------------------------------------------------------------------
;;; INTERACT WITH THIS AHK SCRIPT ;;;
;-------------------------------------------------------------------------------
else if Command = rel ; Reload this script
{
    gui_destroy() ; removes the GUI even when the reload fails
    Reload
}
else if Command = dir ; Open the directory for this script
{
    gui_destroy()
    Run, %A_ScriptDir%
}
else if Command = host ; Edit host script
{
    gui_destroy()
    Run, notepad.exe "%A_ScriptFullPath%"
}
else if Command = user ; Edit GUI user commands
{
    gui_destroy()
    Run, notepad.exe "%A_ScriptDir%\gui.ahk"
}


;-------------------------------------------------------------------------------
;;; TYPE RAW TEXT ;;;
;-------------------------------------------------------------------------------
else if Command = @ ; Email address
{
    gui_destroy()
    Send, my_email_address@gmail.com
}
else if Command = name ; My name
{
    gui_destroy()
    Send, Zibing Zhang
}
else if Command = phone ; My phone number
{
    gui_destroy()
    SendRaw, +1 (781) 366-7775
}
else if Command = int ; LaTeX integral
{
    gui_destroy()
    SendRaw, \int_0^1  \; \mathrm{d}x\,
}
else if Command = logo ; ¯\_(ツ)_/¯
{
    gui_destroy()
    Send ¯\_(ツ)_/¯
}
else if Command = clip ; Paste clipboard content without formatting
{
    gui_destroy()
    SendRaw, %ClipBoard%
}


;-------------------------------------------------------------------------------
;;; OPEN FOLDERS ;;;
;-------------------------------------------------------------------------------
else if Command = down ; Downloads
{
    gui_destroy()
    Run C:\Users\%A_Username%\Downloads
}
; else if Command = drop ; Dropbox folder (works when it is in the default directory)
; {
;     gui_destroy()
;     Run, C:\Users\%A_Username%\Dropbox\
; }
else if Command = rec ; Recycle Bin
{
    gui_destroy()
    Run ::{645FF040-5081-101B-9F08-00AA002F954E}
}


;-------------------------------------------------------------------------------
;;; MISCELLANEOUS ;;;
;-------------------------------------------------------------------------------
else if Command = ping ; Ping Google
{
    gui_destroy()
    Run, cmd /K "ping www.google.com"
}
else if Command = hosts ; Open hosts file in Notepad
{
    gui_destroy()
    Run notepad.exe C:\Windows\System32\drivers\etc\hosts
}
else if Command = date ; What is the date?
{
    gui_destroy()
    FormatTime, date,, LongDate
    MsgBox %date%
    date =
}
else if Command = week ; Which week is it?
{
    gui_destroy()
    FormatTime, weeknumber,, YWeek
    StringTrimLeft, weeknumbertrimmed, weeknumber, 4
    if (weeknumbertrimmed = 53)
        weeknumbertrimmed := 1
    MsgBox It is currently week %weeknumbertrimmed%
    weeknumber =
    weeknumbertrimmed =
}
else if Command = ? ; Tooltip with list of commands
{
    GuiControl,, Command, ; Clear the input box
    Gosub, gui_commandlibrary
}
