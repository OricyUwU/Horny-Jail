/datum/interaction/lewd/titgrope_self
	description = "Помассировать свою грудь."
	require_user_hands = TRUE
	require_user_breasts = REQUIRE_ANY
	user_is_target = TRUE
	interaction_sound = null
	max_distance = 0
	write_log_user = "groped own breasts"
	write_log_target = null

/datum/interaction/lewd/titgrope_self/display_interaction(mob/living/user)
	var/message

	if(user.a_intent == INTENT_HARM)
		message = "[pick("агрессивно хватает свою грудь.",
					"хватается за свою грудь.",
					"сильно сжимает руками свою грудь.",
					"шлепает себя по груди!",
					"сжимает пальцами свою грудь.")]"
	else
		message = "[pick("нежно берет в руки свою грудь.",
					"мягко сжимает себе грудь.",
					"аккуратно берется за свою грудь.",
					"проводит пальцами по груди.",
					"нежно проводит пальцами по своим соскам.",
					"еле касаясь - проводит по груди пальцем.")]"
	if(prob(5 + user.get_lust()))
		user.visible_message("<span class='lewd'><b>\The [user]</b> [pick("подрагивает от возбуждения.",
				"тихо постанывает.",
				"выдыхает с нежным стоном.",
				"вздыхает.",
				"слегка трясется.",
				"прикусывает нижнюю губу.")]</span>")
	user.visible_message(message = "<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), 'modular_sand/sound/interactions/squelch1.ogg', 50, 1, -1)
	user.handle_post_sex(NORMAL_LUST, CUM_TARGET_HAND, user)


/datum/interaction/lewd/self_nipsuck
	description = "Пососать свою грудь."
	require_user_breasts = REQUIRE_EXPOSED
	require_user_mouth = TRUE
	user_is_target = TRUE
	interaction_sound = null
	max_distance = 0
	write_log_user = "sucked their own nips"
	write_log_target = null

/datum/interaction/lewd/self_nipsuck/display_interaction(mob/living/user, mob/living/target)
	var/message
	var/obj/item/organ/genital/breasts/milkers = user.getorganslot(ORGAN_SLOT_BREASTS)
	var/milktype = milkers?.fluid_id
	var/modifier
	var/list/lines

	if(!milkers || !milktype)
		return

	var/datum/reagent/milk = find_reagent_object_from_type(milktype)

	var/milktext = milk.name

	lines = list(
		"подносит свою грудь к губам и начинает сосать соски",
		"высасывает [lowertext(milktext)] из своей груди и делает глубокий глоток",
		"с удовлетворением наполняет свой рот своим же [lowertext(milktext)]"
	)

	message = "<span class='lewd'><b>[user]</b> [pick(lines)]</span>"
	user.visible_message(message, ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/oral1.ogg',
						'modular_sand/sound/interactions/oral2.ogg'), 70, 1, -1)

	switch(milkers.size)
		if("c", "d", "e")
			modifier = 2
		if("f", "g", "h")
			modifier = 3
		else
			if(milkers.size in milkers.breast_values)
				modifier = clamp(milkers.breast_values[milkers.size] - 5, 0, INFINITY)
			else
				modifier = 1
	user.reagents.add_reagent(milktype, rand(1,3 * modifier))
