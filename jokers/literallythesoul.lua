
SMODS.Joker{ --Literally The Soul
    key = "literallythesoul",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Literally The Soul',
        ['text'] = {
            [1] = 'Creates a {C:legendary}Legendary{} Joker',
            [2] = 'when {C:attention}this{} Joker is {C:red}destroyed{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    demicolon_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if (context.card_being_destroyed and context.card == card) or context.forcetrigger then
            return {
                func = function()
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Legendary' })
                            if joker_card then
                            end
                            
                            return true
                        end
                    }))
                    
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                    end
                    return true
                end
            }
        end
    end
}