/datum/interaction/lewd/jack
	description = "Подрочить."
	interaction_sound = null
	require_user_hands = TRUE
	require_user_penis = REQUIRE_EXPOSED
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "jerked off"
	write_log_target = null

/datum/interaction/lewd/jack/display_interaction(mob/living/user)
	var/message

	if(user.is_fucking(user, CUM_TARGET_HAND))
		message = "[pick("дрочит свой член.",
			"прорабатывает свой член по всей длине.",
			"водит рукой по члену.",
			"берется рукой за член и слегка покачивает его.")]"
	else
		message = "[pick("берется рукой за свой член.",
			"начинает дрочить себе рукой.",
			"развлекается рукой со своим членом.")]"
		user.set_is_fucking(user, CUM_TARGET_HAND, user.getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	user.visible_message(message = "<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_HAND, user)
