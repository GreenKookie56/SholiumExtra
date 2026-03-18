
SMODS.Joker{ --Red Sauda
    key = "redsauda",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Red Sauda',
        ['text'] = {
            [1] = 'Swaps {C:blue}Chips{} and {C:red}Mult{}',
            [2] = 'before scoring'
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
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Joker',
    pools = { ["modprefix_sholiumx_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            return {
                swap = true
            }
        end
    end
}