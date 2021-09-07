#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ProgressConstants.au3>


#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\tft.ico
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Res_Comment=Made by m1nt.
#AutoIt3Wrapper_Res_ProductName=TFT Auto BOT
#AutoIt3Wrapper_Res_ProductVersion=1.0.0
#AutoIt3Wrapper_Res_CompanyName=Nguyen Huu Minh
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Nguyen Huu Minh

 Script Function:
	Farm tokens automatically.

#ce ----------------------------------------------------------------------------

; Script Start

;THIS IS FOR CODE
;Mouse click delay----------------------------
Opt("MouseClickDelay", 5)
Opt("MouseClickDownDelay", 200)

;Main part--------------------------------------
Global $clientsz = WinGetClientSize("League of Legends") ;get the client width and height
Global $matchlength, $TimeInMs, $Clock
Func autobot($TimeInMs)
	WinActivate("League of Legends")
	While Not WinExists("League of Legends (TM) Client")
		Sleep(1500)
		ControlClick("League of Legends", "", "[Classnn:Chrome_RenderWidgetHostHWND1]", "left", 1, Round(0.5 * $clientsz[0]), Round(0.943 * $clientsz[1]))
		Sleep(1000)
		ControlClick("League of Legends", "", "[Classnn:Chrome_RenderWidgetHostHWND1]", "left", 1, Round(0.419 * $clientsz[0]), Round(0.9541 * $clientsz[1]))
		Sleep(Round(Random(2, 4) * 1000)) ;click the matchmaking button every 3-5sec the time is chose ramdomly between 3-5s
		ControlClick("League of Legends", "", "[Classnn:Chrome_RenderWidgetHostHWND1]", "left", 1, Round(0.5 * $clientsz[0]), Round(0.775 * $clientsz[1]))
	WEnd
	WinWait("League of Legends (TM) Client")
	Sleep(15000) ;wait for the game to exist
	WinActivate("League of Legends (TM) Client")
	Sleep(3000)
	Local $gamesz = WinGetClientSize("League of Legends (TM) Client")
	Local $pxdifference[2] = [Round((@DesktopWidth - $gamesz[0]) / 2), Round((@DesktopHeight - $gamesz[1]) / 2)]
	Local $topmiddle[2] = [@DesktopWidth / 2, ($pxdifference[1] + 3)]
	Local $pxchecksum = PixelChecksum($topmiddle[0] - 5, $topmiddle[1] + 5, $topmiddle[0] + 5, $topmiddle[1] + 10)
	While $pxchecksum = PixelChecksum($topmiddle[0] - 5, $topmiddle[1] + 5, $topmiddle[0] + 5, $topmiddle[1] + 10)
		Sleep(7000) ;every 7 sec check if the game is ready
	WEnd
	Local $timer = TimerInit()
	If $TimeInMs = 0 Then
		$Clock = 900000
	Else
		$Clock = $TimeInMs
	EndIf
	Sleep(59000)
	While TimerDiff($timer) <= $Clock
		For $i = 1 To Random(1, 2, 1)
			MouseClick("left", ($pxdifference[0] + $gamesz[0] * (0.3 + (0.105 * Random(0, 4, 1)))), Round(($gamesz[1] * 0.92) + $pxdifference[1]), 1, 10)
			Sleep(Round(Random(1, 2, 0) * 1000))
		Next
		;MouseClick("right", ($pxdifference[0] + Round($gamesz[0] * (Random(30,40,1) + (20 * Random(0,1,1))))), $pxdifference[1] + Round($gamesz[1] * Random(31,34,0)), 1, 25) =====>   UNKNOWN ERROR
		If TimerDiff($timer) >= 300000 Then
			MouseClick("left", ($pxdifference[0] + Round($gamesz[0] * 0.1914)), ($pxdifference[1] + Round($gamesz[1] * 0.893)), 2, 10)
		EndIf
		Sleep(45000) ;do something every 45 sec
	WEnd
	If $TimeInMs <> 0 Then ;Surrender if the checkbox is checked
		Send("{ENTER}")
		Sleep(500)
		Send("/")
		Sleep(300)
		Send("f")
		Sleep(200)
		Send("f")
		Sleep(500)
		Send("{ENTER}")
		Sleep(500)
		MouseClick("left", ($pxdifference[0] + Round($gamesz[0] * (1-0.54297))), ($pxdifference[1] + Round($gamesz[1] * 0.45139)), 1, 10)
	Else ;Quit the match immediately when HP reaches 0
		While WinExists("League of Legends (TM) Client")
			MouseClick("left", ($pxdifference[0] + Round($gamesz[0] * 0.432)), ($pxdifference[1] + Round($gamesz[1] * 0.493)), 1, 10)
			Sleep(Random(5, 15, 1) * 1000)
		WEnd
	EndIf
	WinWaitClose("League of Legends (TM) Client")
	Sleep(10000)
