/datum/interaction/lewd/frotting
	description = "Потереться членами"
	require_user_penis = REQUIRE_EXPOSED
	require_target_penis = REQUIRE_EXPOSED
	max_distance = 1
	write_log_user = "frotted"
	write_log_target = "was frotted by"
	interaction_sound = null

/datum/interaction/lewd/frotting/display_interaction(mob/living/user, mob/living/partner)
	var/message

	message = "касается своим членом - члена [partner]."
	user.set_is_fucking(partner, CUM_TARGET_PENIS, user.getorganslot(ORGAN_SLOT_PENIS))
	user.visible_message("<span class='lewd'><b> [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_PENIS, partner)
	if(partner.can_penetrating_genital_cum())
		partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_PENIS, user)

/datum/interaction/lewd/tribadism
	description = "Потереться кисками."
	interaction_sound = null
	require_target_vagina = REQUIRE_EXPOSED
	require_user_vagina = REQUIRE_EXPOSED
	max_distance = 1

/datum/interaction/lewd/tribadism/display_interaction(mob/living/user, mob/living/partner)
	var/message

	if(partner.is_fucking(user, CUM_TARGET_VAGINA))
		message = "[pick("Мягко касается своей киской - киски <b>[partner]</b>",
			"запрокидывает ногу <b>[partner]</b> и соприкасается кисками, раскрывая их.",
			"елозит вперед-назад своей киской по киске <b>[partner]</b>.",
			"несколько раз подскакивает и шлепается кисками с <b>[partner]</b> с такой силой, что капли разбрызгиваются в стороны")]"
	else
		message = "прижимается киской к киске <b>[partner]</b>"
		partner.set_is_fucking(user, CUM_TARGET_VAGINA, partner.getorganslot(ORGAN_SLOT_VAGINA))
	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/squelch1.ogg',
						'modular_sand/sound/interactions/squelch2.ogg',
						'modular_sand/sound/interactions/squelch3.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b> [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_VAGINA, user)
	user.handle_post_sex(NORMAL_LUST, CUM_TARGET_VAGINA, partner)
