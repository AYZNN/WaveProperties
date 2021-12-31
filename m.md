
**Description**
> WaveProperties is an amazing ESX & QBUS ready resource, allowing you to create properties including garages.With WaveProperties your players can manage anything imaginable.❤️ ( see video )
> Every features is configurable and can be adapted to all your tastes! 

**Showcase**
> Watch the [Showcase](https://www.youtube.com/watch?v=B_MvXP3gz9w) !

**Tebex**
> [WaveResources | Home (tebex.io)](https://waveresources.tebex.io/) - 50€ + taxes

**Features**
* resmon : 0.0ms Closed, 0.3ms opened
* Use job or Whitelisted identifiers ( to create,edit, or delete properties )
* Property Creator
  * Set up Name,Price, Max  number of players that can OWN the property
  * Set garage limited vehicle spots
  * ~10 ready Interiors
  * Store money, items, weapons
  * Save outfits
  * You can your own properties mappings in config file!
* Garage System
  * GTA:O style, using scaleforms to display stats & upgrades
  * Upgrades are saved
  * Configure if they keep damages or not
  * Enable or not vehicle trackers
* Keys System
  * Give and Delete Keys that you gave
  * Manage tenants accesses ( Garage,Storage,Garage)
  * If they have the key, they can have access to your saved datas ( if you allowed them ) 
* Visit, Rent, Resell ( with taxes ) and Purchase Properties 
* Ringing doorbell
* Anti-Glitchs ( no duplication )
* Nice Blips ( shows you if  you own or if the property is for sale )
* Nice sounds
* Nices Notifications
* Nice scenes
* Property  Furnitures [WIP]
* Property Robberies [WIP]
* built-in RageUI edited
* Multiples Languages supported
* ESX & QBUS Ready
* And more...

**Config Example**
```
waveProperties = {
    frameWork = 'ESX', -- ESX  / QBCORE  ||| VRP not supported yet
    getSharedObject = "esx:getSharedObject", --may be QBCore:GetObject too
    Language = "EN", --FR/EN/DE/ES
    OpenKey = "INSERT", -- https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    Currency = "$",
    getSkinEvent = 'skinchanger:getSkin',
    setClothesEvent = "skinchanger:loadClothes",
    enableJobSystem = true,
    jobName = "realestateagent",
    InteriorList = { --you can include shell & other interiors objects
        [1] = {label = "Trevor",name = "shell_trevor",offset = vector3(0.17, -3.51, -1.39)},
        [2] = {label = "v16 mid",name = "shell_v16mid",offset = vector3(1.37, -14.0, 0.0)},
        [3] = {label = "Lester",name = "shell_lester",offset = vector3(-1.58, -5.84, -1.36)},
        [4] = {label = "Ranch",name = "shell_ranch",offset = vector3(-0.741, -9.142, -2.41)},
        [5] = {label = "Trailer",name = "shell_trailer",offset = vector3(-1.4, -1.7, -1.0)},
        [6] = {label = "v16 Low",name = "shell_v16low",offset = vector3(4.6, -5.7, -2.0)},
        [7] = {label = "High End",name = "shell_highend",offset = vector3(-22.0, -0.4, 6.0)},
        [8] = {label = "High End v2",name = "shell_highendv2",offset = vector3(-10.0, 0.87, 1.0)},
        [9] = {label = "Michael",name = "shell_michael",offset = vector3(-8.7, 5.571, -4.92)},
        --[10] = {name = "prop_name",offset = vector3(0.0, 0.0, 0.0)},
    },
    Blips = {
        myProperty = {
            Sprite = 40,
            Color = 2,
            Scale = 0.7,
        },
        forSaleProperties = {
            Sprite = 411,
            Color = 26,
            Scale = 0.7,
        }
    },
    Markers = {
        markerDistance = 25.0,
        textDistance = 10.0,
        notificationDistance = 5.0,
        menuDrawDistanceFromMarker = 5.0,
    },
    resellPropertyRate = 0.5, --BETWEEN 0.0 AND 1.0 (0% - 100%) ex 0.5 = 50% of the sell price
    vehicleTracker = true,
    maxNumberOutfits = 10,
    maxNumberOfKeysOwner = 3, --max number of players that can have keys of a same property
    enableRents = true,
    RentDivider = 200, --divide the daily rent by how much? --he will pay during days u put [ ex by default 200days ]
    enableRobberies = true,
    ringingAcceptKey = "Y",
    ringingRefuseKey = "X",
    KeepVehicleDamages = true,
    AuthorizedStaffs = {
        ["license:171a23d246444c95bd897754beb26aa197ab3570"] = true,
    },
    savingTimer = 1, --save every 1 minute , recommanded
}
```
