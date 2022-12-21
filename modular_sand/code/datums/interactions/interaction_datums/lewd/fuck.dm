/datum/interaction/lewd/fuck
	description = "Трахнуть в киску."
	require_user_penis = REQUIRE_EXPOSED
	require_target_vagina = REQUIRE_EXPOSED
	write_log_user = "fucked"
	write_log_target = "was fucked by"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/fuck/display_interaction(mob/living/user, mob/living/partner)
	var/message

	if(user.is_fucking(partner, CUM_TARGET_VAGINA))
		message = "[pick(
			"с влажным звуком входит в вагину <b>[partner]</b>.",
			"вставляет член в киску <b>[partner]</b>, с каждым разом вставляя все глубже",
			"начинает резко вставлять член в вагину <b>[partner]</b>!",
			"медленно заходит членом в киску <b>[partner]</b>, а затем резко входит на всю длину!")]"
	else
		message = "на секунду вскрикнув, вставляет член на всю длину в киску <b>[partner]</b>!"
		user.set_is_fucking(partner, CUM_TARGET_VAGINA, user.getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/champ1.ogg',
						'modular_sand/sound/interactions/champ2.ogg'), 50, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_VAGINA, partner)
	partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_PENIS, user)

/datum/interaction/lewd/fuck/anal
	description = "Трахнуть в задницу."
	require_target_vagina = null
	require_target_anus = REQUIRE_EXPOSED

/datum/interaction/lewd/fuck/anal/display_interaction(mob/living/user, mob/living/partner)
	var/message

	if(user.is_fucking(partner, CUM_TARGET_ANUS))
		message = "[pick(
			"медленно входит в задницу <b>[partner]</b> на пару сантиметров.",
			"целиком засовывает свой член в задницу <b>[partner]</b>.",
			"начинает ускоряться, помогая себе бедрами и входя в задницу <b>[partner]</b> с громкими шлепками.",
			"заходит на всю глубину в задницу <b>[partner]</b> снова и снова!.")]"
	else
		message = "[pick(
			"берется за основание своего подергивающегося члена и медленно утыкается головкой в задницу <b>[partner]</b>.",
			"пустив каплю слюны с языка на головку члена - входит на всю длину в задницу <b>[partner]</b>, заставляя ее содрогнуться всем телом.")]"
		user.set_is_fucking(partner, CUM_TARGET_ANUS, user.getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_ANUS, partner)
	partner.handle_post_sex(NORMAL_LUST, null, user)

/datum/interaction/lewd/breastfuck
	description = "Трахнуть грудь."
	interaction_sound = null
	require_user_penis = REQUIRE_EXPOSED
	require_target_breasts = REQUIRE_EXPOSED
	max_distance = 1

/datum/interaction/lewd/breastfuck/display_interaction(mob/living/user, mob/living/partner)
	var/message

	if(user.is_fucking(partner, CUM_TARGET_BREASTS))
		message = "[pick("Засовывает свой член между грудей <b>[partner]</b>.",
			"сжав грудь <b>[partner]</b> со сторон - начинает водить их по всей длине своего члена",
			"держась за грудь <b>[partner]</b> - водит между ними своим членом вверх и вниз.",
			"хватает грудь <b>[partner]</b> и растирая - сжимает между ними свой член.")]"
	else
		message = "резко сжимает грудь <b>[partner]</b> и подается всем телом вперед, вдавливая головку в рот."
		user.set_is_fucking(partner, CUM_TARGET_BREASTS, user.getorganslot(ORGAN_SLOT_PENIS))


	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_BREASTS, partner)

/datum/interaction/lewd/footfuck
	description = "Потереться членом об ступню."
	interaction_sound = null
	require_target_num_feet = 1
	require_target_feet = REQUIRE_ANY
	require_user_penis = REQUIRE_EXPOSED
	max_distance = 1

