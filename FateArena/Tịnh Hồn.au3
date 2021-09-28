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
#AutoIt3Wrapper_Res_Comment=Made by m1nt.
#AutoIt3Wrapper_Res_ProductName=TFT Auto BOT
#AutoIt3Wrapper_Res_ProductVersion=1.0.0
#AutoIt3Wrapper_Res_CompanyName=Nguyen Huu Minh
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;Mouse click delay----------------------------
Opt("MouseClickDelay", 5)
Opt("MouseClickDownDelay", 200)
HotKeySet("{PAUSE}", "togglePause")

;Main part--------------------------------------
Global $clientsz = WinGetClientSize("League of Legends") ;get the client width and height
Global $matchlength, $TimeInMs, $Clock
Global $isPaused = False
Global $arena = "Tịnh Hồn"

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
	Sleep(55000) ;wait for the match to start

	;Tịnh Hồn
        Local $Item1CoordX = $pxdifference[0] + Round($gamesz[0] * 0.094)
        Local $Item1CoordY = $pxdifference[1] + Round($gamesz[1] * 0.692)
        Local $Item2CoordX = $pxdifference[0] + Round($gamesz[0] * 0.114)
        Local $Item2CoordY = $pxdifference[1] + Round($gamesz[1] * 0.66)
        Local $Item3CoordX = $pxdifference[0] + Round($gamesz[0] * 0.1)
        Local $Item3CoordY = $pxdifference[1] + Round($gamesz[1] * 0.682)
        Local $Item4CoordX = $pxdifference[0] + Round($gamesz[0] * 0.125)
        Local $Item4CoordY = $pxdifference[1] + Round($gamesz[1] * 0.615)
        Local $Item5CoordX = $pxdifference[0] + Round($gamesz[0] * 0.171)
        Local $Item5CoordY = $pxdifference[1] + Round($gamesz[1] * 0.615)
        Local $Item6CoordX = $pxdifference[0] + Round($gamesz[0] * 0.114)
        Local $Item6CoordY = $pxdifference[1] + Round($gamesz[1] * 0.5846)
        Local $Item7CoordX = $pxdifference[0] + Round($gamesz[0] * 0.142)
        Local $Item7CoordY = $pxdifference[1] + Round($gamesz[1] * 0.5846)
        Local $Item8CoordX = $pxdifference[0] + Round($gamesz[0] * 0.171)
        Local $Item8CoordY = $pxdifference[1] + Round($gamesz[1] * 0.5846)
        Local $Item9CoordX = $pxdifference[0] + Round($gamesz[0] * 0.12)
        Local $Item9CoordY = $pxdifference[1] + Round($gamesz[1] * 0.5538)
        Local $Item10CoordX = $pxdifference[0] + Round($gamesz[0] * 0.148)
        Local $Item10CoordY = $pxdifference[1] + Round($gamesz[1] * 0.5538)
	
	While WinExists("League of Legends (TM) Client")
		While TimerDiff($timer) <= $Clock
			If TimerDiff($timer) < 300000 Then
				MouseClick("left", ($pxdifference[0] + $gamesz[0] * (0.3 + (0.105 * Random(0, 4, 1)))), Round(($gamesz[1] * 0.92) + $pxdifference[1]), 1)
			Else
				For $snowa = 1 To 5
					MouseClick("left", ($pxdifference[0] + $gamesz[0] * (0.3 + (0.105 * ($snowa - 1)))), Round(($gamesz[1] * 0.92) + $pxdifference[1]), 1) ;buy all champs from store
					Send("f")
				Next
				;Randomly sell champions
				For $snow = 1 To 2
					MouseClickDrag("left", ($pxdifference[0] + Round($gamesz[0] * (0.23 + (0.0625 * Random(0, 8, 1))))), ($pxdifference[1] + Round($gamesz[1] * 0.7185)), ($pxdifference[0] + Round($gamesz[0] * 0.5)), ($pxdifference[1] + Round($gamesz[1] * 0.95)))
					Send("f")
				Next
			EndIf

			;Collect mystery boxes
			MouseClick("right", ($pxdifference[0] + Round($gamesz[0] * 0.7)), ($pxdifference[1] + Round($gamesz[1] * 0.493)), 1)
			Sleep(1000)

			;#### Move champs on the last row from left to right
			If TimerDiff($timer) <= 330000 Then 
				For $hna = 1 To 2
					;Move from second last row to 1st and 2nd pile of last row 
					MouseClickDrag("left", ($pxdifference[0] + Round($gamesz[0] * 0.4714)), ($pxdifference[1] + Round($gamesz[1] * 0.513)), ($pxdifference[0] + Round($gamesz[0] * (0.3 + (0.072 * ($hna - 1))))), ($pxdifference[1] + Round($gamesz[1] * 0.615)))
				Next
			ElseIf TimerDiff($timer) >= 240000 And TimerDiff($timer) <= 510000 Then
				;3rd pile
				MouseClickDrag("left", ($pxdifference[0] + Round($gamesz[0] * 0.4714)), ($pxdifference[1] + Round($gamesz[1] * 0.513)), ($pxdifference[0] + Round($gamesz[0] * (0.3 + (0.072 * 2)))), ($pxdifference[1] + Round($gamesz[1] * 0.615)))
			ElseIf TimerDiff($timer) >= 360000 And TimerDiff($timer) <= 600000 Then
				;5th pile
				MouseClickDrag("left", ($pxdifference[0] + Round($gamesz[0] * 0.4714)), ($pxdifference[1] + Round($gamesz[1] * 0.513)), ($pxdifference[0] + Round($gamesz[0] * (0.3 + (0.072 * 4)))), ($pxdifference[1] + Round($gamesz[1] * 0.615)))
			ElseIf TimerDiff($timer) >= 600000 And TimerDiff($timer) <= 840000 Then
				;6th pile				
				MouseClickDrag("left", ($pxdifference[0] + Round($gamesz[0] * 0.4714)), ($pxdifference[1] + Round($gamesz[1] * 0.513)), ($pxdifference[0] + Round($gamesz[0] * (0.642))), ($pxdifference[1] + Round($gamesz[1] * 0.615)))
			ElseIf TimerDiff($timer) >= 840000 And TimerDiff($timer) <= 1140000 Then
				;7th pile 
				MouseClickDrag("left", ($pxdifference[0] + Round($gamesz[0] * 0.4714)), ($pxdifference[1] + Round($gamesz[1] * 0.513)), ($pxdifference[0] + Round($gamesz[0] * (0.3 + (0.072 * 6)))), ($pxdifference[1] + Round($gamesz[1] * 0.615)))
			EndIf

			;Continue to collect mystery boxes
			MouseClick("right", ($pxdifference[0] + Round($gamesz[0] * 0.65)), ($pxdifference[1] + Round($gamesz[1] * 0.267)), 1)
			Sleep(1000)

			;Move from third last row to last row
			MouseClickDrag("left", ($pxdifference[0] + Round($gamesz[0] * 0.5)), ($pxdifference[1] + Round($gamesz[1] * 0.44)), ($pxdifference[0] + Round($gamesz[0] * (0.3 + (0.072 * Random(4, 6, 1))))), ($pxdifference[1] + Round($gamesz[1] * 0.615)))
			Sleep(4000)
			;Continue to collect mystery boxes
			MouseClick("right", ($pxdifference[0] + Round($gamesz[0] * 0.285)), ($pxdifference[1] + Round($gamesz[1] * 0.295)), 1)

			;####Drag items from base to champs
			Local $Champ1CoordX = $pxdifference[0] + Round($gamesz[0] * (0.3 + (0.07 *  Random(0, 3, 1))))
			Local $Champ2CoordX = $pxdifference[0] + Round($gamesz[0] * (0.3 + (0.07 *  Random(3, 6, 1))))
			Local $ChampCoordY = $pxdifference[1] + Round($gamesz[1] * 0.61)

			If ((TimerDiff($timer) >= 240000 And TimerDiff($timer) <= 660000) Or (TimerDiff($timer) >= 720000 And TimerDiff($timer) <= 1020000)) Then 
				MouseClickDrag("left", $Item1CoordX, $Item1CoordY, $Champ1CoordX, $ChampCoordY)
				MouseClickDrag("left", $Item2CoordX, $Item2CoordY, $Champ1CoordX, $ChampCoordY)
				MouseClickDrag("left", $Item3CoordX, $Item3CoordY, $Champ1CoordX, $ChampCoordY)
				MouseClickDrag("left", $Item4CoordX, $Item4CoordY, $Champ1CoordX, $ChampCoordY)
				MouseClickDrag("left", $Item5CoordX, $Item5CoordY, $Champ1CoordX, $ChampCoordY)
			ElseIf TimerDiff($timer) >= 900000 And TimerDiff($timer) <= 1200000 Then
				MouseClickDrag("left", $Item6CoordX, $Item6CoordY, $Champ2CoordX, $ChampCoordY)
				MouseClickDrag("left", $Item7CoordX, $Item7CoordY, $Champ2CoordX, $ChampCoordY)
				MouseClickDrag("left", $Item8CoordX, $Item8CoordY, $Champ2CoordX, $ChampCoordY)
				MouseClickDrag("left", $Item9CoordX, $Item9CoordY, $Champ2CoordX, $ChampCoordY)
				MouseClickDrag("left", $Item10CoordX, $Item10CoordY, $Champ2CoordX, $ChampCoordY)
			EndIf
			;Check if HP reaches 0 after 18 mins
			If TimerDiff($timer) >= 10800000 Then 
				MouseClick("left", ($pxdifference[0] + Round($gamesz[0] * 0.42)), ($pxdifference[1] + Round($gamesz[1] * 0.512)), 1)
			EndIf
			Sleep(35000)
		WEnd
		;Surrender if the ff time has passed
		If $TimeInMs <> 0 Then  
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
			MouseClick("left", ($pxdifference[0] + Round($gamesz[0] * (1 - 0.54297))), ($pxdifference[1] + Round($gamesz[1] * 0.45139)), 1)
			Sleep(10000)
		EndIf
	WEnd
	WinWaitClose("League of Legends (TM) Client")
	Sleep(10000)
EndFunc

;Manually pause the script
Func togglePause()
	$isPaused = Not $isPaused
	While $isPaused
		Sleep(400)
	WEnd
EndFunc

#Region
$Menu = GUICreate("Con bot TFT mang tên Wind yêu Snow", 400, 154, -1, -1)
$Time_Input_Area = GUICtrlCreateGroup("Chỉ dành cho sàn đấu " & $arena & " !!!! ", 32, 16, 233, 97)
$TimeInputBox = GUICtrlCreateInput("21:00", 56, 40, 89, 21)
GUICtrlSetTip(-1, "Tình yêu siu bự cho Snow")
$StartNStop = GUICtrlCreateButton("Bắt đầu", 168, 40, 73, 25)
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