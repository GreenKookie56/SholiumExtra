
SMODS.Joker{ --Riptide Champion (v52)
    key = "ripchamp",
    config = {
        extra = {
            mod = 0.3,
            chips = 1
        }
    },
    loc_txt = {
        ['name'] = 'Riptide Champion (v52)',
        ['text'] = {
            [1] = 'This Joker gains {X:blue,C:white}X#1#{} Chips',
            [2] = 'when each played card is scored',
            [3] = '{C:attention}Resets{} at end of round',
            [4] = '{C:inactive}(Currently{} {X:blue,C:white}X#2#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Joker',
    pools = { ["modprefix_sholextra_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.mod, card.ability.extra.chips}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            card.ability.extra.chips = (card.ability.extra.chips) + card.ability.extra.mod
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.chips
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.chips = 1
                    return true
                end,
                message = "Reset"
            }
        end
    end
}