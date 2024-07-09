Config = {}


-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- ██ ▄▄ ██ ▄▄▀█▄ ▄██ ▄▄▀██ ▄▄▄████ ▄▄▀██ ▄▄▀██ ▄▄▄██ ▄▄▀█▄ ▄█▄▄ ▄▄████ ▄▄▀█ ▄▄▀██ ▄▄▀██ ▄▄▀
-- ██ ▀▀ ██ ▀▀▄██ ███ █████ ▄▄▄████ █████ ▀▀▄██ ▄▄▄██ ██ ██ ████ ██████ ████ ▀▀ ██ ▀▀▄██ ██ 
-- ██ █████ ██ █▀ ▀██ ▀▀▄██ ▀▀▀████ ▀▀▄██ ██ ██ ▀▀▀██ ▀▀ █▀ ▀███ ██████ ▀▀▄█ ██ ██ ██ ██ ▀▀ 
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
Config.PriceCreditCard = 50
-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- █▄ ▄█▄▄ ▄▄██ ▄▄▄██ ▄▀▄ ██ ▄▄▄ 
-- ██ ████ ████ ▄▄▄██ █ █ ██▄▄▄▀▀
-- █▀ ▀███ ████ ▀▀▀██ ███ ██ ▀▀▀ 
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
Config.items = 'cartebancaire'
-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- █ ▄▄▀█▄▄ ▄▄██ ▄▀▄ 
-- █ ▀▀ ███ ████ █ █ 
-- █ ██ ███ ████ ███ 
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
Config.LabelAtm = 'ATM'
Config.IconAtm = 'fas fa-credit-card'
Config.AtmProp = {
    "prop_atm_01",
    "prop_atm_02",
    "prop_atm_03",
    "prop_fleeca_atm",
}
-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- ██ ▄▄▄ █▄▀█▀▄███▄▄ ▄▄█ ▄▄▀██ ▄▄▀██ ▄▄ ██ ▄▄▄█▄▄ ▄▄████ ▄▄▀█ ▄▄▀██ ▀██ ██ █▀▄
-- ██ ███ ███ ███████ ███ ▀▀ ██ ▀▀▄██ █▀▀██ ▄▄▄███ ██████ ▄▄▀█ ▀▀ ██ █ █ ██ ▄▀█
-- ██ ▀▀▀ █▀▄█▄▀█████ ███ ██ ██ ██ ██ ▀▀▄██ ▀▀▀███ ██████ ▀▀ █ ██ ██ ██▄ ██ ██ 
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
Config.OpzioniTarget = {

    {
        icon = 'fa-solid fa-building-columns',
        label = 'Ouvrir compte',
        items = Config.items,
        onSelect = function(data)

            if lib.progressCircle({
                duration = 3000,
                label = 'Utiliser votre carte bancaire',
                position = 'bottom',
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                    move = true,
                },
                anim = {
                    dict = 'mp_common',
                    clip = 'givetake1_a'
                },

            }) then 
                apriBanca()
            end
        end,
        canInteract = function(entity, distance, coords, name, bone)
            return not IsEntityDead(entity)
        end
    },
    {
        icon = 'fa-solid fa-dollar',
        label = 'Acheter une carte bancaire',
        onSelect = function(data)

            if lib.progressCircle({
                duration = 3000,
                label = 'En achetant la carte bancaire',
                position = 'bottom',
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                    move = true,
                },
                anim = {
                    dict = 'amb@code_human_wander_clipboard@male@base',
                    clip = 'static'
                },
                prop = {
                    model = "p_amb_clipboard_01",
                    pos = vec3(0.03, 0.03, 0.02),
                    rot = vec3(0.0, 0.0, -1.5)
                },
            }) then 
                TriggerServerEvent('krs_banking:buyCreditCard')
            end
        end,
        canInteract = function(entity, distance, coords, name, bone)
            return not IsEntityDead(entity)
        end
    }
}
-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- ██ ▄▄▀██ ████▄ ▄██ ▄▄ ████ ▄▀▄ █ ▄▄▀██ ▄▄ ████ ▄▄ ██ ▄▄▄██ ▄▄▀
-- ██ ▄▄▀██ █████ ███ ▀▀ ████ █ █ █ ▀▀ ██ ▀▀ ████ ▀▀ ██ ▄▄▄██ ██ 
-- ██ ▀▀ ██ ▀▀ █▀ ▀██ ███████ ███ █ ██ ██ ███████ █████ ▀▀▀██ ▀▀ 
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
Config.PosizioneBanche = {
   
    {
        modello = "a_m_o_genstreet_01",
        posizione = vector4(149.4581, -1042.1184, 28.3680, 339.2084),
        blip = {
            attiva = true,
            sprite = 605,
            colore = 43,
            grandezza = 0.5,
            nome = "Banque"
        }
    },
    {
        modello = "a_m_o_genstreet_01",
        posizione = vector4(313.6332, -280.4372, 53.1647, 339.5239),
        blip = {
            attiva = true,
            sprite = 605,
            colore = 43,
            grandezza = 0.5,
            nome = "Banque"
        }
    },
    {
        modello = "a_m_o_genstreet_01",
        posizione = vector4(243.6680, 226.3152, 105.2876, 166.5750),
        blip = {
            attiva = true,
            sprite = 605,
            colore = 26,
            grandezza = 0.5,
            nome = "Pacific"
        }
    },
    {
        modello = "a_m_o_genstreet_01",
        posizione = vector4(-2961.1650, 482.9424, 14.6970, 89.4931),
        blip = {
            attiva = true,
            sprite = 605,
            colore = 43,
            grandezza = 0.5,
            nome = "Banque"
        }
    },
    {
        modello = "a_m_o_genstreet_01",
        posizione = vector4(1175.0956, 2708.2439, 37.0879, 180.3814),
        blip = {
            attiva = true,
            sprite = 605,
            colore = 43,
            grandezza = 0.5,
            nome = "Banque"
        }
    },
    {
        modello = "a_m_o_genstreet_01",
        posizione = vector4(-351.4123, -51.2799, 48.0365, 348.1584),
        blip = {
            attiva = true,
            sprite = 605,
            colore = 43,
            grandezza = 0.5,
            nome = "Banque"
        }
    },
    {
        modello = "a_m_o_genstreet_01",
        posizione = vector4(-1212.0720, -332.0687, 36.7809, 24.6161),
        blip = {
            attiva = true,
            sprite = 605,
            colore = 43,
            grandezza = 0.5,
            nome = "Banque"
        }
    },
    {
        modello = "a_m_o_genstreet_01",
        posizione = vector4(-112.2425, 6471.1074, 30.6267, 136.0999),
        blip = {
            attiva = true,
            sprite = 605,
            colore = 43,
            grandezza = 0.5,
            nome = "Banque"
        }
    },
}