local _instructionsText = 'Compete to the most kills with '
local _titles = { 'WINNER', '2ND PLACE', '3RD PLACE' }
local _playerColors = { Color.YELLOW, Color.GREY, Color.BROWN }
local _playerPositions = { '1st: ', '2nd: ', '3rd: ' }

local _gunGameData = nil

local function getPlayerPoints()
	local player = table.ifind_if(_gunGameData.players, function(player)
		return player.id == Player.ServerId()
	end)

	return player and player.points or nil
end

RegisterNetEvent('lsv:startGunGame')
AddEventHandler('lsv:startGunGame', function(data, passedTime)
	if _gunGameData then
		return
	end

	-- Preparations
	_gunGameData = { }

	_gunGameData.startTime = GetGameTimer()
	if passedTime then
		_gunGameData.startTime = _gunGameData.startTime - passedTime
	end

	_gunGameData.category = data.category
	_gunGameData.players = data.players

	-- GUI
	Citizen.CreateThread(function()
		local fullInstructions = _instructionsText.._gunGameData.category..'.'
		if Player.IsInFreeroam() and not passedTime then
			Gui.StartEvent('Gun Game', fullInstructions)
		end

		while true do
			Citizen.Wait(0)

			if not _gunGameData then
				return
			end

			if Player.IsInFreeroam() then
				Gui.DisplayObjectiveText(fullInstructions)

				Gui.DrawTimerBar('EVENT END', math.max(0, Settings.gun.duration - GetGameTimer() + _gunGameData.startTime), 1)
				Gui.DrawBar('YOUR SCORE', getPlayerPoints() or 0, 2)

				local barPosition = 3
				for i = barPosition, 1, -1 do
					local data = _gunGameData.players[i]
					if data then
						Gui.DrawBar(_playerPositions[i]..GetPlayerName(GetPlayerFromServerId(data.id)), data.points, barPosition, _playerColors[i], true)
						barPosition = barPosition + 1
					end
				end
			end
		end
	end)
end)

RegisterNetEvent('lsv:updateGunGamePlayers')
AddEventHandler('lsv:updateGunGamePlayers', function(players)
	if _gunGameData then
		_gunGameData.players = players
	end
end)

RegisterNetEvent('lsv:finishGunGame')
AddEventHandler('lsv:finishGunGame', function(winners)
	if not _gunGameData then
		return
	end

	if not winners then
		_gunGameData = nil
		return
	end

	local playerPoints = getPlayerPoints()
	_gunGameData = nil

	local playerPosition = nil
	for i = 1, math.min(3, #winners) do
		if winners[i] == Player.ServerId() then
			playerPosition = i
			break
		end
	end

	local messageText = playerPosition and 'You have won Gun Game with a score of '..playerPoints or Gui.GetPlayerName(winners[1], '~p~')..' has won Gun Game.'

	if Player.IsInFreeroam() and playerPoints then
		if playerPosition then
			PlaySoundFrontend(-1, 'Mission_Pass_Notify', 'DLC_HEISTS_GENERAL_FRONTEND_SOUNDS', true)
		else
			PlaySoundFrontend(-1, 'ScreenFlash', 'MissionFailedSounds', true)
		end

		local scaleform = Scaleform.NewAsync('MIDSIZED_MESSAGE')
		scaleform:call('SHOW_SHARD_MIDSIZED_MESSAGE', playerPosition and _titles[playerPosition] or 'YOU LOSE', messageText, 21)
		scaleform:renderFullscreenTimed(10000)
	else
		Gui.DisplayNotification(messageText)
	end
end)