/datum/interaction/lewd/footfuck/display_interaction(mob/living/user, mob/living/partner)
	var/message

	var/shoes = partner.get_shoes(TRUE)

	if(user.is_fucking(partner, CUM_TARGET_FEET))
		message = "[pick("кладет ступню на [shoes ? shoes : pick("ступню", "пятку")] <b>[partner]</b>.",
			"проводит своим членом по [shoes ? shoes : pick("ступне", "пятке")] <b>[partner]</b>.",
			"гладит [shoes ? shoes : pick("ступню", "пятку")] <b>[partner]</b> своим членом.")]"
	else
		message = "[pick("резко останавливается, прижав свой член к [shoes ? shoes : pick("пятке", "ступне")] <b>[partner]</b>.",
			"хватает <b>[partner]</b> за ногу и делает резкий выдох.",
			"начинает быстрыми и короткими движениями водить членом  по [shoes ? shoes : pick("ступне", "пятке")] <b>[partner]</b>.")]"
		user.set_is_fucking(partner, CUM_TARGET_FEET, user.getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/foot_dry1.ogg',
						'modular_sand/sound/interactions/foot_dry3.ogg',
						'modular_sand/sound/interactions/foot_wet1.ogg',
						'modular_sand/sound/interactions/foot_wet2.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_FEET, partner)

/datum/interaction/lewd/footfuck/double
	description = "Подрочить себе их ступнями."
	require_target_num_feet = 2

/datum/interaction/lewd/footfuck/double/display_interaction(mob/living/user, mob/living/partner)
	var/message

	var/shoes = partner.get_shoes()

	if(user.is_fucking(partner, CUM_TARGET_FEET))
		message = "[pick("сует свой член между [shoes ? shoes : pick("ступней", "пяток")] <b>[partner]</b>.",
			"проводит членом между [shoes ? shoes : pick("ступней", "пяток")] <b>[partner]</b>.",
			"водит членом вперед назад между [shoes ? shoes : pick("ступней", "пяток")] <b>[partner]</b>.")]"
	else
		message = "[pick("резко останавливается, прижав свой член к [shoes ? shoes : pick("пяткам", "ступням")] <b>[partner]</b>.",
			"хватает <b>[partner]</b> за ноги и делает резкий выдох.",
			"начинает быстрыми и короткими движениями водить членом  по [shoes ? shoes : pick("ступням", "пяткам")] <b>[partner]</b>.")]"
		user.set_is_fucking(partner, CUM_TARGET_FEET, user.getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/foot_dry1.ogg',
						'modular_sand/sound/interactions/foot_dry3.ogg',
						'modular_sand/sound/interactions/foot_wet1.ogg',
						'modular_sand/sound/interactions/foot_wet2.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_FEET, partner)

/datum/interaction/lewd/footfuck/vag
	description = "Потереться киской об ступни."
	interaction_sound = null
	require_target_num_feet = 1
	require_target_feet = REQUIRE_ANY
	require_user_vagina = REQUIRE_EXPOSED
	require_user_penis = REQUIRE_NONE
	max_distance = 1

/datum/interaction/lewd/footfuck/vag/display_interaction(mob/living/user, mob/living/partner)
	var/message

	var/shoes = partner.get_shoes(TRUE)

	if(user.is_fucking(partner, CUM_TARGET_FEET))
		message = "[pick("прижимается киской к [shoes ? shoes : pick("ступне", "пятке")] <b>[partner]</b>'s.",
			"водит клитором вдоль [shoes ? shoes : pick("пальцев", "ступни")] <b>[partner]</b>.",
			"садится на кончик [shoes ? shoes : pick("пальца", "ступни")] <b>[partner]</b>.")]"
	else
		message = "[pick("резко останавливается, прижавшись киской к [shoes ? shoes : pick("пятке", "ступне")] <b>[partner]</b>.",
			"хватает <b>[partner]</b> за ногу и делает резкий выдох.",
			"начинает быстрыми и короткими движениями водить киской  по [shoes ? shoes : pick("ступне", "пятке")] <b>[partner]</b>.")]"
		user.set_is_fucking(partner, CUM_TARGET_FEET, user.getorganslot(ORGAN_SLOT_VAGINA))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/foot_dry1.ogg',
						'modular_sand/sound/interactions/foot_dry3.ogg',
						'modular_sand/sound/interactions/foot_wet1.ogg',
						'modular_sand/sound/interactions/foot_wet2.ogg'), 70, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	user.handle_post_sex(NORMAL_LUST, CUM_TARGET_FEET, partner)
