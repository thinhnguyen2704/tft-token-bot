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
Global $arena = "DJ Trâu"

Func Auto($TimeInMs)
	WinActivate("League of Legends")
	While Not WinExists("League of Legends (TM) Client")
		Sleep(1500)
		;Close annoying event window
		ControlClick("League of Legends", "", "[Classnn:Chrome_RenderWidgetHostHWND1]", "left", 1, Round(0.808 * $clientsz[0]), Round(0.102 * $clientsz[1]))
		Sleep(2000)
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
	;DJ Trâu 
        Local $Item1CoordX = $pxdifference[0] + Round($gamesz[0] * 0.087)
        Local $Item1CoordY = $pxdifference[1] + Round($gamesz[1] * 0.687)
        Local $Item2CoordX = $pxdifference[0] + Round($gamesz[0] * 0.112)
        Local $Item2CoordY = $pxdifference[1] + Round($gamesz[1] * 0.662)
        Local $Item3CoordX = $pxdifference[0] + Round($gamesz[0] * 0.101)
        Local $Item3CoordY = $pxdifference[1] + Round($gamesz[1] * 0.631)
        Local $Item4CoordX = $pxdifference[0] + Round($gamesz[0] * 0.117)
        Local $Item4CoordY = $pxdifference[1] + Round($gamesz[1] * 0.606)
        Local $Item5CoordX = $pxdifference[0] + Round($gamesz[0] * 0.149)
        Local $Item5CoordY = $pxdifference[1] + Round($gamesz[1] * 0.606)
        Local $Item6CoordX = $pxdifference[0] + Round($gamesz[0] * 0.112)
        Local $Item6CoordY = $pxdifference[1] + Round($gamesz[1] * 0.578)
        Local $Item7CoordX = $pxdifference[0] + Round($gamesz[0] * 0.140)
        Local $Item7CoordY = $pxdifference[1] + Round($gamesz[1] * 0.578)
        Local $Item8CoordX = $pxdifference[0] + Round($gamesz[0] * 0.166)
        Local $Item8CoordY = $pxdifference[1] + Round($gamesz[1] * 0.578)
        Local $Item9CoordX = $pxdifference[0] + Round($gamesz[0] * 0.119)
        Local $Item9CoordY = $pxdifference[1] + Round($gamesz[1] * 0.543)
        Local $Item10CoordX = $pxdifference[0] + Round($gamesz[0] * 0.147)
        Local $Item10CoordY = $pxdifference[1] + Round($gamesz[1] * 0.543)

	While WinExists("League of Legends (TM) Client")
		While TimerDiff($timer) <= $Clock And WinExists("League of Legends (TM) Client")
			If TimerDiff($timer) < 600000 Then
				;Buy champs
				MouseClick("left", ($pxdifference[0] + $gamesz[0] * (0.3 + (0.105 * Random(0, 4, 1)))), Round(($gamesz[1] * 0.92) + $pxdifference[1]), 1)
				Sleep(400)
				MouseClick("left", ($pxdifference[0] + $gamesz[0] * (0.3 + (0.105 * Random(0, 4, 1)))), Round(($gamesz[1] * 0.92) + $pxdifference[1]), 1)
				Sleep(400)
				;Sell champs
				MouseMove(($pxdifference[0] + Round($gamesz[0] * (0.23 + (0.0625 * Random(0, 8, 1))))), ($pxdifference[1] + Round($gamesz[1] * 0.7185)))
				Send("e")
			Else
				;Buy champs 
				For $snowa = 0 To 4
					If WinExists("League of Legends (TM) Client") Then
						MouseClick("left", ($pxdifference[0] + $gamesz[0] * (0.3 + (0.105 * $snowa))), Round(($gamesz[1] * 0.92) + $pxdifference[1]), 1) ;buy all champs from store
						Sleep(400)
					EndIf
				Next
				;Randomly sell champions 
				For $snow = 1 To Random(2, 3, 1)
					MouseMove(($pxdifference[0] + Round($gamesz[0] * (0.23 + (0.0625 * Random(0, 8, 1))))), ($pxdifference[1] + Round($gamesz[1] * 0.7185)))
					Send("e")
				Next
			EndIf

			;Collect mystery boxes - 1st move
			MouseClick("right", ($pxdifference[0] + Round($gamesz[0] * 0.7)), ($pxdifference[1] + Round($gamesz[1] * 0.493)), 1)
			Sleep(1000)

			;#### Move champs on the last row from left to right
			If TimerDiff($timer) <= 600000 Then 
				For $hna = 0 To 1
					;Move from second last row to 1st and 2nd pile of last row 
					MouseClickDrag("left", ($pxdifference[0] + Round($gamesz[0] * 0.4714)), ($pxdifference[1] + Round($gamesz[1] * 0.513)), ($pxdifference[0] + Round($gamesz[0] * (0.3 + (0.064 * $hna)))), ($pxdifference[1] + Round($gamesz[1] * 0.615)))
				Next
			ElseIf TimerDiff($timer) >= 90000 And TimerDiff($timer) <= 600000 Then
				;3rd pile
				MouseClickDrag("left", ($pxdifference[0] + Round($gamesz[0] * 0.4714)), ($pxdifference[1] + Round($gamesz[1] * 0.513)), ($pxdifference[0] + Round($gamesz[0] * 0.428)), ($pxdifference[1] + Round($gamesz[1] * 0.615)))
			ElseIf TimerDiff($timer) >= 300000 And TimerDiff($timer) <= 600000 Then
				;5th pile
				MouseClickDrag("left", ($pxdifference[0] + Round($gamesz[0] * 0.4714)), ($pxdifference[1] + Round($gamesz[1] * 0.513)), ($pxdifference[0] + Round($gamesz[0] * 0.556)), ($pxdifference[1] + Round($gamesz[1] * 0.615)))
			ElseIf TimerDiff($timer) >= 480000 And TimerDiff($timer) <= 840000 Then
				;6th pile				
				MouseClickDrag("left", ($pxdifference[0] + Round($gamesz[0] * 0.4714)), ($pxdifference[1] + Round($gamesz[1] * 0.513)), ($pxdifference[0] + Round($gamesz[0] * 0.642)), ($pxdifference[1] + Round($gamesz[1] * 0.615)))
			ElseIf TimerDiff($timer) >= 780000 And TimerDiff($timer) <= 1140000 Then
				;7th pile 
				MouseClickDrag("left", ($pxdifference[0] + Round($gamesz[0] * 0.4714)), ($pxdifference[1] + Round($gamesz[1] * 0.513)), ($pxdifference[0] + Round($gamesz[0] * 0.684)), ($pxdifference[1] + Round($gamesz[1] * 0.615)))
			EndIf

			;Continue to collect mystery boxes - 2nd move 
			MouseClick("right", ($pxdifference[0] + Round($gamesz[0] * 0.65)), ($pxdifference[1] + Round($gamesz[1] * 0.267)), 1)
			Sleep(1000)

			;Move from third last row to last row
			MouseClickDrag("left", ($pxdifference[0] + Round($gamesz[0] * 0.5)), ($pxdifference[1] + Round($gamesz[1] * 0.44)), ($pxdifference[0] + Round($gamesz[0] * (0.3 + (0.072 * Random(4, 6, 1))))), ($pxdifference[1] + Round($gamesz[1] * 0.615)))
			Sleep(4000)

			;Continue to collect mystery boxes - 3rd move
			MouseClick("right", ($pxdifference[0] + Round($gamesz[0] * 0.3)), ($pxdifference[1] + Round($gamesz[1] * 0.23)), 1)

			;####Sell champions on the arena 
			If TimerDiff($timer) >= 510000 Then
				MouseMove(($pxdifference[0] + Round($gamesz[0] * 0.5)), ($pxdifference[1] + Round($gamesz[1] * (0.3 + (0.072 * Random(0, 6, 1))))))
				Send("e")
			EndIf

			;Continue to collect mystery boxes - 4th move
			MouseClick("right", ($pxdifference[0] + Round($gamesz[0] * 0.24)), ($pxdifference[1] + Round($gamesz[1] * 0.6)), 1)

			;####Drag items from base to champs
			Local $Champ1CoordX = $pxdifference[0] + Round($gamesz[0] * 0.5)
			Local $Champ2CoordX = $pxdifference[0] + Round($gamesz[0] * (0.3 + ((0.2 / 3) *  Random(0, 6, 1))))
			Local $ChampCoordY = $pxdifference[1] + Round($gamesz[1] * 0.61)
			If WinExists("League of Legends (TM) Client") Then
				If TimerDiff($timer) >= 120000 And TimerDiff($timer) <= 720000 Then 
					MouseClickDrag("left", $Item1CoordX, $Item1CoordY, $Champ1CoordX, $ChampCoordY)
					MouseClickDrag("left", $Item2CoordX, $Item2CoordY, $Champ1CoordX, $ChampCoordY)
					MouseClickDrag("left", $Item3CoordX, $Item3CoordY, $Champ1CoordX, $ChampCoordY)
					MouseClickDrag("left", $Item4CoordX, $Item4CoordY, $Champ1CoordX, $ChampCoordY)
					MouseClickDrag("left", $Item5CoordX, $Item5CoordY, $Champ1CoordX, $ChampCoordY)
				ElseIf TimerDiff($timer) >= 720000 And TimerDiff($timer) <= 1200000 Then 
					MouseClickDrag("left", $Item1CoordX, $Item1CoordY, $Champ2CoordX, $ChampCoordY)
					MouseClickDrag("left", $Item2CoordX, $Item2CoordY, $Champ2CoordX, $ChampCoordY)
					MouseClickDrag("left", $Item3CoordX, $Item3CoordY, $Champ2CoordX, $ChampCoordY)
					MouseClickDrag("left", $Item4CoordX, $Item4CoordY, $Champ2CoordX, $ChampCoordY)
					MouseClickDrag("left", $Item5CoordX, $Item5CoordY, $Champ2CoordX, $ChampCoordY)
				ElseIf TimerDiff($timer) >= 900000 And TimerDiff($timer) <= 1320000 Then
					MouseClickDrag("left", $Item6CoordX, $Item6CoordY, $Champ2CoordX, $ChampCoordY)
					MouseClickDrag("left", $Item7CoordX, $Item7CoordY, $Champ2CoordX, $ChampCoordY)
					MouseClickDrag("left", $Item8CoordX, $Item8CoordY, $Champ2CoordX, $ChampCoordY)
					MouseClickDrag("left", $Item9CoordX, $Item9CoordY, $Champ2CoordX, $ChampCoordY)
					MouseClickDrag("left", $Item10CoordX, $Item10CoordY, $Champ2CoordX, $ChampCoordY)
				EndIf
			EndIf

			;Buy exp
			If TimerDiff($timer) >= 120000 And TimerDiff($timer) <= 360000 Then 
				For $i = 1 To 2
					Send("f")
				Next
			ElseIf TimerDiff($timer) >= 360000 And TimerDiff($timer) <= 1200000 Then
				For $i = 1 To Random(3, 5, 1)
					Send("f")
				Next				
			EndIf

			;Check if HP reaches 0 after 18 mins
			If TimerDiff($timer) >= 1080000 Then 
				MouseClick("left", ($pxdifference[0] + Round($gamesz[0] * 0.42)), ($pxdifference[1] + Round($gamesz[1] * 0.512)), 1)
				Sleep(5000)
			EndIf

			;Take a rest
			If WinExists("League of Legends (TM) Client") Then
				If TimerDiff($timer) <= 360000 Then
					Sleep(18000)
				Else
					Sleep(30000)
				EndIf
			Else
				ExitLoop
			EndIf
		WEnd

		If WinExists("League of Legends (TM) Client") Then
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
				Sleep(20000)
			EndIf
		EndIf
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