/datum/interaction/lewd/fingerass_self
	description = "Поиграть пальцами со своей задницей."
	interaction_sound = null
	require_user_hands = TRUE
	require_user_anus = REQUIRE_EXPOSED
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "fingered self"
	write_log_target = null

/datum/interaction/lewd/fingerass_self/display_interaction(mob/living/user)

	user.visible_message("<span class='lewd'><b>[user]</b> [pick("проводит по своему анусу пальцем.",
		"засовывает себе в задницу палец.",
		"жестко трахает свою задницу пальцем.")]</span>", ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), 'modular_sand/sound/interactions/champ_fingering.ogg', 50, 1, -1)
	user.handle_post_sex(NORMAL_LUST, CUM_TARGET_HAND, user)

/datum/interaction/lewd/finger_self
	description = "Поиграть пальцами со своей киской."
	require_user_hands = TRUE
	require_user_vagina = REQUIRE_EXPOSED
	interaction_sound = null
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "fingered own pussy"
	write_log_target = null

/datum/interaction/lewd/finger_self/display_interaction(mob/living/user)

	user.visible_message("<span class='lewd'><b>[user]</b> [pick("глубоко засовывает пальцы себе в киску.",
		"проникает пальцем в свою вагину.",
		"водит пальцем по губкам своей киски.",
		"жестко трахает свою киску пальцами.")]</span>", ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), 'modular_sand/sound/interactions/champ_fingering.ogg', 50, 1, -1)
	user.handle_post_sex(NORMAL_LUST, CUM_TARGET_HAND, user)
