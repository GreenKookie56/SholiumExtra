SMODS.Joker{ --Horseboard
    key = "horseboard",
    config = {
        extra = {
            emult = 8
        }
    },
    loc_txt = {
        ['name'] = 'Horseboard',
        ['text'] = {
            [1] = '{X:enhanced,C:white}^^1{} Mult',
            [2] = 'for every {C:attention}horse react{} in',
            [3] = '{C:dark_edition}Bloonlatro horseboard{}',
            [4] = '(in sholatro-ideas, Bloonlatro server)',
            [5] = '{C:inactive}(Currently{} {X:enhanced,C:white}^^8{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 2
    },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    ee_mult = card.ability.extra.emult
                }
        end
    end
}