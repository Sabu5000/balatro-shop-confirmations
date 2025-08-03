--- STEAMODDED HEADER
--- MOD_NAME: Balatro Transaction Confirmations
--- MOD_ID: balatro-transaction-confirmations
--- MOD_AUTHOR: [Sabu5000]
--- MOD_DESCRIPTION: Adds confirmation dialogs to all card purchases and sales. Shows 'Go Back' (default) and 'Continue' options.
--- BADGE_COLOUR: 4CAF50
--- VERSION: 1.0.0
--- PREFIX: tx_confirm

local function create_multiline_text(text, text_scale, alignment, padding)
	local text = text or { }
	for i, v in ipairs(text) do
		text[i] = {
			n = G.UIT.R,
			config = {
				align = alignment or "cm",
				padding = padding or 0.05
			},
			nodes = {
				{
					n = G.UIT.T,
					config = {
						text = v,
						scale = text_scale or 1,
						colour = G.C.UI.TEXT_LIGHT,
						shadow = true
					}
				}
			}
		};
	end;

	return text
end

local function create_UIBox_generic_container(options)
    options = options or {
		content = {}
	}

    return {
		{
			n = G.UIT.R,
			config = {
				align = "cm",
				padding = 0.03,
				colour = G.C.UI.TRANSPARENT_LIGHT,
				r = 1
			},
			nodes = {
				{
					n = G.UIT.R,
					config = {
						align = "cm",
						padding = 0.05,
						colour = G.C.DYN_UI.MAIN,
						r = 1
					},
					nodes = {
						{
							n = G.UIT.R,
							config = {
								align = "cm",
								colour = G.C.DYN_UI.BOSS_DARK,
								minw = options.width or 10,
								minh = options.height or 4,
								r = 1,
								padding = 0.08
							},
							nodes = options.content
						}
					}
				}
			}
		}
	}
end

local function create_UIBox_transaction_confirmation(options)
	options = options or {}

	return {
		{
			n = G.UIT.C,
			config = {
				align = "cm",
				padding = 0,
				minw = 5,
				minh = 4,
				r = 1,
				colour = G.C.UI.BACKGROUND_DARK
			},
			nodes = {
				{
					n = G.UIT.R,
					config = {
						align = "cm",
						padding = 0.3,
						minw = 5,
						minh = 2,
						maxw = 5,
						r = 1
					},
					nodes = create_multiline_text({
						options.action_text or "Confirm this action?",
						options.details or ""
					}, 0.75, "cm", 0.02, 1)
				},
				{
					n = G.UIT.R,
					config = {
						align = "cm",
						padding = 0.025,
						minw = 5,
						minh = 2,
						maxw = 5,
						r = 1
					},
					nodes = {
						{
							n = G.UIT.R,
							config = {
								align = "cm",
								padding = 0.025,
								minw = 5,
								minh = 2,
								maxw = 5,
								r = 1
							},
							nodes = {
								{
									n = G.UIT.R,
									config = {
										align = "cm",
										padding = 0.05,
										minw = 4.75,
										minh = 1,
										maxw = 4.75,
										r = 1
									},
									nodes = {
										UIBox_button({
											button = 'tx_go_back', 
											label = { "GO BACK" },
											minw = 4.75, 
											minh = 0.95, 
											scale = 0.5, 
											colour = G.C.BLUE,
											id = 'tx_go_back'
										})
									}
								},
								{
									n = G.UIT.R,
									config = {
										align = "cm",
										padding = 0.05,
										minw = 4.75,
										minh = 1,
										maxw = 5,
										r = 1
									},
									nodes = {
										UIBox_button({
											button = 'tx_continue_action', 
											label = { "CONTINUE" },
											minw = 4.75, 
											minh = 0.95, 
											scale = 0.5, 
											colour = G.C.GREEN,
											id = 'tx_continue'
										})
									}
								}
							}
						}
					}
				}
			}
		}
	}
end

-- Global variables for confirmation system
local confirm_transaction_action = nil

G.UIDEF.transaction_confirmation_box = function(action_text, details)
	return {
		n = G.UIT.ROOT,
		config = {
			align = "cm",
			padding = 0.1,
			r = 2
		},
		nodes = create_UIBox_generic_container({
			content = create_UIBox_transaction_confirmation({
				action_text = action_text,
				details = details
			})
		})
	}
end

G.FUNCS.tx_continue_action = function()
	if confirm_transaction_action then
		confirm_transaction_action()
	end
	G.FUNCS.exit_overlay_menu()
	confirm_transaction_action = nil
end

G.FUNCS.tx_go_back = function()
	G.FUNCS.exit_overlay_menu()
	confirm_transaction_action = nil
end

-- Helper function to show transaction confirmation
local function show_transaction_confirmation(action_text, details, confirm_callback)
	confirm_transaction_action = confirm_callback
	G.FUNCS.overlay_menu({definition = G.UIDEF.transaction_confirmation_box(action_text, details)})
end

-- Store original functions - will need to find the correct function names
-- Common possibilities: buy_from_shop, purchase_card, sell_card, etc.
-- For now, I'll use placeholder names and we can adjust based on testing

-- Hook buy function (placeholder - need to find actual function name)
if G.FUNCS.buy_from_shop then
	local original_buy_from_shop = G.FUNCS.buy_from_shop
	G.FUNCS.buy_from_shop = function(e, ...)
		local args = {...}
		show_transaction_confirmation(
			"Purchase this item?",
			"",
			function()
				original_buy_from_shop(e, unpack(args))
			end
		)
	end
end

-- Hook sell function (placeholder - need to find actual function name)
if G.FUNCS.sell_card then
	local original_sell_card = G.FUNCS.sell_card
	G.FUNCS.sell_card = function(e, ...)
		local args = {...}
		show_transaction_confirmation(
			"Sell this card?",
			"This action cannot be undone",
			function()
				original_sell_card(e, unpack(args))
			end
		)
	end
end

-- Alternative approach: Hook common click functions that might handle transactions
-- We can try hooking Card:click() or use_card() functions and check context

print("Balatro Transaction Confirmations mod loaded - v1.0.0")
print("Note: Function hooks may need adjustment based on actual Balatro function names")