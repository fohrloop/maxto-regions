# maxtoRegions

[![Video: maxtoRegions in practice](https://media.giphy.com/media/xUOxf6w8BxyfMFgITK/giphy.gif)](https://nodesource.com/products/nsolid)

A simple [AutoHotkey](https://autohotkey.com/) & [Python](https://www.python.org/) powered script to make changing [MaxTo](https://maxto.net/) region profiles even faster. This script is for you, if you **use two or more region profiles** (in "main" or/and in "alternate"). By default, this script assumes two "main" region profiles; `two` and `three`, and two "alternate" region profiles `sublime` and `terminals`. These have shortkeys `Win + Numpad1 / NumPad3` and `Alt + Numpad1 / Numpad3`, respectively.

### What does it do?

By pressing a keystroke, you can change your MaxTo region profile (the "main" or "alternate"). Basically what the script does, is to open the "Changing Regions" window (For "main" or "alternate"), presses "Load Profile"-button, chooses the profile of your choise, presses "Load"-button and presses "Done".

### Requirements

You will need Autohotkey, Python 3 and MaxTo. You will also need to install the pywinauto package. This script is meant only for Windows.

## 1) Installation & Setup

1. If you do not have Python 3 installed, you should do it first. You may for example use the [Anaconda](https://anaconda.org/) distribution. The folders for python executable (python.exe) and pip (pip.exe) must be added to your PATH environmental variable. Note that editing `PATH` requires relogin or reboot. When `python`and `pip` commands are available for you on the command line, your Python config is ok.
2. Install [pywinauto](https://github.com/pywinauto/pywinauto) for python.

```sh
> pip install pywinauto
```

3. Install [AutoHotkey](https://autohotkey.com/). Place a main (e.g. `myscript.ahk`) into folder of you choice. Then, into top section of your main AHK file insert the line:
   `#include %A_ScriptDir%\maxto-regions\maxtoRegions.ahk`
4. Add the `maxto-regions` folder (from this repo) into same folder where your main AHK script (`myscript.ahk`) is.
5. Start or reload your main AHK script. (double-click on the `myscript.ahk`, or from the AHK status bar icon: right-click -> Reload This Script)
6. Configure the MaxTo hotkeys:
   * Right click the MaxTo status bar icon
   * Options -> Hotkeys -> Miscellaneous. Edit these two hotkeys\*
     * Edit main regions: `Alt + Control + Shift + Windows + Multiply`
     * Edit alternate regions: `Alt + Control + Shift + Windows + Divide`
7. Add "Region profiles" to MaxTo.
   * By default the main region profiles must be called `two` and `three`
   * By default the alternate region profiles must be called `sublime` and `terminals`
   * See also: "Editing region profiles (names, number of profiles)"

\* The `Multiply` and `Divide` are the numpad multiply and divide keys. See also: "Using custom hotkey for Editing regions".

### 1.2) Using custom hotkey for Editing regions

If you wish to use any other hotkey for `Edit main regions` or `Edit alternate regions`, then set them in the MaxTo Options, and edit the maxtoRegions.ahk file at "`; Send the "Edit main regions" -hotkey`" and "`; Send the "Edit alternate regions" -hotkey`".

### 1.3) Editing region profiles (names, number of profiles)

The script is setup to be used with two main region profiles (two and three) and two alternate region profiles (sublime & terminals).

**1.3.1) Names**

If you want use region profiles with different names, you will have to edit the respective line of the `maxtoRegions.ahk`. For example to change the name of the `sublime` profile to `vscode`, you would change

```
Run "python" "%A_ScriptDir%\maxto-regions\changeregion.py" "sublime",,Hide
```

to

```
Run "python" "%A_ScriptDir%\maxto-regions\changeregion.py" "vscode",,Hide
```

**1.3.2) Number of profiles**

Doable. Just add more cases to the `if..else` block in the `maxtoRegions.ahk`, and add a new hotkey to handle the new case. For example, adding profile `newprofile` to `main` region profiles:

```
if (N = 1) {
    Run "python" "%A_ScriptDir%\maxto-regions\changeregion.py" "two",,Hide
    }
    Else if (N = 4) {
    Run "python" "%A_ScriptDir%\maxto-regions\changeregion.py" "newprofile",,Hide
    }
    Else {
    Run "python" "%A_ScriptDir%\maxto-regions\changeregion.py" "three",,Hide
    }
```

and then add hotkey:

```
#Numpad4:: ;Win+NumPad4
    OpenEditRegions("main", 4)
Return
```

### 1.4) Changing hotkeys

Also quite simple. Just edit the `maxtoRegions.ahk` file. For example changing the hotkey for the profile `two` of the `main` region profile, from "Win+Numpad1" to "Ctrl+Alt+P" change

```
#Numpad1:: ;Win+NumPad1
    OpenEditRegions("main", 1)
Return
```

to

```
^!P::
    OpenEditRegions("main", 1)
Return
```

In autohotkey `#` means Windows key, `!` means Alt, `+` means Shift, and `^` means Control, and `;` is used for comments. For full reference, see the Autohotkey [Hotkeys reference](https://autohotkey.com/docs/Hotkeys.htm).

## 2) Usage

To use the script, you must always have your AHK script running in the background. It is wise to add your `myscript.ahk` to start automatically when Windows starts.

### 2.1) The default shortcuts

* `Win+Numpad1`: Change the `main` region profile to be `two`
* `Win+Numpad3`: Change the `main` region profile to be `three`
* `Alt+Numpad1`: Change the `alternate` region profile to be `sublime`
* `Alt+Numpad3`: Change the `alternate` region profile to be `terminals`

to change your shortcuts and/or profile names, see sections 1.3 and 1.4.

### Other notes

_This software works most of the time, but it is not bulletproof_. Feel free to contribute, if you have ideas.

### Contributions

Just open an issue, and let's talk about it :)

## License

MIT
