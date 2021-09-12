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

;Main part--------------------------------------
Global $clientsz = WinGetClientSize("League of Legends") ;get the client width and height
Global $matchlength, $TimeInMs, $Clock

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
		While TimerDiff($timer) <= $Clock
			For $snowa = 1 To 5
				MouseClick("left", ($pxdifference[0] + $gamesz[0] * (0.3 + (0.105 * ($snowa - 1)))), Round(($gamesz[1] * 0.92) + $pxdifference[1]), 1) ;buy all champs from store
				Sleep(1000)
			Next
			;Collect mystery boxes
			MouseClick("right", ($pxdifference[0] + Round($gamesz[0] * 0.7)), ($pxdifference[1] + Round($gamesz[1] * 0.493)), 1)
			
			;#### Arrange champs on the last row with position from left to right 
			For $hna = 1 To 7
				;Move from second last row to last row 
				MouseClickDrag("left", ($pxdifference[0] + Round($gamesz[0] * 0.4714)), ($pxdifference[1] + Round($gamesz[1] * 0.513)), ($pxdifference[0] + Round($gamesz[0] * (0.3 + (0.072 * ($hna - 1))))), ($pxdifference[1] + Round($gamesz[1] * 0.6)))
			Next

			;Continue to collect mystery boxes 			
			Send("f")
			MouseClick("right", ($pxdifference[0] + Round($gamesz[0] * 0.65)), ($pxdifference[1] + Round($gamesz[1] * 0.267)), 1)

			;Move champions from third last row to last row
			MouseClickDrag("left", ($pxdifference[0] + Round($gamesz[0] * 0.5)), ($pxdifference[1] + Round($gamesz[1] * 0.44)), ($pxdifference[0] + Round($gamesz[0] * (0.3 + (0.072 * Random(4, 6, 1))))), ($pxdifference[1] + Round($gamesz[1] * 0.6)))

			;Continue to collect mystery boxes 			
			MouseClick("right", ($pxdifference[0] + Round($gamesz[0] * 0.285)), ($pxdifference[1] + Round($gamesz[1] * 0.295)), 1)
			Send("f")

			;Sell champions purchased at the beginning to buy higher value champions
			If TimerDiff($timer) > 480000 And TimerDiff($timer) < 540000 Then
				For $snow = 1 To 9
					MouseClickDrag("left", ($pxdifference[0] + Round($gamesz[0] * (0.23 + (0.0625 * ($snow - 1))))), ($pxdifference[1] + Round($gamesz[1] * 0.7185)), ($pxdifference[0] + Round($gamesz[0] * 0.5)), ($pxdifference[1] + Round($gamesz[1] * 0.95)))
				Next
			EndIf

			;Things to do after 10 mins
			If (TimerDiff($timer) > 540000 And TimerDiff($timer) < 660000) Or (TimerDiff($timer) > 960000 And TimerDiff($timer) < 1080000) Then 
				;####Drag items from base to champs
				;Only for Fate arenas
				Local $Champ1CoordX = $pxdifference[0] + Round($gamesz[0] * (0.3 + (0.072 *  Random(0, 3, 1))))
				Local $Champ2CoordX = $pxdifference[0] + Round($gamesz[0] * (0.3 + (0.072 *  Random(3, 6, 1))))
				Local $ChampCoordY = $pxdifference[1] + Round($gamesz[1] * 0.61)
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
				MouseClickDrag("left", $Item1CoordX, $Item1CoordY, $Champ1CoordX, $ChampCoordY)			
				Send("f")
				MouseClickDrag("left", $Item2CoordX, $Item2CoordY, $Champ1CoordX, $ChampCoordY)
				Sleep(500)
				MouseClickDrag("left", $Item3CoordX, $Item3CoordY, $Champ1CoordX, $ChampCoordY)
				Sleep(500)
				MouseClickDrag("left", $Item4CoordX, $Item4CoordY, $Champ1CoordX, $ChampCoordY)
				Send("f")
				MouseClickDrag("left", $Item5CoordX, $Item5CoordY, $Champ1CoordX, $ChampCoordY)
				Sleep(500)
				MouseClickDrag("left", $Item6CoordX, $Item6CoordY, $Champ2CoordX, $ChampCoordY)
				Sleep(500)
				MouseClickDrag("left", $Item7CoordX, $Item7CoordY, $Champ2CoordX, $ChampCoordY)
				Sleep(500)
				MouseClickDrag("left", $Item8CoordX, $Item8CoordY, $Champ2CoordX, $ChampCoordY)
				Send("f")
				MouseClickDrag("left", $Item9CoordX, $Item9CoordY, $Champ2CoordX, $ChampCoordY)
				Sleep(500)
				MouseClickDrag("left", $Item10CoordX, $Item10CoordY, $Champ2CoordX, $ChampCoordY)
				Sleep(500)
			EndIf
			;Check if HP reaches 0 after 15 mins
			If TimerDiff($timer) >= 900000 Then 
				MouseClick("left", ($pxdifference[0] + Round($gamesz[0] * 0.42)), ($pxdifference[1] + Round($gamesz[1] * 0.553)), 1)
				Sleep(500)
			EndIf
			Sleep(20000)
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
		EndIf
		Sleep(60000)
	WEnd
	WinWaitClose("League of Legends (TM) Client")
	Sleep(10000)
EndFunc

#Region
$Menu = GUICreate("Con bot TFT mang tên Wind yêu Snow", 298, 154, -1, -1)
$Time_Input_Area = GUICtrlCreateGroup("Chỉ dành cho bộ sàn đấu DJ Trâu!!!! ", 32, 16, 274, 97)
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
				$matchlength = StringSplit(GUICtrlRead($TimeInputBox), ":")
				Global $MatchLengthInMilisecond = Int($matchlength[1]) * 60000 + Int($matchlength[2]) * 1000
				While $Start == True
					Auto($MatchLengthInMilisecond)
				WEnd	
			Else
				ExitLoop
				$Start = False 
				GUICtrlSetData($StartNStop, "Start")
				GUICtrlSetState($TimeInputBox, $GUI_ENABLE)
			EndIf
	EndSwitch
WEnd