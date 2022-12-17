ESX = nil 
TriggerEvent(Config.Menu.getESX, function(obj) ESX = obj end)

local menuState = false
local inVehicle = false

Citizen.CreateThread(Function()
     while true do 
        inVehicle = IsPedInAnyVehicle(PlayerPedId(), true)
        Citizen.Wait(500)
       
        end
    end)

local main_menu = RageUI.CreateMenu("SunLine","Intéraction")
local inventory = RageUI.CreateSubMenu(main_menu, Config.Menu.SunLine, "Inventaire")
local wallet = RageUI.CreateSubMenu(main_menu, Config.Menu.SunLine, "Portefeuille")
local manage_weapon = RageUI.CreateSubMenu(main_menu, Config.Menu.SunLine, "Gestion des armes")
local manage_clothes = RageUI.CreateSubMenu(main_menu, Config.Menu.SunLine, "Gesion des vetements")
local manage_enterprise = RageUI.CreateSubMenu(main_menu, Config.Menu.SunLine, "Gesion de l\'entreprise")
local manage_organization = RageUI.CreateSubMenu(main_menu, Config.Menu.SunLine, "Gesion de l'organisation")
local manage_vehicle = RageUI.CreateSubMenu(main_menu, Config.Menu.Sunline, "Gestion du véhicule")
local administration = RageUI.CreateSubMenu(main_menu, Config.Menu.SunLine, "Administration")

main_menu.Closed = function()
    menuState = false
end

function OpenMenu()
    if menuState then
        menuState = false
        RageUI.Visible(main_menu, false)
    else
        menuState = true
        RageUI.Visible(main_menu, true)
    end

    CreateThread(function()
        while menuState do
            Wait(1)

            RageUI.IsVisible(main_menu, function()

                RageUI.Button(" Inventaire", nil, {}, true, {
                }, inventory)
                
                RageUI.Button(" Portefeuille", nil, {}, true, {
                }, wallet)

                RageUI.Button(" Gestion des vetements", nil, {}, true, {
                 }, manage_weapon)
                
                 RageUI.Button(" Gestion du véhicule", nil, {}, true, {
                }, manage_vehicle)
                
                RageUI.Button(" Gesion de l'entreprise", nil, {}, true, {
                 }, manage_enterprise)   
            
                RageUI.Button(" Gesion de l'organisation", nil, {}, true, {
                }, manage_organization)
                if inVehicle then
                   RageUI.Button(" Gestion du véhicule", nil, {}, true, {
                     }, manage_vehicle)
                else
                    RageUI.Button(" Gestion du véhicule", nil, {RightBadge = RageUI.BadgeStyle.Star}, false, {
                     }, )
                
                    end)
            
                RageUI.line
                RageUI.Button(" Administration", nil, {}, true, {
                }, administration)

        end)

          RageUI.IsVisible(inventory, function()
            
            RageUI.Separator("Inventaire ~r~")
            
        end
    
    RageUI.IsVisible(manage_vehicle, function()

    end) 
    
    
       end
    end)
end

 Keys.Register(Config.Menu.Key, "Menu", "Ouvrir le menu", function()
     OpenMenu()
 end)   
  