﻿#include <ButtonConstants.au3>
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
			For $i = 1 To 5
				MouseClick("left", ($pxdifference[0] + $gamesz[0] * (0.3 + (0.105 * ($i - 1)))), Round(($gamesz[1] * 0.92) + $pxdifference[1]), 1) ;buy all champs from store
			Next

			;Buy exp 
			MouseClick("left", ($pxdifference[0] + Round($gamesz[0] * 0.1914)), ($pxdifference[1] + Round($gamesz[1] * 0.893)), 4, 40)

			;#### Arrange champs on the last row with position from left to right 
			For $j = 1 To 7 
				MouseClickDrag("left", ($pxdifference[0] + Round($gamesz[0] * 0.4714)), ($pxdifference[1] + Round($gamesz[1] * 0.513)), ($pxdifference[0] + Round($gamesz[0] * (0.3 + (0.068 * ($j - 1))))), ($pxdifference[1] + Round($gamesz[1] * 0.63)))
			Next
			;Collect mystery boxes
			MouseClick("right", ($pxdifference[0] + Round($gamesz[0] * 0.7)), ($pxdifference[1] + Round($gamesz[1] * 0.493)), 1, 10)
			Sleep(4000)
			MouseClick("right", ($pxdifference[0] + Round($gamesz[0] * 0.65)), ($pxdifference[1] + Round($gamesz[1] * 0.267)), 1, 10)
			Sleep(3000)
			MouseClick("right", ($pxdifference[0] + Round($gamesz[0] * 0.4)), ($pxdifference[1] + Round($gamesz[1] * 0.295)), 1, 10)
			Sleep(3000)
	
			If TimerDiff($timer) >= 300000 Then ;After 5 mins

				
				;####Drag items from base to champs
				;UseItem()
				Local $ChampCoordX = $pxdifference[0] + Round($gamesz[0] * (0.3 + (0.075 *  Random(0, 6, 1))))
				Local $ChampCoordY = $pxdifference[1] + Round($gamesz[1] * 0.63)
				Local $Item1CoordX = $pxdifference[0] + Round($gamesz[0] * 0.092)
				Local $Item1CoordY = $pxdifference[1] + Round($gamesz[1] * 0.687)
				Local $Item2CoordX = $pxdifference[0] + Round($gamesz[0] * 0.114)
				Local $Item2CoordY = $pxdifference[1] + Round($gamesz[1] * 0.66)
				Local $Item3CoordX = $pxdifference[0] + Round($gamesz[0] * 0.0875)
				Local $Item3CoordY = $pxdifference[1] + Round($gamesz[1] * 0.667)
				Local $Item4CoordX = $pxdifference[0] + Round($gamesz[0] * 0.108)
				Local $Item4CoordY = $pxdifference[1] + Round($gamesz[1] * 0.648)	
				Local $Item5CoordX = $pxdifference[0] + Round($gamesz[0] * 0.104)
				Local $Item5CoordY = $pxdifference[1] + Round($gamesz[1] * 0.614)
				Local $Item6CoordX = $pxdifference[0] + Round($gamesz[0] * 0.171)
				Local $Item6CoordY = $pxdifference[1] + Round($gamesz[1] * 0.577)
				Local $Item7CoordX = $pxdifference[0] + Round($gamesz[0] * 0.185)
				Local $Item7CoordY = $pxdifference[1] + Round($gamesz[1] * 0.577)
				Local $Item8CoordX = $pxdifference[0] + Round($gamesz[0] * 0.2)
				Local $Item8CoordY = $pxdifference[1] + Round($gamesz[1] * 0.577)
				Local $Item9CoordX = $pxdifference[0] + Round($gamesz[0] * 0.1228)
				Local $Item9CoordY = $pxdifference[1] + Round($gamesz[1] * 0.538)
				Local $Item10CoordX = $pxdifference[0] + Round($gamesz[0] * 0.156)
				Local $Item10CoordY = $pxdifference[1] + Round($gamesz[1] * 0.538)			
				MouseClickDrag("left", $Item1CoordX, $Item1CoordY, $ChampCoordX, $ChampCoordY)
				Sleep(500)
				MouseClickDrag("left", $Item2CoordX, $Item2CoordY, $ChampCoordX, $ChampCoordY)
				Sleep(500)
				MouseClickDrag("left", $Item3CoordX, $Item3CoordY, $ChampCoordX, $ChampCoordY)
				Sleep(500)
				MouseClickDrag("left", $Item4CoordX, $Item4CoordY, $ChampCoordX, $ChampCoordY)
				Sleep(500)
				MouseClickDrag("left", $Item5CoordX, $Item5CoordY, $ChampCoordX, $ChampCoordY)
				Sleep(500)
				MouseClickDrag("left", $Item6CoordX, $Item6CoordY, $ChampCoordX, $ChampCoordY)
				Sleep(500)
				MouseClickDrag("left", $Item7CoordX, $Item7CoordY, $ChampCoordX, $ChampCoordY)
				Sleep(500)
				MouseClickDrag("left", $Item8CoordX, $Item8CoordY, $ChampCoordX, $ChampCoordY)
				Sleep(500)
				MouseClickDrag("left", $Item9CoordX, $Item9CoordY, $ChampCoordX, $ChampCoordY)
				Sleep(500)
				MouseClickDrag("left", $Item10CoordX, $Item10CoordY, $ChampCoordX, $ChampCoordY)
				Sleep(500)
			EndIf

			;Check if HP reaches 0 after 15 mins
			If TimerDiff($timer) >= 900000 Then 
				MouseClick("left", ($pxdifference[0] + Round($gamesz[0] * 0.432)), ($pxdifference[1] + Round($gamesz[1] * 0.493)), 1, 10)
			EndIf
			Sleep(10000)
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
			MouseClick("left", ($pxdifference[0] + Round($gamesz[0] * (1 - 0.54297))), ($pxdifference[1] + Round($gamesz[1] * 0.45139)), 1, 10)
		EndIf
	WEnd
	WinWaitClose("League of Legends (TM) Client")
	Sleep(10000)
EndFunc   ;==>autobot

;This function drag items from base to put them on champions
;~ Func UseItem()
;~ EndFunc

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
				$Start = True 
				GUICtrlSetData($StartNStop, "Stop")
				$matchlength = StringSplit(GUICtrlRead($TimeInputBox), ":")
				Global $MatchLengthInMilisecond = Int($matchlength[1]) * 60000 + Int($matchlength[2]) * 1000
				While $Start
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