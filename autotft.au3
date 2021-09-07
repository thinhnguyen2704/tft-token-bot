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
	$Clock = $TimeInMs
	Sleep(60000)

	While WinExists("League of Legends (TM) Client")
		While TimerDiff($timer) <= $Clock
			For $i = 1 To 5
				MouseClick("left", ($pxdifference[0] + $gamesz[0] * (0.3 + (0.105 * ($i - 1)))), Round(($gamesz[1] * 0.92) + $pxdifference[1]), 1, 10) ;buy all champs from store
				Sleep(1000)
			Next
			If TimerDiff($timer) >= 300000 Then ;After 5 mins
				;Collect mystery boxes
				MouseClick("right", ($pxdifference[0] + Round($gamesz[0] * 0.7), ($pxdifference[1] + Round($gamesz[1] * 0.493)), 1, 10)
				MouseClick("right", ($pxdifference[0] + Round($gamesz[0] * 0.45), ($pxdifference[1] + Round($gamesz[1] * 0.25)), 1, 10)
				;Buy exp 
				MouseClick("left", ($pxdifference[0] + Round($gamesz[0] * 0.1914)), ($pxdifference[1] + Round($gamesz[1] * 0.893)), 4, 10)
				Sleep(2000)
			EndIf
			;Check if HP reaches 0 after 10 mins
			If TimerDiff($timer) >= 600000 Then 
				MouseClick("left", ($pxdifference[0] + Round($gamesz[0] * 0.432)), ($pxdifference[1] + Round($gamesz[1] * 0.493)), 1, 10)
			EndIf
			Sleep(30000)
		WEnd	
		;Surrender if the ff time has passed
		;If $TimeInMs <> 0 Then  
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
		MouseClick("left", ($pxdifference[0] + Round($gamesz[0] * (1 - 0.54297))), ($pxdifference[1] + Round($gamesz[1] * 0.45139)), 1, 10)
		;EndIf
	WEnd
	WinWaitClose("League of Legends (TM) Client")
	Sleep(10000)
EndFunc   ;==>autobot

#Region
$Menu = GUICreate("Wind yêu Snow", 298, 154, -1, -1)
$Time_Input_Area = GUICtrlCreateGroup("Surrender after ", 32, 16, 233, 97)
$TimeInputBox = GUICtrlCreateInput("21:00", 56, 40, 89, 21)
GUICtrlSetTip(-1, "Tình yêu siu bự cho Snow")
$StartNStop = GUICtrlCreateButton("Start", 168, 40, 73, 25)
Global $Start = False 
$Note = GUICtrlCreateLabel("Love you to the infinity and beyond!!!!", 48, 72, 202, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			ExitLoop
			Exit
		Case $StartNStop
			If Not $Start Then
				GUICtrlSetData($StartNStop, "Stop")
				$matchlength = StringSplit(GUICtrlRead($TimeInputBox), ":")
				Global $MatchLengthInMilisecond = Int($matchlength[1]) * 60000 + Int($matchlength[2]) * 1000
				$Start = True 
				While 1
					autobot($MatchLengthInMilisecond)
				WEnd	
			Else
				ExitLoop
				$Start = False 
				GUICtrlSetData($StartNStop, "Start")
				GUICtrlSetState($TimeInputBox, $GUI_ENABLE)
			EndIf
	EndSwitch
WEnd




