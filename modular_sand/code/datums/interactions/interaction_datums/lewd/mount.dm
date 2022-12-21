/datum/interaction/lewd/mount
	description = "Сесть киской на член | поза наездницы"
	interaction_sound = null
	require_user_vagina = REQUIRE_EXPOSED
	require_target_penis = REQUIRE_EXPOSED
	max_distance = 1

/datum/interaction/lewd/mount/display_interaction(mob/living/user, mob/living/partner)
	var/message

	if(partner.is_fucking(user, CUM_TARGET_VAGINA))
		message = "[pick("запрыгивает на член <b>[partner]</b>.",
			"прижимает <b>[partner]</b>, садясь на член своей киской")]"
	else
		message = "Уперевшись в грудь <b>[partner]</b>, с влажным хлопком садится на весь член целиком!."
		partner.set_is_fucking(user, CUM_TARGET_VAGINA, partner.getorganslot(ORGAN_SLOT_PENIS))
	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(partner.can_penetrating_genital_cum())
		partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_VAGINA, user)
	user.handle_post_sex(NORMAL_LUST, CUM_TARGET_PENIS, partner)

/datum/interaction/lewd/mountass
	description = "Сесть задницей на член | поза наездницы"
	interaction_sound = null
	require_user_anus = REQUIRE_EXPOSED
	require_target_penis = REQUIRE_EXPOSED
	max_distance = 1

/datum/interaction/lewd/mountass/display_interaction(mob/living/user, mob/living/partner)
	var/message

	if(partner.is_fucking(user, CUM_TARGET_ANUS))
		message = "[pick("раздвигая свою задницу - садится ей на член <b>[partner]</b>.",
			"оседлав всю длину <b>[partner]</b>, начинает водить бедрами, массируя член изнутри своей задницы.")]"
	else
		message = "несколько раз резко садится задницей на член <b>[partner]</b>, резко замирая..."
		partner.set_is_fucking(user, CUM_TARGET_ANUS, partner.getorganslot(ORGAN_SLOT_PENIS))
	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(partner.can_penetrating_genital_cum())
		partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_ANUS, user)
	user.handle_post_sex(NORMAL_LUST, null, partner)

/datum/interaction/lewd/mountface
	description = "Сесть на лицо."
	interaction_sound = null
	require_target_mouth = TRUE
	require_user_anus = REQUIRE_EXPOSED
	max_distance = 1

/datum/interaction/lewd/mountface/display_interaction(mob/living/user, mob/living/partner)
	var/message

	if(user.is_fucking(partner, GRINDING_FACE_WITH_ANUS))
		message = "[pick("запрокинув ноги - садится задницей на лицо <b>[partner]</b>.",
			"ездит своей задницей по лицу <b>[partner]</b>.")]"
	else
		message = "[pick(
			"хватает голову <b>[partner]</b> и прижимает ее к своей заднице.",
			"вскрикивает и резко прижимается задницей к лицу <b>[partner]</b>, резко затихая...")]"
		user.set_is_fucking(partner, GRINDING_FACE_WITH_ANUS, null)

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/squelch1.ogg',
						'modular_sand/sound/interactions/squelch2.ogg',
						'modular_sand/sound/interactions/squelch3.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	user.handle_post_sex(LOW_LUST, null, partner)

/datum/interaction/lewd/thighs
	description = "Поводить по лицу членом."
	max_distance = 1
	require_user_penis = REQUIRE_EXPOSED
	require_target_mouth = TRUE
	interaction_sound = null
	write_log_user = "thigh-trapped (penis)"
	write_log_target = "was smothered (penis) by"
	var/fucktarget = "penis"

/datum/interaction/lewd/thighs/vagina
	description = "Придушить киской."
	require_user_penis = REQUIRE_NONE
	require_user_vagina = REQUIRE_EXPOSED
	write_log_user = "thigh-trapped (vagina)"
	write_log_target = "was smothered (vagina) by"
	fucktarget = "vagina"

/datum/interaction/lewd/thighs/display_interaction(mob/living/user, mob/living/partner)
	var/message
	var/obj/item/organ/genital/genital = null
	var/lust_increase = 1

	if(user.is_fucking(partner, THIGH_SMOTHERING))
		var/improv = FALSE
		switch(fucktarget)
			if("vagina")
				if(user.has_vagina())
					message = pick(list(
						"вжимается киской в лицо <b>[partner]</b>, закрывая весь обзор.",
						"водит киской по лицу и губам <b>[partner]</b>, оставляя на них влажный след."))
				else
					improv = TRUE
			if("penis")
				if(user.has_penis() || user.has_strapon())
					message = pick(list("запрокидывается на лицо <b>[partner]</b>, закрывая собой весь обзор.",
						"засовывает свой член в рот <b>[partner]</b> сжимая голову своими ляшками.",
						"просовывает член в беспомощный рот <b>[partner]</b>, прижимаясь к телу."))
				else
					improv = TRUE
		if(improv)
			message = "водит промежностью по лицу <b>[partner]</b>."
	else
		var/improv = FALSE
		switch(fucktarget)
			if("vagina")
				if(user.has_vagina())
					message = pick(list(
						"прижимается ляшками с лицу <b>[partner]</b>, оставляя на губах и носу влажный след",
						"обхватывает голову <b>[partner]</b> своими ляшками, прежде чем прижаться к ней своей мокрой киской"))
				else
					improv = TRUE
			if("penis")
				if(user.has_penis() || user.has_strapon())
					message = pick(list(
						"прижимается ляшками к лицу <b>[partner]</b>, после чего кладет на него свой влажный член.",
						"обхватывает голову <b>[partner]</b> своими ляшками, прежде чем прикрывает лицо своим членом."))
				else
					improv = TRUE
		if(improv)
			message = "обхватывает голову <b>[partner]</b> своими ляшками, слегка придушивая."
		else
			switch(fucktarget)
				if("vagina")
					genital = partner.getorganslot(ORGAN_SLOT_VAGINA)
				if("penis")
					genital = partner.getorganslot(ORGAN_SLOT_PENIS)
		user.set_is_fucking(partner, THIGH_SMOTHERING, genital)

	var/file = pick('modular_sand/sound/interactions/bj10.ogg',
					'modular_sand/sound/interactions/bj3.ogg',
					'modular_sand/sound/interactions/foot_wet1.ogg',
					'modular_sand/sound/interactions/foot_dry3.ogg')
	playlewdinteractionsound(get_turf(user), file, 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	user.handle_post_sex(lust_increase, THIGH_SMOTHERING, partner)
	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/oral1.ogg',
						'modular_sand/sound/interactions/oral2.ogg'), 70, 1, -1)
	if(fucktarget != "penis" || user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_MOUTH, partner)
