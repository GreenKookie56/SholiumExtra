
SMODS.Joker{ --32 degrees in cornelius
    key = "32c",
    config = {
        extra = {
            dollars = 4
        }
    },
    loc_txt = {
        ['name'] = '32 degrees in cornelius',
        ['text'] = {
            [1] = '{X:spectral,C:white}@icicle{} bro lives in cornelius',
            [2] = '(each icicle alt earns {C:money}$#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 0.7
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.dollars } }
	end,
    
    calculate = function(self, card, context)
        if context.post_trigger  then
            if context.other_card.config.center.key == "j_refugium_iciclezalt" then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 4
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+$"..tostring(2), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
		if context.forcetrigger then
			ease_dollars(lenient_bignum(card.ability.extra.dollars))
			return { message = "$" .. number_format(card.ability.extra.dollars), colour = G.C.MONEY }
		end
    end
}

SMODS.Joker{ --2+3=6
    key = "_236",
    config = {
        extra = {
            xchips0 = 3,
            xmult0 = 2
        }
    },
    loc_txt = {
        ['name'] = '2+3=6',
        ['text'] = {
            [1] = '{X:mult,C:white}x#2#{} Mult',
            [2] = '{X:chips,C:white}x#1#{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xchips0, card.ability.extra.xmult0}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main or context.forcetrigger then
            return {
                x_chips = card.ability.extra.xchips0,
                extra = {
                    Xmult = card.ability.extra.xmult0
                }
            }
        end
    end
}

SMODS.Joker{ --3+2=6
    key = "_326",
    config = {
        extra = {
            xchips0 = 2,
            xmult0 = 3
        }
    },
    loc_txt = {
        ['name'] = '3+2=6',
        ['text'] = {
            [1] = '{X:mult,C:white}x#2#{} Mult',
            [2] = '{X:chips,C:white}x#1#{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xchips0, card.ability.extra.xmult0}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main or context.forcetrigger then
            return {
                x_chips = card.ability.extra.xchips0,
                extra = {
                    Xmult = card.ability.extra.xmult0
                }
            }
        end
    end
}

SMODS.Joker{ --@amphiapple you are incompetent
    key = "amphiappleyouareincompetent",
    config = {
        extra = {
            odds = 6
        }
    },
    loc_txt = {
        ['name'] = '@amphiapple you are incompetent',
        ['text'] = {
            [1] = 'At the start of {C:money}shop{} create {C:common}Hexalia crashout{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["refugeiu_refugeiu_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_refugium_amphiappleyouareincompetent') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.starting_shop  then
            return {
                func = function()
                    
                    local created_joker = false
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        created_joker = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_refugium_hexaliacrashout' })
                                if joker_card then
                                    
                                    
                                end
                                G.GAME.joker_buffer = 0
                                return true
                            end
                        }))
                    end
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                    end
                    return true
                end
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_444fa168', 1, card.ability.extra.odds, 'j_refugium_amphiappleyouareincompetent', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}

SMODS.Joker{ --Cars forehead
    key = "carsforehead",
    config = {
        extra = {
            cardssold = 1
        }
    },
    loc_txt = {
        ['name'] = 'Cars forehead',
        ['text'] = {
            [1] = 'Why is it so      {s:2.9}LARGE{}',
            [2] = '',
            [3] = 'when card is sold, gain {X:mult,C:white}X1{} Mult',
            [4] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 8
    },
    display_size = {
        w = 71 * 1.5, 
        h = 95 * 1.2
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["refugeiu_refugeiu_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.cardssold}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.cardssold
            }
        end
        if context.selling_card  then
            return {
                func = function()
                    card.ability.extra.cardssold = (card.ability.extra.cardssold) + 1
                    return true
                end,
                message = "Largened forehead!"
            }
        end
    end
}

if Cryptid then

SMODS.Joker{ --Did Unc Snap
    key = "diduncsnap",
    config = {
        extra = {
            odds = 41
        }
    },
    loc_txt = {
        ['name'] = 'Did Unc Snap',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance to {C:attention}force-trigger{}',
            [2] = '{C:attention}Joker{} to the left when {C:red}ANYTHING{} happens'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 9
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
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_refugium_diduncsnap') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable or context.post_trigger or (context.cardarea == G.jokers and context.joker_main)
				or (context.individual and context.cardarea == G.play))   then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_c127eee4', 1, card.ability.extra.odds, 'j_refugium_diduncsnap', false) then
     			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					if Cryptid.demicolonGetTriggerable(G.jokers.cards[i-1])[1] then
						local results = Cryptid.forcetrigger(G.jokers.cards[i-1], context)
						if results and results.jokers then
							return results.jokers
						end
					end
				end
			end
            return true
                end
            end
        end
    end
}
end
SMODS.Joker{ --Doreo Guide
    key = "doreoguide",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Doreo Guide',
        ['text'] = {
            [1] = 'This Joker gives {C:red}+10{} Mult',
            [2] = 'for every {C:attention}working{} doreo\'s guide',
            [3] = '{C:inactive}(Currently {}{C:red}+0{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers'
}
if Talisman then
SMODS.Joker{ --Gabe Owser Factory
    key = "gabeowser",
    config = {
        extra = {
            mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Gabe Owser Factory',
        ['text'] = {
            [1] = '{X:legendary,C:white}^#1#{} Mult',
            [2] = 'when a card is sold, scale',
            [3] = 'value with {C:dark_edition}random{} operator'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 30,
    rarity = "refugium_peculiar",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {lenient_bignum(card.ability.extra.mult)}}
    end,
    
    calculate = function(self, card, context)
        if context.selling_card  and not context.blueprint then
            local result = pseudorandom(pseudoseed("refugium_gabebowser"), 1, 67)
            if result <= 47 then
                local add = pseudorandom('gabebowser', 2, 10)
                card.ability.extra.mult = lenient_bignum(card.ability.extra.mult + (add / 10))
                return {message = "+"..tostring(add / 10), colour = G.C.DARK_EDITION}
            elseif result <= 50 then 
                local bigadd = pseudorandom('gabebowser', 2, 10)
                card.ability.extra.mult = lenient_bignum(card.ability.extra.mult + (bigadd ^ 2))
                return {message = "+"..tostring(bigadd ^ 2), colour = G.C.DARK_EDITION}
            elseif result <= 66 then 
                local x = pseudorandom('gabebowser', 10, 20)
                card.ability.extra.mult = lenient_bignum(card.ability.extra.mult * (x / 10))
                return {message = "x"..tostring(x / 10), colour = G.C.DARK_EDITION}
            elseif result <= 67 then 
                local exp = pseudorandom('gabebowser', 10, 15)
                card.ability.extra.mult = lenient_bignum(card.ability.extra.mult ^ (exp / 10))
                return {message = "^"..tostring(exp / 10), colour = G.C.DARK_EDITION}
            end
        end
        if context.cardarea == G.jokers and context.joker_main then
            return {
                emult = lenient_bignum(card.ability.extra.mult)
            }
        end
    end
}
end

SMODS.Joker{ --Hexalia crashout
    key = "hexaliacrashout",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Hexalia crashout',
        ['text'] = {
            [1] = 'When Blind is selected, create {C:enhanced}Polychrome Tag{},',
            [2] = 'then destroy this joker'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["refugeiu_refugeiu_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local tag = Tag("tag_polychrome")
                            if tag.name == "Orbital Tag" then
                                local _poker_hands = {}
                                for k, v in pairs(G.GAME.hands) do
                                    if v.visible then
                                        _poker_hands[#_poker_hands + 1] = k
                                    end
                                end
                                tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                            end
                            tag:set_ability()
                            add_tag(tag)
                            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                            return true
                        end
                    }))
                    return true
                end,
                message = "Created Tag!",
                extra = {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:explode({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end,
                    colour = G.C.RED
                }
            }
        end
    end
}

SMODS.Joker{ --joc
    key = "joc",
    config = {
        extra = {
            dollars0 = 0,
            mult0 = 50
        }
    },
    loc_txt = {
        ['name'] = 'joc',
        ['text'] = {
            [1] = 'fore i go broke like {C:legendary}joc{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local dollar_value = 0 - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(0), colour = G.C.MONEY})
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = 50
            }
        end
    end
}

SMODS.Joker{ --israeli joc
    key = "israelijoc",
    config = {
        extra = {
            sell_value0 = 0,
            sell_value = 50,
            mult0 = 50
        }
    },
    loc_txt = {
        ['name'] = 'israeli joc',
        ['text'] = {
            [1] = 'fore i get {C:attention}RICH{} like israeli joc'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            if to_big(G.GAME.dollars) > to_big(939) then
                error("EasternFarmer Was Here")
            else
                return {
                    func = function()
                        for i, target_card in ipairs(G.jokers.cards) do
                            if target_card.set_cost then
                                target_card.ability.extra_value = 0
                                target_card:set_cost()
                            end
                        end
                        return true
                    end,
                    message = "All Jokers Sell Value: $"..tostring(0),
                    extra = {
                        func = function()local my_pos = nil
                            for i = 1, #G.jokers.cards do
                                if G.jokers.cards[i] == card then
                                    my_pos = i
                                    break
                                end
                            end
                            local target_card = G.jokers.cards[my_pos]
                            target_card.ability.extra_value = 50
                            target_card:set_cost()
                            return true
                        end,
                        message = "Sell Value: $"..tostring(50),
                        colour = G.C.MONEY
                    }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = 50
            }
        end
    end
}
if Cryptid then
SMODS.Joker{ --Ninja Kiwi balance be like
    key = "nksucks",
    config = {
        extra = {
            version = 53
        }
    },
    loc_txt = {
        ['name'] = 'Ninja Kiwi balance be like',
        ['text'] = {
            [1] = 'At the end of round,',
            [2] = '{C:attention}Doubles{} value of Joker to the {C:attention}right{},',
            [3] = '{C:attention}Halves{} value of Joker to the {C:attention}left{}',
            [4] = 'if both Jokers have mutable values'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.version}}
    end,
    
	calculate = function(self, card, context)
		if
			(context.end_of_round and not context.repetition and not context.individual and not context.blueprint)
			or context.forcetrigger
		then
			local check = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					if i < #G.jokers.cards and i >1 then
						if not (Card.no(G.jokers.cards[i + 1], "immutable", true) or Card.no(G.jokers.cards[i - 1], "immutable", true)) then
							check = true
							Cryptid.manipulate(G.jokers.cards[i + 1], { value = 2 })
							Cryptid.manipulate(G.jokers.cards[i - 1], { value = 0.5 })
						end
					end
				end
			end
			if check then
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{ message = 'update is out!', colour = G.C.GREEN }
				)
			end
		end
	end
}
end