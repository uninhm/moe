import std/unittest
import moepkg/[settings, unicodeext, register, clipboard]
include moepkg/[platform]

proc initRegister(
  buffer: seq[Rune],
  settings: EditorSettings): Registers {.compiletime.} =

  result.addRegister(buffer, settings)

proc initRegister(
  buffer: seq[seq[Rune]],
  settings: EditorSettings): Registers {.compiletime.} =

  result.addRegister(buffer, settings)

suite "Editor: Send to clipboad":
  test "Send string to clipboard 1 (xsel)":
    const
      buffer = @[ru "Clipboard test"]
      tool = ClipboardToolOnLinux.xsel

    sendToClipboard(buffer, tool)

    let p = initPlatform()
    if (p == Platforms.linux or
        p == Platforms.wsl):
      let
        cmd = if p == Platforms.linux:
                execCmdEx("xsel -o")
              else:
                # On the WSL
                execCmdEx("powershell.exe -Command Get-Clipboard")
        (output, exitCode) = cmd

      check exitCode == 0
      if p == Platforms.linux:
        check output[0 .. output.high - 1] == $buffer
      else:
        # On the WSL
        check output[0 .. output.high - 2] == $buffer

  test "Send string to clipboard 1 (xclip)":
    const
      buffer = @[ru "Clipboard test"]
      tool = ClipboardToolOnLinux.xclip

    sendToClipboard(buffer, tool)

    let p = initPlatform()
    if (p == Platforms.linux or
        p == Platforms.wsl):
      let
        cmd = if p == Platforms.linux:
                execCmdEx("xclip -o")
              else:
                # On the WSL
                execCmdEx("powershell.exe -Command Get-Clipboard")
        (output, exitCode) = cmd

      check exitCode == 0
      if p == Platforms.linux:
        check output[0 .. output.high - 1] == $buffer
      else:
        # On the WSL
        check output[0 .. output.high - 2] == $buffer

  test "Send string to clipboard 2 (xsel)":
    const
      buffer = @[ru "`````"]
      tool = ClipboardToolOnLinux.xsel

    sendToClipboard(buffer, tool)

    let p = initPlatform()
    if (p == Platforms.linux or
        p == Platforms.wsl):
      let
        cmd = if p == Platforms.linux:
                execCmdEx("xsel -o")
              else:
                # On the WSL
                execCmdEx("powershell.exe -Command Get-Clipboard")
        (output, exitCode) = cmd

      check exitCode == 0
      if p == Platforms.linux:
        check output[0 .. output.high - 1] == $buffer
      else:
        # On the WSL
        check output[0 .. output.high - 2] == $buffer

  test "Send string to clipboard 2 (xclip)":
    const
      buffer = @[ru "`````"]
      tool = ClipboardToolOnLinux.xclip

    sendToClipboard(buffer, tool)

    let p = initPlatform()
    if (p == Platforms.linux or
        p == Platforms.wsl):
      let
        cmd = if p == Platforms.linux:
                execCmdEx("xclip -o")
              else:
                # On the WSL
                execCmdEx("powershell.exe -Command Get-Clipboard")
        (output, exitCode) = cmd

      check exitCode == 0
      if p == Platforms.linux:
        check output[0 .. output.high - 1] == $buffer
      else:
        # On the WSL
        check output[0 .. output.high - 2] == $buffer

  test "Send string to clipboard 3 (xsel)":
    const
      buffer = @[ru "$Clipboard test"]
      tool = ClipboardToolOnLinux.xsel

    sendToClipboard(buffer, tool)

    let p = initPlatform()
    if (p == Platforms.linux or
        p == Platforms.wsl):
      let
        cmd = if p == Platforms.linux:
                execCmdEx("xsel -o")
              else:

                # On the WSL
                execCmdEx("powershell.exe -Command Get-Clipboard")
        (output, exitCode) = cmd

      check exitCode == 0
      if p == Platforms.linux:
        check output[0 .. output.high - 1] == $buffer
      else:
        # On the WSL
        check output[0 .. output.high - 2] == $buffer

  test "Send string to clipboard 3 (xclip)":
    const
      buffer = @[ru "$Clipboard test"]
      tool = ClipboardToolOnLinux.xclip

    sendToClipboard(buffer, tool)

    let p = initPlatform()
    if (p == Platforms.linux or
        p == Platforms.wsl):
      let
        cmd = if p == Platforms.linux:
                execCmdEx("xclip -o")
              else:

                # On the WSL
                execCmdEx("powershell.exe -Command Get-Clipboard")
        (output, exitCode) = cmd

      check exitCode == 0
      if p == Platforms.linux:
        check output[0 .. output.high - 1] == $buffer
      else:
        # On the WSL
        check output[0 .. output.high - 2] == $buffer


