; --------------------------------------------------------------
; MaxTo regions v. 1.0.0
; (c) Niko Pasanen 2017
; Licence: MIT
; --------------------------------------------------------------


OpenEditRegions(region, N) { 

    if ("main" = region) {
        ; Send the "Edit main regions" -hotkey
        Send, {Ctrl Down}{Alt Down}{Shift Down}{LWin Down}{NumpadMult}{Ctrl Up}{Alt Up}{Shift Up}{LWin Up}
        if (N = 1) {
            Run "python" "%A_ScriptDir%\maxto-regions\changeregion.py" "two",,Hide
        }
        Else {
            Run "python" "%A_ScriptDir%\maxto-regions\changeregion.py" "three",,Hide
        }
        
    }
    Else {
        ; Send the "Edit alternate regions" -hotkey
        Send, {Ctrl Down}{Alt Down}{Shift Down}{LWin Down}{NumpadDiv}{Ctrl Up}{Alt Up}{Shift Up}{LWin Up}
        if (N = 1) {
            Run "python" "%A_ScriptDir%\maxto-regions\changeregion.py" "sublime",,Hide
        }
        Else {
            Run "python" "%A_ScriptDir%\maxto-regions\changeregion.py" "terminals",,Hide
        }
    }
}


#Numpad1:: ;Win+NumPad1
    OpenEditRegions("main", 1)
Return


#Numpad3:: ;Win+NumPad3
    OpenEditRegions("main", 3)
Return


!Numpad1:: ;Alt+Numpad1
    OpenEditRegions("alternate", 1)
Return

!Numpad3:: ;Alt+Numpad3
    OpenEditRegions("alternate", 3)
Return