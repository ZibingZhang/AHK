;-------------------------------------------------------------------------------
;;; SEARCH WEBSITES ;;;
;-------------------------------------------------------------------------------
if Command = fb%A_Space% ; Search Facebook
{
    gui_search_title = Search Facebook
    gui_search(cBlue, "https://www.facebook.com/search/results.php?q=REPLACEME")
} else if Command = g%A_Space% ; Search Google
{
    gui_search_title = Google
    gui_search(cYellow, "https://www.google.com/search?num=50&safe=off&site=&source=hp&q=REPLACEME&btnG=Search&oq=&gs_l=")
} else if Command = yt%A_Space% ; Search Youtube
{
    gui_search_title = Search Youtube
    gui_search(cRed, "https://www.youtube.com/results?search_query=REPLACEME")
}


;-------------------------------------------------------------------------------
;;; LAUNCH WEBSITES ;;;
;-------------------------------------------------------------------------------
else if Command = cal ; Google Calendar
{
    gui_destroy()
    Run https://www.google.com/calendar
} else if Command = face ; Facebook
{
    gui_destroy()
    Run www.facebook.com
} else if Command = mail ; Gmail
{
    gui_destroy()
    Run https://mail.google.com/mail/u/0/#inbox
} else if Command = maps ; Google Maps
{
    gui_destroy()
    Run https://www.google.com/maps/@42.3140089`,-71.2504676`,12z
} else if Command = mes ; Facebook Messenger
{
    gui_destroy()
    Run https://www.facebook.com/messages?action=recent-messages
} else if Command = r/ ; Go to Subreddit
{
    gui_search_title := "Subreddit"
    gui_search(cOrange, "https://www.reddit.com/r/REPLACEME")
} else if Command = red ; Reddit
{
    gui_destroy()
    Run www.reddit.com
} else if Command = url ; Open URL from Clipboard
{
    gui_destroy()
    Run %ClipBoard%
}


;-------------------------------------------------------------------------------
;;; LAUNCH PROGRAMS ;;;
;-------------------------------------------------------------------------------
else if Command = cmd ; Command Prompt
{
    gui_destroy()
    Run cmd.exe, C:\Users\Zibing\Personal
} else if Command = drr ; DrRacket
{
    gui_destroy()
    Run C:\Program Files\Racket\DrRacket.exe
} else if Command = git ; Git Bash
{
    gui_destroy()
    Run C:\Program Files\Git\git-bash.exe, C:\Users\Zibing\Personal
} else if Command = note ; Notepad
{
    gui_destroy()
    Run Notepad
} else if Command = paint ; MS Paint
{
    gui_destroy()
    Run C:\Windows\system32\mspaint.exe
} else if Command = powe ; Powershell
{
    gui_destroy()
    Run, powershell.exe, C:\Users\Zibing\Personal
} else if Command = pyc ; PyCharm
{
    gui_destroy()
    Run C:\Program Files\JetBrains\PyCharm Community Edition 2020.1.4\bin\pycharm64.exe
} else if Command = rack ; Racket
{
    gui_destroy()
    Run C:\Program Files\Racket\Racket.exe
} else if Command = spot ; Spotify
{
    gui_destroy()
    WinGet, PID, PID, Spotify
    if (%PID% = "")
    { 
        Run Spotify 
    }
    WinActivate, ahk_pid %PID%
} else if Command = vs ; VS Code
{
    gui_destroy()
    Run "C:\Users\Zibing\AppData\Local\Programs\Microsoft VS Code\Code.exe"
}


;-------------------------------------------------------------------------------
;;; INTERACT WITH THIS AHK SCRIPT ;;;
;-------------------------------------------------------------------------------
else if Command = cmds ; Edit User Commands
{
    gui_destroy()
    Run, notepad.exe "%A_ScriptDir%\commands.ahk"
} else if Command = dir ; Open Dir for Script
{
    gui_destroy()
    Run, %A_ScriptDir%
} else if Command = rel ; Reload Script
{
    gui_destroy() ; removes the GUI even when the reload fails
    Reload
}


;-------------------------------------------------------------------------------
;;; TYPE RAW TEXT ;;;
;-------------------------------------------------------------------------------
else if Command = @ ; My Email Address
{
    gui_destroy()
    Send, zibing.zha@gmail.com
} else if Command = clip ; Paste w/o Formatting
{
    gui_destroy()
    SendRaw, %ClipBoard%
} else if Command = int ; LaTeX Integral
{
    gui_destroy()
    SendRaw, \int_0^1  \; \mathrm{d}x\,
} else if Command = name ; My Name
{
    gui_destroy()
    Send, Zibing Zhang
} else if Command = phone ; My Mobile Number
{
    gui_destroy()
    SendRaw, +1 (781) 366-7775
}


;-------------------------------------------------------------------------------
;;; OPEN FOLDERS ;;;
;-------------------------------------------------------------------------------
else if Command = down ; Downloads
{
    gui_destroy()
    Run explorer.exe C:\Users\%A_Username%\Downloads, max
} else if Command = pers ; Personal Dir
{
    gui_destroy()
    Run explorer.exe C:\Users\%A_Username%\Personal, max
} else if Command = rec ; Recycle Bin
{
    gui_destroy()
    Run ::{645FF040-5081-101B-9F08-00AA002F954E}
}


;-------------------------------------------------------------------------------
;;; MISCELLANEOUS ;;;
;-------------------------------------------------------------------------------
else if Command = ? ; List of Commands
{
    if tooltip_state = closed 
    {
        tooltip_state = open
        GuiControl,, Command, ; clear the input box
        Gosub gui_commandlibrary

    } else if tooltip_state = open 
    {
        tooltip_state = closed
        GuiControl,, Command, ; clear the input box
        Gosub gui_tooltip_clear
    }
}  else if Command = date ; Displays the Date
{
    gui_destroy()
    FormatTime, date,, LongDate
    MsgBox %date%
    date =
} else if Command = hosts ; Open Hosts File in Notepad
{
    gui_destroy()
    Run notepad.exe C:\Windows\System32\drivers\etc\hosts
} else if Command = ping ; Ping Google
{
    gui_destroy()
    Run, cmd /K "ping www.google.com"
}
