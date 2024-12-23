^q:: ; Triggered when Ctrl+T is pressed
{
    ; Save current clipboard content
    ClipboardBackup := ClipboardAll()

    ; Clear the clipboard
    Clipboard := ""

    ; Simulate Ctrl+C to copy selected text
    A_Clipboard := ""  ; Start off empty to allow ClipWait to detect when the text has arrived.
    Send "^c"
    ClipWait  ; Wait for the clipboard to contain text.


    Prefixed := "Find a verse in King James Version for the following Slovak verse: "
    A_Clipboard := Prefixed . A_Clipboard

    ;MsgBox "Control-C copied the following contents to the clipboard:`n`n" A_Clipboard


    ; Define the program's window title or executable name (adjust as needed)
    TargetProgramTitle := "Keyboard Shortcut PowerShell Script" ; Replace with the title of the target app
    TargetProgramExe := "ChatGPT.exe"          ; Replace with the executable name of the target app

    ; Check if the program is already running
    if !WinExist(TargetProgramTitle)
    {
        ; Launch the program if not already running
        Run(TargetProgramExe)
        ; Wait for the window to appear
        WinWait(TargetProgramTitle, , 5)
    }

    ; Activate the program's window
    WinActivate(TargetProgramTitle)

    ; Wait until the window is active
    if !WinActive(TargetProgramTitle)
    {
        MsgBox("Failed to activate the target program.")
        return
    }

    ; Send the clipboard content to the program
    Send(A_Clipboard)
    Send("{Enter}")

}


