/datum/interaction/lewd/grindface
	description = "Потереть ноги об лицо"
	interaction_sound = null
	require_target_mouth = TRUE
	require_user_num_feet = 1
	require_user_feet = REQUIRE_ANY
	max_distance = 1

/datum/interaction/lewd/grindface/display_interaction(mob/living/user, mob/living/partner)
	var/message

	var/shoes = user.get_shoes()

	if(user.is_fucking(partner, GRINDING_FACE_WITH_FEET))
		if(shoes)
			message = "[pick(list("трется своей обувью об лицо <b>[partner]</b>.",
				"надавливает своей обувью на лицо <b>[partner]</b>.",
				"вытирает грязь со своих ботинок об лицо <b>[partner]</b>."))]</span>"
		else
			message = "[pick(list("трется своей ступней об лицо <b>[partner]</b>.",
				"закрывает рот и нос <b>[partner]</b> своей ступней.",
				"обтирается своей ступней лицо и губы <b>[partner]</b>."))]</span>"

	else if(user.is_fucking(partner, GRINDING_MOUTH_WITH_FEET))
		if(shoes)
			message = "[pick(list("достает носок своих ботинок из рта <b>[partner]</b> и ставит его им на лицо.",
				"медленно вытягивает свои ботинки из рта <b>[partner]</b>, ставя их им на лицо."))]</span>"
		else
			message = "[pick(list("достает пальцы своих ступней из рта <b>[partner]</b> и кладет их им на лицо."))]</span>"

		user.set_is_fucking(partner, GRINDING_FACE_WITH_FEET, null)

	else
		if(shoes)
			message = "[pick(list("укладывает свои ботинки поверх лица <b>[partner]</b>'s face.",
				"закидывает свои ботинки на лицо <b>[partner]</b>, сильно прижимая их.",
				"грубо гладет свои ботинки на лицо <b>[partner]</b>."))]</span>"
		else
			message = "[pick(list("укладывает свои ступни поверх лица <b>[partner]</b>.",
				"закидывает свои ступни на лицо <b>[partner]</b>, слегка надавливая.",
				"кладет свои ступни на лицо <b>[partner]</b>."))]</span>"

		user.set_is_fucking(partner, GRINDING_FACE_WITH_FEET, null)

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/foot_dry1.ogg',
						'modular_sand/sound/interactions/foot_dry2.ogg',
						'modular_sand/sound/interactions/foot_dry3.ogg',
						'modular_sand/sound/interactions/foot_dry4.ogg'), 70, 1, -1)
	user.visible_message(message = "<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	partner.handle_post_sex(LOW_LUST, null, user)

/datum/interaction/lewd/grindmouth
	description = "Засунуть ноги в рот."
	interaction_sound = null
	require_target_mouth = TRUE
	require_user_num_feet = 1
	require_user_feet = REQUIRE_ANY
	max_distance = 1

/datum/interaction/lewd/grindmouth/display_interaction(mob/living/user, mob/living/partner)
	var/message

	var/shoes = user.get_shoes()

	if(user.is_fucking(partner, GRINDING_MOUTH_WITH_FEET))
		if(shoes)
			message = "[pick(list("грубо засовывает свои ботинки глубже в рот <b>[partner]</b>.",
				"беспечно засовывает свои ботинки на несколько сантиметров глубже в рот <b>[partner]</b>.",
				"давит своим весом, засовывая свои [shoes] глубже и глубже в рот <b>[partner]</b>."))]</span>"
		else
			message = "[pick(list("шевелит своими пальцами во рту <b>[partner]</b>.",
				"пихает свои ступни глубже в рот <b>[partner]</b> пока те давятся",
				"грубо играется своей ступней с языком <b>[partner]</b>."))]</span>"

	else if(user.is_fucking(partner, GRINDING_FACE_WITH_FEET))
		if(shoes)
			message = "[pick(list("решает запихать свои ботинки поглубже в рот <b>[partner]</b>.",
				"засовывает носок своих ботинок через губы <b>[partner]</b> все глубже и глубже."))]</span>"
		else
			message = "[pick(list("pраскрывает своими пальцами рот <b>[partner]</b> и засовывает туда свою ступню.",
				"давит своей ступней еще сильнее, запихивая ее еще глубже в рот <b>[partner]</b>."))]</span>"

		user.set_is_fucking(partner, GRINDING_MOUTH_WITH_FEET, null)

	else
		if(shoes)
			message = "[pick(list("на секунду медлит а затем одним движением засовывает свои ботинки прямо в рот <b>[partner]</b>.",
				"трется носком своих ботинок об рот <b>[partner]</b>, после чего засовывает его внутрь."))]</span>"
		else
			message = "[pick(list("трется своими грязными ступнями по лицу <b>[partner]</b> прежде чем тыкнуть ими в нос.",
				"проталкивает свою ступню прямо в рот <b>[partner]</b>.",
				"закрывает своей ступней рот и нос <b>[partner]</b>, до попытки вздоха, после чего резко засовывает обе ступни в рот."))]</span>"
		user.set_is_fucking(partner, GRINDING_MOUTH_WITH_FEET, null)

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/foot_wet1.ogg',
						'modular_sand/sound/interactions/foot_wet2.ogg',
						'modular_sand/sound/interactions/foot_wet3.ogg'), 70, 1, -1)
	user.visible_message(message = "<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	partner.handle_post_sex(LOW_LUST, null, user)

/datum/interaction/lewd/footjob
	description = "Подрочить своей ступней."
	interaction_sound = null
	require_user_num_feet = 1
	require_user_feet = REQUIRE_ANY
	require_target_penis = REQUIRE_EXPOSED
	max_distance = 1

/datum/interaction/lewd/footjob/display_interaction(mob/living/user, mob/living/partner)
	var/message
	var/shoes = user.get_shoes(TRUE)

	if(partner.is_fucking(src, CUM_TARGET_FEET))
		message = "[pick("касается члена <b>[partner]</b> своей [shoes ? shoes : pick("ступней", "пяткой")].",
			"гладит член <b>[partner]</b> [shoes ? shoes : pick("своей ступней", "своей пяткой", "своими пальчиками")] по всей длине.",
			"водит вверх и вниз по члену <b>[partner]</b> [shoes ? shoes : pick("своей ступней", "своей пяткой")] .")]"
	else
		message = "[pick("[shoes ? "кладет свои ботинки на" :"кладет свою ступню на"] член <b>[partner]</b>'s .",
			"играет с членом <b>[partner]</b>, используя [shoes ? shoes :"ступню"].")]"
		partner.set_is_fucking(user, CUM_TARGET_FEET, partner.getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/foot_dry1.ogg',
						'modular_sand/sound/interactions/foot_dry3.ogg',
						'modular_sand/sound/interactions/foot_wet1.ogg',
						'modular_sand/sound/interactions/foot_wet2.ogg'), 70, 1, -1)
	user.visible_message(message = "<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(partner.can_penetrating_genital_cum())
		partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_FEET, user)