EndFunc   ;==>autobot

;TERMS OF USE
#Region
$TermsOfUse = GUICreate("Read Before Use", 390, 203, -1, -1)
$Term1 = GUICtrlCreateLabel("1. Commercial use is not allowed.", 20, 25, 201, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Term2 = GUICtrlCreateLabel("2. If your account gets banned, I won't take responsibility", 20, 49, 349, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Type = GUICtrlCreateLabel("Type 'I ACCEPT' to continue", 20, 81, 203, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$InputBox = GUICtrlCreateInput("Your acceptance goes here.", 20, 113, 329, 21)
$Donate = GUICtrlCreateButton("Buy me a coffee!", 122, 145, 129, 33)
GUISetState(@SW_SHOW)
#EndRegion

$Accept = False
While not $Accept
	$Msg = GUIGetMsg()
	Switch $Msg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Donate
			MsgBox(0, "I really appreciate it", "Nguyen Huu Minh" & @LF & "Viettel Pay/ Momo: 0943503518" & @LF & "MBBank Chi Nhanh Dien Bien Phu: 9704 2292 3351 4293")
		Case Else
			If StringLower(GUICtrlRead($InputBox)) = "i accept" Then
				GUICtrlSetData($Type, "Running the script...")
				sleep(1000)
				$Accept = True
			EndIf
	EndSwitch
WEnd

GUIDelete()

#Region
$Menu = GUICreate("Teamfight Tactics Bot", 298, 154, -1, -1)
$Time_Input_Area = GUICtrlCreateGroup("Surrender after ", 32, 16, 233, 97)
$TimeInputBox = GUICtrlCreateInput("00:00", 56, 40, 89, 21)
GUICtrlSetTip(-1, "Must be in the format XX:XX")
$StartNStop = GUICtrlCreateButton("Start", 168, 40, 73, 25)
$Note = GUICtrlCreateLabel("Game Duration must be in the format xx:xx", 48, 72, 202, 17)
$note2 = GUICtrlCreateLabel("00:00 mean no surrender will be made.", 48, 88, 186, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$text1 = GUICtrlCreateLabel("Consider donating if this script is timesaving.", 32, 120, 210, 17)
GUISetState(@SW_SHOW)
#EndRegion

Global $Start = False

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $StartNStop
			If not $Start Then
				$matchlength = StringSplit(GUICtrlRead($TimeInputBox), ":")
				Global $MatchLengthInMilisecond = Int($matchlength[1]) * 60000 + Int($matchlength[2]) * 1000
				If $MatchLengthInMilisecond < 600000 and $MatchLengthInMilisecond <> 0 Then
					GUICtrlSetData($text1, "Minimum of game duration must be 10 min.")
				ElseIf $MatchLengthInMilisecond = 0 Then
					GUICtrlSetData($text1, "No surrender.")
					$Start = True
					;GUICtrlSetData($StartNStop, "Stop")
					GUICtrlSetState($TimeInputBox, $GUI_DISABLE)
					While 1
						autobot($MatchLengthInMilisecond)
					WEnd
				Else
					GUICtrlSetData($text1, "Playing TFT...")
					$Start = True
					;GUICtrlSetData($StartNStop, "Stop")
					GUICtrlSetState($TimeInputBox, $GUI_DISABLE)
					While 1
						autobot($MatchLengthInMilisecond)
					WEnd
				EndIf
			Else
				ExitLoop
				$Start = False
				GUICtrlSetData($StartNStop, "Start")
				GUICtrlSetState($TimeInputBox, $GUI_ENABLE)
			EndIf
	EndSwitch
WEnd





