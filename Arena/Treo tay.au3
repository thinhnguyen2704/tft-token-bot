#pragma compile(ExecLevel, requireAdministrator)
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ProgressConstants.au3>


#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\snowflake.ico 
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Res_Comment=Made by Peter.
#AutoIt3Wrapper_Res_ProductName=TFT Auto BOT
#AutoIt3Wrapper_Res_ProductVersion=1.0.0
#AutoIt3Wrapper_Res_CompanyName=Nguyen Duc Thinh
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;Mouse click delay----------------------------
Opt("MouseClickDelay", 5)
Opt("MouseClickDownDelay", 200)
HotKeySet("{PAUSE}", "togglePause")

;Main part--------------------------------------
Global $clientsz = WinGetClientSize("League of Legends") ;get the client width and height
Global $matchlength, $TimeInMs, $Clock
Global $isPaused = False
Global $arena = "Treo tay tất cả sàn"

Func Auto($TimeInMs)
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
	Sleep(60000) ;wait for the match to start
	While WinExists("League of Legends (TM) Client")
        Sleep(1412)
	WEnd
	WinWaitClose("League of Legends (TM) Client")
	Sleep(4000)
EndFunc

;Manually pause the script
Func togglePause()
	$isPaused = Not $isPaused
	While $isPaused
		Sleep(400)
	WEnd
EndFunc

#Region
$Menu = GUICreate("Bot cày kỷ vật TFT", 700, 300, -1, -1)
$Time_Input_Area = GUICtrlCreateGroup("Chỉ dành cho sàn đấu " & $arena & " !!!! ", 32, 16, 400, 130)
$TimeInputBox = GUICtrlCreateInput("24:00", 56, 40, 89, 21)
GUICtrlSetTip(-1, "Thời gian trận đấu ở dạng mm:ss")
$StartNStop = GUICtrlCreateButton("Bắt đầu", 168, 40, 73, 25)
Global $Start = False 
$Note = GUICtrlCreateLabel("Có thể treo ở chế độ 1280x720 - Không viền để tiết kiệm điện", 48, 72, 202, 40)
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
				$Start = True 
				GUICtrlSetData($StartNStop, "Stop")
				GUICtrlSetState($TimeInputBox, $GUI_DISABLE)
				$matchlength = StringSplit(GUICtrlRead($TimeInputBox), ":")
				Global $MatchLengthInMilisecond = Int($matchlength[1]) * 60000 + Int($matchlength[2]) * 1000
				While 1
					Auto($MatchLengthInMilisecond)
				WEnd	
			Else
				ExitLoop
				$Start = False 
				GUICtrlSetData($StartNStop, "Start")
				GUICtrlSetState($TimeInputBox, $GUI_ENABLE)
				Exit
			EndIf
	EndSwitch
WEnd