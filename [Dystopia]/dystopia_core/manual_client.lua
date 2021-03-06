--------------------------------------->>
-- Grand Theft International (GTi)
-- Author: JT Pennington (JTPenn)
-- Date: 08 Jul 2014
-- Resource: GTIrules/rules.lua
-- Version: 1.0
--------------------------------------->>
-- Edited by Zorgman for Dystopia
local currentversion = "alpha 0.75"
local developeremail = "[developer-email]"
local forumname = "[forum-name]"
local font = "default-bold-small"
local quickSelect = {}

-- Create Rules Panel
----------------------->>

function createRulesPanel(rules)
		-- Delete if Already Exists
	if (isElement(windowManual)) then 
		closePanel("left", "up")
		return 
	end
			-- Create windowManual
	local sX, sY = guiGetScreenSize()
	local wX, wY = 700, 500
	local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
	-- sX, sY, wX, wY = 437, 182, 700, 500
	windowManual = guiCreateWindow(sX, sY, wX, wY, "Manual", false)
	guiWindowSetSizable(windowManual, false)
	guiSetAlpha(windowManual, 1.00)
	
	gridlist = guiCreateGridList(9, 24, 225, 467, false, windowManual)
	guiGridListAddColumn(gridlist, "Select a topic:", 0.9)
	guiGridListSetSortingEnabled(gridlist, false)
	--
	addEventHandler("onClientGUIClick", gridlist, updateDocumentation, false)
	
		-- Create the Gridlist Items
	quickSelect = {}
	local curr_sec
	
	topics = {
	
	{"Background",
	
	"After lying dormant for many years, the ground awakened with a roar and a series of catastrophic earthquakes smashed the cities and countryside of\nSan Andreas. The whole state found itself separated from the mainland;\ndeath and mayhem roamed free, spiraling San Andreas deeper into chaos.\n\nWhile the emergency services struggled to contain the disaster and minimize collateral damage, an even greater evil was silently taking over. In the heart of San Fierro, one of the most populous cities of San Andreas, the government-sponsored Zombotech Corporation was researching biological weapons in it’s secret underground labs. The facility was heavily damaged by the cataclysm and a little-known highly infectious agent escaped in the open. The crazed infected took over the streets, derranged minds looking to rip apart anything with a pulse. The reports were few at first, and treated with disbelief. When the authorities finally acknowledged it, the epidemic was too big to be stopped.\n\nAfter initially trying to gather the survivors in the barricaded city of\nLas Venturas, when the outbreak spread behind the fence the Establishment nuked the city and placed a strict military quarantine over San Andreas. Nobody gets in, nobody gets out. They dubbed it ‘The Incident’ in order to minimize its amplitude, the media soon went silent and survivors were forgotten.\n\nTwo years have passed and things have not become better. The people picked things up from where the government left them and started to organize. This is a tough new world, populated with the full spectrum of human kind: resilient survivors, vicious bandits, cannibalistic raiders, oppressive military forces and the regular loons. The line between good and bad was never thinner."},
	
	{"How to win",
	
	"There's only one viable long term survival plan: escape San Andreas! To achieve this, you will need to get 8000 units away from the center of the map, in any direction, by fixing and using one of the escape vehicles.\n\nThis is work in progress. You can't escape yet, you'll end up dead. However, if you still try it and succeed, please let me know how you did it!)"},
	
	{"Character stats",
	
	"Hunger and thirst: Keep your character fed and hydrated! You will need to eat at least once every 30 minutes and drink every 20 minutes to avoid detrimental effects.\nBleeding: Damage from bladed weapons has a chance to cause bleeding, slowly depleting your health. Subsequent attacks stack and prolong the effect. Bleeding can be stopped by using a bandage, or will stop by itself after a random interval.\nStun: Blunt hits taken when you are below 30 hp put your character in a vulnerable stunned state where you cannot move or fight for 10 seconds.\nShock: Most types of damage have a chance to cause shock, shaking your screen and making you unable to aim or perform complex actions. Shock can be negated using painkillers or alcohol, or will stop itself after a random interval.\nFracture: Falling from great heights or being hit by a vehicle have a chance to break your bones. Fractures punish you for jumping and climbing by triggering the shock effect and a chance of aggravating your fracture, adding 10 hp damage each time you jump. Fractures can be cured by using a splint.\nStamina: Is represented by the light blue bar at the bottom of your screen. You have 1000 stamina points and fighting, sprinting, jumping or climbing detract from this. When your stamina gets below a certain value, you will lose the ability to sprint and jump. You regain stamina by crouching, jogging, walking, standing still or consuming certain items. If you deplete your stamina bar and keep pushing it without a chance for recovery you will be hindered by exhaustion. Make sure you stop for a short while to regain breath every time this happens.\nLives: You start with three lives. When you lose all of them your character is dead for good, losing all progress you have made. You can sleep in safe camps beds in order to regain lost lives. A full sleep cycle takes 1 minute and there's a cooldown of 10 minutes for it."},
	
	{"Inventory",
	
	"Inventory is where you keep your items and is divided into three panels:\n\nThe main inventory, of only 3 slots (equivalent of pocket space) and upgradable to 6 slots by equipping a backpack;\n\nThe 9 slot utility belt, where you equip negligeable weight current use items like drugs, maps or lighters;\n\nThe equipment bar with 9 slots, where wieldable weapons and other objects are kept. The actual number of items you can wield at a time is further limited by the weight factor of the items. Your character can equip only 6 units of weight so select your equipment carefully. Read the tooltips for usage instructions.\n\nWhen the inventory is open, you can also see details about your lives, faction and level."},
	
	{"Vehicles",
	
	"The vehicle damage and repair system differs somewhat from that of other gamemodes and needs some explanation.\n\nEach vehicle has two damage gauges. There's an upper one, that represents the actual vehicle health and will cause your engine to stop if it gets below 300 hp. Repair your engine by using a toolbox while next to the vehicle. The lower gauge displays your vehicle's hull integrity, as 10 vehicle parts. If more than 8 vehicle parts are damaged, the car will stop functioning until you replace some broken parts. If the vehicle exploded, it's hull must be repaired to full health. Vehicles need fuel to work and consumption is determined by speed: the faster you go, the more fuel you'll burn. Refuel your vehicle in a fuel marker or by using a gas canister while next to it. Vehicles respawn when they explode or if they are left unoccupied for an hour in an unprotected area. Most camps are safe areas and vehicles left there will save their position. You can also create custom safe areas by building Shelters."},
	
	{"Storage",
	"Besides your inventory, there are a couple of other means for stashing items.\n\nThe most important one is your Strongbox, a large metal container holding up to 100 items, that can be accessed from most main camps. The items you store this way are shared between all strongboxes in the game and are accessible only to you.\n\nYou can also craft Stockpiles, movable 10 slots containers that can be accessed by anyone that finds them. Stockpiles can be picked up and moved around with [H] key and can also be loaded in pickup trucks for easier hauling.\n\nFinally, there is vehicle storage; depending on the type of vehicle, you can have 2 to 30 slots at your disposal, but keep in mind that unused vehicles will respawn, discarding all items they might contain."},
	
	{"NPCs",
	"To interact with NPCs, greet them with key [1]. This will allow you to trade or start missions, if you engage the right type of NPC.\nTarget any generic friendly guard NPC with RMB and press [8] to have them follow you, provided you have at least 50$ to spend. Use [9] to make followers wait and [8] to have them follow you again.\n\nBots have a field of view, so you can sometimes sneak instead of fight them. Crouch to lower chances of being detected. Sneaking is easier in bad weather conditions. You can sneak and strangle NPCs using RMB+[F] while crouching behind them. This will render them unconscious for a short while. "},
	
	{"Key binds",
	"[Q] Inventory\n\n[E] Interact/Pick up items\n\n[H] Pick up/drop objects (fuel barrels, individual loot boxes, stockpiles)\n\n[J] Open/close crafting panel\n\n[O] Open/close character panel\n\n[T] Local chat\n\n[Y] Radio chat (only if equipped)\n\n[U] OOC (global) chat\n\n[I] Squad chat\n\n[Tab] Scoreboard\n\n[1] NPC interaction\n\n[4]...[6] Stances\n\n[7]...[0] Orders\n\n[Alt]+Scroll Switch current gadget\n\n[X] Use current gadget\n\n[R] Reload\n\n[F1] (hold) Quick help\n\n[F4] Group panel\n\n[F5] Toggle debug info\n\n[M] Toggle map (only if equipped)\n\n[L] Toggle headlamp (only if equipped)\n\n[K] Toggle EM Scanner (only if equipped)\n\n[F6] Save character data\n\n[F9] This manual\n\nRMB+[F] Kick/strangle NPCs (works with a fireweapon equipped)\n\n[Alt]+ [H] Dismantle building/minigun\n\nRMB+[F] (while crouched and behind target) Strangle NPC\n\n[Crouch key] Glue to vehicle\n\n[Handbrake] Glue vehicle to vehicle"},
	
	{"Chat channels",
	"There are four chat channels you can use:\n\n[T]: Local chat, as the name implies, has limited reach (30 meters).\n\n[Y]: Radio chat requires a radio device equipped. You can privately chat with your faction by using it.\n\n[U]: OOC chat with global reach. It should be used for general out-of-character chat on the server. It's meant to be RP friendly: is unobtrusive and will fade out faster than regular in-character chat.\n\n[I]: Squad chat allows you to chat privately with your group. Use /create to create a private chat group and /invite [name], /remove [name], /leave to manage it. Subject to change when squads will be oficially implemented."},
	
	{"-----------"," "},
	
	{"Factions:",
	"There are five factions in the game, and they are split in a number of smaller groups, separated by goal, practical purposes or geographical location. While some of these sub-factions are well known and advertise openly, others are more discrete and will only reveal their existence to people they trust. Your actions in the game world will determine to which faction and group you belong to. You can also be banished from all factions, so be careful - life as an unaffiliated looter is not easy. All fresh characters will spawn in the Scavengers faction and you can work your way up (or down) from there."},
	
	{"Scavengers",
	"This is the basic faction of the game. Scavengers inhabit the largest number of locations, most of them around the Los Santos and San Fierro area.\n\nThey are further divided into a number of sub-factions:\n\nSurvivors: All new characters will spawn as survivors. While you cannot access special features that other Scavenger sub-factions might have, you are free to visit their locations and trade or pick up missions.\n\nWastelanders: They inhabit small enclaves in the Bone County region, offering trade and safe locations to all friendly Scavengers in the area.\n\nThe Syndicate: This group is comprised of what's left from the Triads and\nDa Nang Boys of San Fierro, with the Chinese running the show and speaking for both groups. They run Chinatown Market - largest San Andreas trade hub, and Floating City, a shanty town built around a cargo ship anchored in the San Fierro Bay.\n\nThe Cult: A religious group based in Bone County, formed around Allfather Hagry, their self-appointed prophet. Their set of beliefs revolves around a divine cause for the ongoing apocalypse, with zombies sent from hell to torment humanity and make it repent for its sins. They are determined to rid the world of the zombie plague."},
	
	{"The Establishment",
	"The official ruling body of The Territory of San Andreas, the Establishment is comprised of the remnants of military units, local law enforcement and the new militia forces recruited after The Incident. They are supposedly still in contact with the long-time absent US Government - receiving intel and directives directly from Capital City. Their declared goal is to maintain law and order by any cost; however they are not interested in the well-being of their subjects, but in maintaining control in their enclaves, and don’t mind using excessive force for this. Establishment Spec teams are often patrolling the land searching for survivors and transporting them to the Refugee Camp. You can join them as a Refugee.\nHint: To join them you need to either make your way to the SE entrance of the military base at the end of the airstrip and pass the medical examination or get in touch with one of the Spec teams from Los Santos."},
	
	{"Bandits",
	"People with disputable morals usually end up as bandits. This faction's presence is mostly felt in Flint County, but none of the San Andreas regions is safe from this plague."},
	
	{"Raiders",
	"Here are the people that renounced all remnants of morality, bringing chaos everywhere they go and feasting on their fellow men. Nobody wants to have anything to do with them - usually their only interaction with other factions is killing on sight. There are multiple Raider clans: the Man-Eaters and the Painted Dogs in Hunter's Quarry and Los Santos, the Body Snatchers of Whetstone, the Gas Guzzlers of Palm Springs, the Burned Men of Las Venturas. They inhabit a couple of large bases and are spread all around the map. They are known for taking slaves and also maintaining human livestocks in their camps. \n\Raiders refer to themselves as 'The Pack', with Mongrels and Barkers answering to meaner ones like the Hounds or Pitdogs. Raiders don't like hierarchies, but some particularly violent individuals raised to a higher status and have loyal men at their disposal. All raider warchiefs are following the Topdog, who's living in an underground den in Hunter's Quarry. The Topdog is 'elected' through deadly combat and needs to fight challengers regularly so he maintains his rank.\n\nHint: To join the Raiders you need to kill, butcher and eat somebody. Bladed weapon required."},
	
	{"CDF - Civilian Defence Force",
	"The Civilian Defence Force, despite the name on their banners, is not based in Los Santos anymore, but in various small towns and camps scattered in the Red County countryside. As one of them would put it 'when SHTF, they jumped in their BOVs and evac'ed'. They are determined and most important, prepared to survive, but are also trying to do this the right way. CDF has the highest moral standards left and don’t kill people for no reason. They work to colonize and pacify the Red County area, where the Free Folk Militia led by Aaron Freemantle established the Free County of Red and started expanding it westward to Flint and Whetstone. They don’t recognize the authority of the Establishment and don’t like intrusions in their business. This usually leads to armed conflict, where Establishment's gunships often have the final say. While fighting hard battles against the Bandits on the homeland front, CDF made a daring move back into the streets of Los Santos, where it recently opened a highrise operation. Join them by talking with their recruitors (Hint: find one in the streets of Los Santos, close to the leaning skyscrapper)."},
	
	{"Zombies",
	"They first appeared in the crowded cities of San Andreas: crazed humans trying to rip apart anything with a pulse. Nobody thought of them to be 'zombies' at first. Since the world was already in a bad state, with armed gangs rampaging the streets and panicked refugees gathering in the few government safe camps, a few random acts of ultra-violence did not caught attention. There was not enough food, there was not enough gas; only bullets and fear were plenty. This only helped to spread the infection, and when the officials finally acknowledged the epidemic, it was too late to be stopped. Not much is known about the infected to this day. The infection seems to spread through body fluids like saliva and blood and has a short incubation period before altering the brain forever. The metabolism of the infected seems to be modified by the virus, allowing them to bear large periods of time without feeding. The hungrier they get though, the more aggressive they become. Zombies are attracted by noise and are sensitive to light, making days slightly safer than nights. They are more resistant to bodily harm than uninfected humans but can be slowed down by well placed shots to the legs and chest. Headshots are still lethal.\n\nThree types of the infected were observed so far:\nWalkers are the most common variety, not very fast (they still run though, don't let the name fool you) but dangerous in groups.\nRunners are slender hungry zombies, more aggresive and infectious than walkers and brutes. They will sprint after their prey for as long as they need to and will employ evasive maneuvers when shot at. They can usually be encountered in larger numbers outside of the large cities.\nThe Brutes are the strongest infected variety, zombies that recently fed in copious amounts. The virus efficiently converts the flesh they eat into overgrown muscles and fat deposits that protect the body. As a consequence, they can not be headshot, but they also can't climb over obstacles. Brutes have a stomping special attack that will temporarily incapacitate targets. Each time you damage a Brute, there's a small chance it will get frenzied and morph into a Rammer. The Rammer is a highly dangerous foe; it employs a charging attack that can pin down survivors and kill them in seconds."},
	
	{"Locations",
	"You will encounter many bases and shanty towns scattered around the world of San Andreas, each maintained and operated by one of the factions. They have more loot than the abandoned parts of the world and are defended by armed faction members. Locations usually have at least one trader and may have one or more quest NPCs. In these locations, besides the partial safety from attacks, you can usually find beds (in which you should replenish your lives), safe storage, fuel sources and various other facilities. Faction specific vehicle spawns can also be found there."},
	
	{"Money",
	"Unfortunately the apocalypse was not enough to deliver us from this evil, and money still make the world go round. You can earn money by doing missions for NPCs, fighting and betting in the raider arena or LV boxing matches or simply selling the items you scavenge. Use the money to buy items from traders, recruit followers or upgrade your vehicle in mechanic shops."},
	
	{"-----------"," "},
	
	{"Looting and scavenging",
	"Search your surroundings for destructable boxes and break them, they will contain useful items based on the box type and location. (Tip: use [Mouse2]+[F] to perform a heavy attack and break most loot boxes in one hit)\n\nDrums and barrels might contain fuel in various quantities. You will need an empty canister to retrieve it.\n\nScavenge vehicle wrecks for scrap metal and vehicle parts needed for crafting and keeping your own vehicle operational. A toolbox is required for this.\n\nBreak fences and various other destructable objects in order to retrieve wood, metal and wire for your crafting needs.\n\nUse empty bottles in or near a body of water to obtain dirty water.\n\nWith [H] you can pick up some of the barrels and the smaller loot boxes and move them around. Press [H] again while standing on a pickup truck to load them in."},
	
	{"Crafting, building and cooking",
	"Press [J] at any point to see the items you can craft from materials in your inventory.\n\nBlueprints:\n\nCrossbow: Scrap Metal+ Wood+ Wire\nRaider Sword: 2X Scrap Metal+ Rags\nNail Bat: Scrap Metal+ Wood\nMolotov: Rags+ Alcohol\nBroken Bottle: Empty Bottle\nBandage: Rags+ Alcohol\nShards Trap: Broken Bottle+ Wood+ Wire\nBackpack: 2X Rags+ Wire\nBolts: Wood+ Scrap Metal\nSplint: Wood+ Bandages\nIncendiary Trap: Wood+ Gas Canister+ Wire\nCamouflage Suit: 3X Rags (WIP)\nStockpile: Plastic Foil+ Wire\nBarricade: 2X Wood\nWire Fence: 2X Scrap Metal+ Wire\nShelter: 4X Wood+ 2X Scrap Metal\nBed: 3X Scrap Metal+ 2X Rags\n\nAll objects that you build through the crafting menu can be dismantled using [Alt]+[H] combo with a Toolbox equipped.\n\nTo cook, you need to build a fire or use a pre-existing one from a camp. You can only roast meat and boil dirty water for now."},
	
	{"Hunting",
	"In the wilderness you will encounter goats, wild pigs and bears - hunt them for their meat. To butcher the bodies, you will need to equip a bladed weapon. It works on human corpses too!"},
	
	{"Missions","Press [1] when you are close to an NPC and see what it has to say. Generic NPCs will just chat casually, sometimes giving random hints and advices. Named NPCs usually have one or more mission, and interacting with them will open a dialogue window. After you pick up a mission, you can abandon it at any point using the button in the character panel. You can have only one active mission at any given time. Completing missions grants you various rewards: money, experience, karma bonuses and items."},
	
	{"Abilities","Coming soon!"},
	
	{"-----------"," "},
	
	{"Suggestions",
	"I'm open to suggestions and I implement all good fitting ones, so don’t be shy and tell me what you think about this project using the email address listed in the Contact section. Answer is guaranteed and I'll also give full credit for all original ideas."},
	
	{"Development",
	"The current version is "..currentversion..". Required for beta: skills and abilities implementation, karma system and map completion. Once the project hits beta and the core is completed I’ll start focusing more on the missions and story.\n\nI’m looking for like-minded developers!\n\nWanted: honest scripters, mappers, storytellers, 3D artists and testers. Don’t worry if your skills aren’t all that great: being self-thaught myself and still learning everyday, I value skill and enthusiasm in equal measure. I’ll sure find some way in which you can help if you are willing to.\n\nHowever, keep in mind that I’m not looking to monetize this project in any way. I’ve used the work of many community members and the gamemode will be shared alike on the community when completed. You will gain full credit for your work but no other compensation.\n\nSome useful alpha commands (use them in F8 console):\n/savechar : will immediately save your data to your account (note that there is autosave when you quit)\n/unstuck : will respawn you in the middle of the map; you will loose your weapons\n/logout : will open login screen\n/shaders [on/off] : will enable/disable some shaders\n/mappos [comment] : it will save your current location and a comment in the server files"},
	
	--[[{"Changelog 0.73","Map blips added for players and bases.\nPlayer faction changes when repeatedly killing friendlies.\nNPC chatter fixed (won't show up for all players on server anymore).\nHelp screen moved to [F1].\nAdditional emotes added: [1] to [0].\nLoot drop added for all NPCs, based on category.\nPlayer's equipment drops on death.\nGamemode goal added. (preliminary implementation)\nFight against three zombie types: Walkers, Runners and Brutes.\nDuring nightime (21 PM to 9 AM) walkers are faster.\nUse Zombokleen to cure infection, Splint to cure fractures, Adrenaline for a boost.\n30+ items added.\nDeploy four types of traps: Mines, Spikestrips, Shards and Incendiary.\nNew weapons added: Magnum Revolver, Agent Green Canister, Timed Bomb, Flashbang, Rocket Launcher.\nWeapon attachments: Zip Line, M37 Stomper and Laser Pointer.\nUse EM Scanner to locate peds and vehicles or steal a Surveillance Van to do whole neighbourhood scans.\nManual added, press [F9].\nInitial karma implementation.\nR01 Gunship implemented.\nOver 400 vehicles added.\nExtensive map additions: a dense forest in Flint County, a new trash and wrecked vehicles layer, also interiors in the game world for many shops.\nPre-alpha implementation of  strongboxes and karma.\nZombies won't spawn in bases anymore.\nChanged the animation style for crossbow and sawed-off.\nChat channels implemented."},]]
	
	{"Contact",
	"You can drop a line at "..developeremail.." or PM "..forumname.." on the MTA forums. See below for details on how to join our community."}, 
	
	--{"Community","Visit and join our forums:\n\ndystopia.gamingzone.ro\n\nJoin Discord, the place for live updates and community suggestions:\n\ndiscord.gg/vwffgw3"}, 
	
	{"Community",
	"Join Discord, the place for live updates and community suggestions:\n\ndiscord.gg/vwffgw3"}, 
	
	{"Credits",
	"These people contributed (most of them unknowingly) to Dystopia:\n\nManawydan, Slothman, Ransom, Acorp, Neargreen, XX3, CrystalMV, KingGTA1997, Gothem, Daffy, Suerte, alex17, Sasuke, JasperNL, Woovie, Fedor_S, eXo|dragon, RiginOAL, JTPenn, yFletcher, Ren712, Rage, [CN]Honey, Tectron, LagParty, Bluethefurry, Rick, [GER]Rafael-KP_Lead, Gastonito, Mr.Loki, Zorrigas, NinjaThePooh, Falke, SimplyMods, Gamesnert, Earl.4life, Aiboforcen, Adrenaline, Redemtion, Dzsozi, Bonsai, Mike Koenig, Ijudman, 50p, TheLozza, Flower Power, Vick, Karim, Noah_Antilles, Tomas, Houdini, FEAR, freesfx.co.uk, HerbertBoland, MadSick, Chris, fridobeck, PrettySweetie, Eren, r1k3, specahawk, FreeLANMan, Rinke, Myrfin, Kieran, Dutchman101, KWKSND, Tipirodrigo, K1parik, Cordex, ShockWave, IroNicolas, MadnessReloaded, Oscar Ernesto, MoDeR2014, Aleksander19, Guard, Anderson\n\nI tried to maintain a complete credits  list, but since development spanned over more than four years (up to this point) and it started as a personal server project, I might have omitted to add here some people whose work I used or could not identify the author. If you believe you are in this position, I apologize. Please write me an email using the address in the Contact section and I'll update the credits. You may not want your name and/or work associated with this project - in this case let me know and I'll remove it."}
	}
	
	for _,tbl in ipairs(topics) do
		if (not tbl[2]) then
			local row = guiGridListAddRow(gridlist)
			guiGridListSetItemText(gridlist, row, 1, tbl[1], true, false)
			guiGridListSetItemColor(gridlist, row, 1, 215, 25, 25)
		else
			local row = guiGridListAddRow(gridlist)
			guiGridListSetItemText(gridlist, row, 1, tbl[1], false, false)
			quickSelect[row] = tbl[2]
		end
	end
		
	memo = guiCreateMemo(241, 24, 450, 437, "Welcome to Dystopia: The Incident, an original post-apocalyptic sandbox action-RPG built in MTA. This is work in progress, version is "..currentversion.."\n\nFew Rules:\n\n1. You shall be respectful with your fellow players.\n2. You shall not cheat, hack, flood, spam, advertise or grief.\n3. You shall report bugs, glitches and exploits.\n4. You shall speak English on the global chat.\n5. You shall have fun, don't be a drama queen.\n\nClick the topics on the left to learn more about the game.", false, windowManual)
	guiSetFont(memo, font)
	guiMemoSetReadOnly(memo, true)
	
	manualCloseButton = guiCreateButton(506, 467, 185, 23, "Close", false, windowManual)
	--
	addEventHandler("onClientGUIClick", manualCloseButton, closePanel, false)
	
	showCursor(true)
end
addEvent("createRulesPanel", true)
addEventHandler("createRulesPanel", root, createRulesPanel)

-- Panel Functions
------------------->>

function toggleManualPanel()
	forceShowCursor()
	if (isElement(windowManual) and not guiGetVisible(windowManual)) then
		guiSetVisible(windowManual, true)
		showCursor(true)
		addEventHandler("onClientRender",root,forceShowCursor) 

	elseif (isElement(windowManual)) then
		closePanel("left", "up")
	else
		triggerEvent("createRulesPanel", resourceRoot)
	end
end
bindKey("F9", "down", toggleManualPanel)
addCommandHandler("Game manual", toggleManualPanel)

function closePanel(btn, state)
	if (btn ~= "left" or state ~= "up") then return end
	guiSetVisible(windowManual, false) 
	removeEventHandler("onClientRender",root,forceShowCursor) 
	showCursor(false)
	destroyElement(windowManual)
end

function updateDocumentation(btn, state)
	if (btn ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(gridlist)
	if (not row or row == -1) then return end
	guiSetText(memo, quickSelect[row])
end
