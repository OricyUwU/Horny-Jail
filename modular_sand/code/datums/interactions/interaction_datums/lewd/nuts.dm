/datum/interaction/lewd/nuts
	description = "Отполировать свои шары"
	interaction_sound = null
	require_user_balls = REQUIRE_EXPOSED
	require_target_mouth = TRUE
	max_distance = 1
	write_log_user = "make-them-suck-their-nuts"
	write_log_target = "was made to suck nuts by"

/datum/interaction/lewd/nuts/display_interaction(mob/living/user, mob/living/partner)
	var/message

	var/lust_increase = 1

	if(user.is_fucking(partner, NUTS_TO_FACE))
		message = pick(list(
			"хватает голову <b>[partner]</b> и вдавливает ее в свою промежность.",
			"прижимается шарами к лицу <b>[partner]</b>",
			"грубо водит шарами по языку <b>[partner]</b>",
			"достает свои шары, вытирая их об лицо <b>[partner]</b>."))
	else
		message = pick(list("оттягивает уголок рта <b>[partner]</b> пальцем, открывая им рот, после чего целиком запихивает туда свои шары!",
		"стоит в сантиметрах от [partner], а затем шлепает своими шарами прямо по лицу!"))
		user.set_is_fucking(partner, NUTS_TO_FACE, user.getorganslot(ORGAN_SLOT_PENIS))

	/*playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/nuts1.ogg',
						'modular_sand/sound/interactions/nuts2.ogg',
						'modular_sand/sound/interactions/nuts3.ogg',
						'modular_sand/sound/interactions/nuts4.ogg'), 70, 1, -1)*/ //These files don't even exist but nobody noticed because double-quotes were used instead of single.
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	user.handle_post_sex(lust_increase, CUM_TARGET_MOUTH, partner)

/datum/interaction/lewd/nut_smack
	description = "Шлепнуть по шарам."
	interaction_sound = 'modular_sand/sound/interactions/slap.ogg'
	simple_message = "USER шлепает шары TARGET!"
	require_target_balls = REQUIRE_EXPOSED
	needs_physical_contact = TRUE
	max_distance = 1
	write_log_user = "slapped-nuts"
	write_log_target = "had their nuts slapped by"
