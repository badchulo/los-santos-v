-- Manifest
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

resource_type 'gametype' { name = 'Los Santos V' }

-- WarMenu resource
client_script '@warmenu/warmenu.lua'


-- MySQL Async library
server_script '@mysql-async/lib/MySQL.lua'


-- Server modules
server_scripts {
	'modules/utils/table.lua',
	'modules/utils/math.lua',
	'modules/utils/string.lua',
	'modules/utils/timer.lua',

	'modules/logger.lua',
	'modules/weapon.lua',
	'modules/blip.lua',
	'modules/settings.lua',

	'modules/server/db.lua',
	'modules/server/discord.lua',
	'modules/server/crate.lua',
	'modules/server/scoreboard.lua',
	'modules/server/autosave.lua',
	'modules/server/eventmanager.lua',
	'modules/server/missionmanager.lua',
}


-- Server scripts
server_scripts {
	'server/main.lua',
	'server/baseevents.lua',
	'server/session.lua',
	'server/chat.lua',
	'server/report.lua',
	'server/moderator.lua',
	'server/pingkick.lua',
	'server/vehicle.lua',
	'server/duel.lua',

	'server/event/castle.lua',
	'server/event/property.lua',
	'server/event/search.lua',

	'server/shop/ammunation.lua',
	'server/shop/skinshop.lua',

	'server/mission/assetrecovery.lua',
	'server/mission/headhunter.lua',
	'server/mission/marketmanipulation.lua',
	'server/mission/mostwanted.lua',
	'server/mission/velocity.lua',
}


-- Client modules
client_scripts {
	'modules/utils/table.lua',
	'modules/utils/math.lua',
	'modules/utils/string.lua',
	'modules/utils/timer.lua',

	'modules/logger.lua',
	'modules/blip.lua',
	'modules/settings.lua',
	'modules/weapon.lua',

	'modules/client/gui/safezone.lua',
	'modules/client/gui/gui.lua',
	'modules/client/gui/bar.lua',

	'modules/client/world.lua',
	'modules/client/streaming.lua',
	'modules/client/scaleform.lua',
	'modules/client/skin.lua',
	'modules/client/color.lua',
	'modules/client/player.lua',
	'modules/client/map.lua',
	'modules/client/scoreboard.lua',
	'modules/client/missionmanager.lua',
}


-- Client scripts
client_scripts {
	'client/spawn.lua',
	'client/enviroment.lua',
	'client/afk.lua',
	'client/session.lua',
	'client/chat.lua',
	'client/report.lua',
	'client/hud.lua',
	'client/pickup.lua',
	'client/playertags.lua',
	'client/crate.lua',
	'client/pingkick.lua',
	'client/vehicle.lua',
	'client/duel.lua',

	'client/event/castle.lua',
	'client/event/property.lua',
	'client/event/search.lua',

	'client/menu/interaction.lua',
	'client/menu/moderator.lua',

	'client/shop/skinshop.lua',
	'client/shop/ammunation.lua',

	'client/mission/assetrecovery.lua',
	'client/mission/headhunter.lua',
	'client/mission/marketmanipulation.lua',
	'client/mission/mostwanted.lua',
	'client/mission/velocity.lua',
}
