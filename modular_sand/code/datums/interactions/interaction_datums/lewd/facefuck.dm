/datum/interaction/lewd/facefuck
	var/mob/living/
	description = "Трахнуть в рот."
	interaction_sound = null
	require_target_mouth = TRUE
	require_user_penis = REQUIRE_EXPOSED
	max_distance = 1
	var/fucktarget = "penis"

/datum/interaction/lewd/facefuck/vag
	description = "Сесть киской на лицо."
	require_user_penis = null
	require_user_vagina = REQUIRE_EXPOSED
	fucktarget = "vagina"

/datum/interaction/lewd/facefuck/display_interaction(mob/living/user, mob/living/partner)
	var/message
	var/obj/item/organ/genital/genital = null
	var/retaliation_message = FALSE

	if(user.is_fucking(partner, CUM_TARGET_MOUTH))
		var/improv = FALSE
		switch(fucktarget)
			if("vagina")
				if(user.has_vagina())
					message = pick(
						"водит киской по лицу <b>[partner]</b>.",
						"вдавливает руками голову <b>[partner]</b> глубже в свою киску.",
						"играет своей киской с языком <b>[partner]</b>.",
						"засовывает рот <b>[partner]</b> между своих ляшек.",
						"смотрит в глаза <b>[partner]</b>, надавливая своей киской на теплый и влажный язычок.",
						"покачивает бедрами, вдавливаясь киской в лицо <b>[partner]</b>.",
						)
					if(partner.a_intent == INTENT_HARM)
						// adjustBruteLoss(5)
						retaliation_message = pick(
							"явно не очень рада таким заниматься...",
							"пытается отвернуться от вагины [user], пока та с ухмылкой удерживает голову!",
						)
				else
					improv = TRUE
			if("penis")
				if(user.has_penis() || user.has_strapon())
					message = pick(
						"грубо трахает <b>[partner]</b> в рот.",
						"засовывает свой член в глотку <b>[partner]</b>!",
						"надавливает своим членом так, что <b>[partner]</b> начинает давиться с глухим звуком!",
						"хватает волосы <b>[partner]</b> и тащит, пока губы не упираются в основание члена!",
						"смотрит в глаза <b>[partner]</b>, пока член скользит по жадному язычку.",
						"делает глубокие движения бедрами, все глубже погружаюсь в рот <b>[partner]</b>.",
						)
					if(partner.a_intent == INTENT_HARM)
						// adjustBruteLoss(5)
						retaliation_message = pick(
							"упирается взглядом в колени [user], пытаясь выскользнуть из хватки...",
							"пытается стиснув зубы не пустить член [user] в свой рот, но он все равно заходит!",
						)
				else
					improv = TRUE
		if(improv)
			message = pick(
				"трется об лицо <b>[partner]</b>.",
				"наслаждается ощущением лица <b>[partner]</b> между голых ног.",
				"вдавливается в язык <b>[partner]</b>.",
				"хватает  волосы <b>[partner]</b> и надавливает до странного пустое место между ног...",
				"смотрит в глаза <b>[partner]</b>, держа их голову между своих ляшек",
				"покачивает бедрами, вдавливаясь в лицо <b>[partner]</b>.",
				)
			if(partner.a_intent == INTENT_HARM)
				// adjustBruteLoss(5)
				retaliation_message = pick(
					"упирается взглядом в колени [user], пытаясь выскользнуть из хватки...",
					"пытается вырваться из положения между ляшками [user]!",
				)
	else
		var/improv = FALSE
		switch(fucktarget)
			if("vagina")
				if(user.has_vagina())
					message = "надавливает киской на лицо <b>[partner]</b>."
				else
					improv = TRUE
			if("penis")
				if(user.has_penis() || user.has_strapon())
					if(user.is_fucking(partner, CUM_TARGET_THROAT))
						message = "медленно вытягивает свой член из глотки <b>[partner]</b>..."
					else
						message = "касается губ <b>[partner]</b> основанием своего члена."
				else
					improv = TRUE
		if(improv)
			message = "прижимается своей промежностью к лицу <b>[partner]</b>."
		else
			switch(fucktarget)
				if("vagina")
					genital = partner.getorganslot(ORGAN_SLOT_VAGINA)
				if("penis")
					genital = partner.getorganslot(ORGAN_SLOT_PENIS)
		user.set_is_fucking(partner, CUM_TARGET_MOUTH, genital)

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/oral1.ogg',
						'modular_sand/sound/interactions/oral2.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(retaliation_message)
		user.visible_message("<font color=red><b>\The <b>[partner]</b></b> [retaliation_message]</span>", ignored_mobs = user.get_unconsenting())
	if(fucktarget != "penis" || user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_MOUTH, partner)

/datum/interaction/lewd/throatfuck
	description = "Трахнуть в глотку | Наносит удушающий урон"
	interaction_sound = null
	require_user_penis = REQUIRE_EXPOSED
	require_target_mouth = TRUE
	max_distance = 1

/datum/interaction/lewd/throatfuck/display_interaction(mob/living/user, mob/living/partner)
	var/message
	var/obj/item/organ/genital/genital = null
	var/retaliation_message = FALSE

	if(user.is_fucking(partner, CUM_TARGET_THROAT))
		message = "[pick(
			"агрессивно засовывает свой член в глотку <b>[partner]</b>, пока те не начнут давиться!",
			"душит <b>[partner]</b> своим членом, заходя на всю длину.",
			"грубо трахает <b>[partner]</b> в горло, шлепая яйцами по их лицу.",
			"заходит все глубже в горло [partner], при попытке сделать вдох")]"
		if(rand(3))
			partner.emote("cough [user]")
			/*if(prob(1) && istype(partner)) //Handled on modular_splurt
				partner.adjustOxyLoss(5)*/
		if(partner.a_intent == INTENT_HARM)
			// adjustBruteLoss(5)
			retaliation_message = pick(
						"упирается взглядом в колени [user], пытаясь выскользнуть из хватки...",
						"со слезами на глазах пытается вытащить член [user] из своего горла!",
			)
	else if(user.is_fucking(partner, CUM_TARGET_MOUTH))
		message = "заталкивает свой член в рот <b>[partner]</b>, скользя и проникая в глотку!"
		var/check = user.getorganslot(ORGAN_SLOT_PENIS)
		if(check)
			genital = check
		user.set_is_fucking(partner, CUM_TARGET_THROAT, genital)
	else
		message = "вдавливает свой член прямиком в горло <b>[partner]</b>!"
		var/check = user.getorganslot(ORGAN_SLOT_PENIS)
		if(check)
			genital = check
		user.set_is_fucking(partner, CUM_TARGET_THROAT, genital)

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/oral1.ogg',
						'modular_sand/sound/interactions/oral2.ogg'), 70, 1, -1)
	user.visible_message(message = "<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(retaliation_message)
		user.visible_message(message = "<font color=red><b>\The <b>[partner]</b></b> [retaliation_message]</span>", ignored_mobs = user.get_unconsenting())
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_THROAT, partner)