/datum/interaction/lewd/footjob/double
	description = "Подрочить обоими ступнями"
	require_user_num_feet = 2

/datum/interaction/lewd/footjob/double/display_interaction(mob/living/user, mob/living/partner)
	var/message
	var/shoes = user.get_shoes()

	if(partner.is_fucking(user, CUM_TARGET_FEET))
		message = "[pick("касается члена <b>[partner]</b> своими [shoes ? shoes : pick("ступнями", "пятками")].",
			"гладит член <b>[partner]</b> [shoes ? shoes : pick("своими ступнями", "своими пятками", "своими пальчиками")] по всей длине.",
			"водит вверх и вниз по члену <b>[partner]</b> [shoes ? shoes : pick("своими ступнями", "своими пятками")] .")]"
	else
		message = "[pick("[shoes ? "обхватывает своими [shoes] " : "обхватывает своими [pick("ступнями", "пятками")] "] член <b>[partner]</b>.",
			"играет с членом <b>[partner]</b>, своими [shoes ? shoes : "ступнями"].")]"
		partner.set_is_fucking(user, CUM_TARGET_FEET, partner.getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/foot_dry1.ogg',
						'modular_sand/sound/interactions/foot_dry3.ogg',
						'modular_sand/sound/interactions/foot_wet1.ogg',
						'modular_sand/sound/interactions/foot_wet2.ogg'), 70, 1, -1)
	user.visible_message(message = "<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(partner.can_penetrating_genital_cum())
		partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_FEET, user)

/datum/interaction/lewd/footjob/vagina
	description = "Поиграть своей ступней с киской."
	require_target_vagina = REQUIRE_EXPOSED
	require_target_penis = null

/datum/interaction/lewd/footjob/vagina/display_interaction(mob/living/user, mob/living/partner)
	var/message


	var/shoes = partner.get_shoes(TRUE)

	if(partner.is_fucking(user, CUM_TARGET_FEET))
		message = "[pick("гладит клитор <b>[partner]</b> своей [shoes ? shoes : pick("ступней", "пяткой")].",
			"водит [shoes ? shoes : pick("своей ступней", "своей пяткой", "своими пальчиками")] по киске <b>[partner]</b>.",
			"играется [shoes ? shoes : pick("своей ступней", "своей пяткой", "своей пяткой")] с вагиной <b>[partner]</b>.",
			"игриво водит ступней вверх и вниз по киске <b>[partner]</b>.")]"
	else
		message = "[pick("[shoes ? "касается своими ботинками" : "медленно касается своей ступней"] киски <b>[partner]</b>",
			"раззадоривает киску <b>[partner]</b> используя [shoes ? shoes : "ступню"].")]"
		partner.set_is_fucking(user, CUM_TARGET_FEET, partner.getorganslot(ORGAN_SLOT_VAGINA))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/foot_dry1.ogg',
						'modular_sand/sound/interactions/foot_dry3.ogg',
						'modular_sand/sound/interactions/foot_wet1.ogg',
						'modular_sand/sound/interactions/foot_wet2.ogg'), 70, 1, -1)
	user.visible_message(message = "<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_FEET, user)
