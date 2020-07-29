; Allow normal CapsLock functionality to be toggled by Alt+CapsLock:
!CapsLock::
    GetKeyState, capsstate, CapsLock, T ;(T indicates a Toggle. capsstate is an arbitrary varible name)
    if capsstate = U
        SetCapsLockState, AlwaysOn
    else
        SetCapsLockState, AlwaysOff
    return


; A function to escape characters like & for use in URLs.
uriEncode(str) {
    f = %A_FormatInteger%
    SetFormat, Integer, Hex
    If RegExMatch(str, "^\w+:/{0,2}", pr)
        StringTrimLeft, str, str, StrLen(pr)
    StringReplace, str, str, `%, `%25, All
    Loop
        If RegExMatch(str, "i)[^\w\.~%/:]", char)
           StringReplace, str, str, %char%, % "%" . SubStr(Asc(char),3), All
        Else Break
    SetFormat, Integer, %f%
    Return, pr . str
}

!Up::Send {Volume_Up 2}
!Down::Send {Volume_Down 2}

; https://autohotkey.com/board/topic/10412-paste-plain-text-and-copycut/?p=65585
; ^#v::                            ; Text–only paste from ClipBoard
;    Clip0 = %ClipBoardAll%
;    ClipBoard = %ClipBoard%       ; Convert to text
;    Send ^v                       ; For best compatibility: SendPlay
;    Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
;    ClipBoard = %Clip0%           ; Restore original ClipBoard
;    VarSetCapacity(Clip0, 0)      ; Free memory
; Return
; ^#c::                            ; Text-only cut/copy to ClipBoard
;    Clip0 = %ClipBoardAll%
;    ClipBoard =
;    StringRight x,A_ThisHotKey,1  ; C or X
;    Send ^%x%                     ; For best compatibility: SendPlay
;    ClipWait 2                    ; Wait for text, up to 2s
;    If ErrorLevel
;       ClipBoard = %Clip0%        ; Restore original ClipBoard
;    Else
;       ClipBoard = %ClipBoard%    ; Convert to text
;    VarSetCapacity(Clip0, 0)      ; Free memory 
; Return