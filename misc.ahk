; Allow normal CapsLock functionality to be toggled by Alt + CapsLock
!CapsLock::
    GetKeyState, capsstate, CapsLock, T ; (T indicates a toggle, capsstate is an arbitrary varible name)
    if capsstate = U
        SetCapsLockState, AlwaysOn
    else
        SetCapsLockState, AlwaysOff
    return


; Escapes characters (such as &) for use in URLs
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

; Volume control with Alt + Up or Alt + Down to increase or decrease volume
!Up::Send {Volume_Up 2}
!Down::Send {Volume_Down 2}
