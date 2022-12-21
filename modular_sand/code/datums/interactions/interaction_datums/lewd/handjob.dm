/datum/interaction/lewd/handjob
	description = "Подрочить член."
	interaction_sound = null
	require_user_hands = TRUE
	require_target_penis = REQUIRE_EXPOSED
	max_distance = 1

/datum/interaction/lewd/handjob/display_interaction(mob/living/user, mob/living/partner)
	var/message

	if(partner.is_fucking(user, CUM_TARGET_HAND))
		message = "[pick("дрочит член <b>[partner]</b>.",
			"быстрыми движениями вверх и вниз дрочит член <b>[partner]</b> по всей длине.",
			"ускоряясь прижимается языком к головке члена <b>[partner]</b>.")]"
	else
		message = "[pick("нежно проведя пальцем - берет в руку член <b>[partner]</b>.",
			"ускоряется и внезапно останавливается, натянув кожу члена <b>[partner]</b> до максимума!")]"
		partner.set_is_fucking(user, CUM_TARGET_HAND, partner.getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>[user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(partner.can_penetrating_genital_cum())
		partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_HAND, user)
