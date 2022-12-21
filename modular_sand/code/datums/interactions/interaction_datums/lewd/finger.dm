/datum/interaction/lewd/finger
	description = "Поиграть пальцами с киской."
	require_user_hands = TRUE
	require_target_vagina = REQUIRE_EXPOSED
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/finger/display_interaction(mob/living/user, mob/living/partner)
	user.visible_message(message = "<span class='lewd'><b> [user]</b> [pick("медленно засовывает пальчики в киску <b>[partner]</b>.",
		"водит пальцем по клитору <b>[partner]</b>.",
		"одним движением засовывает весь палец в <b>[partner]</b>.",
		"массирует своими пальцами влажные губки <b>[partner]</b>.",
		"засовывает два пальца в узкую киску <b>[partner]</b> и начинает быстро ими двигать внутри")]</span>", ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), 'modular_sand/sound/interactions/champ_fingering.ogg', 50, 1, -1)
	partner.handle_post_sex(NORMAL_LUST, null, user)

/datum/interaction/lewd/fingerass
	description = "Поиграть пальцами с анусом."
	interaction_sound = null
	require_user_hands = TRUE
	require_target_anus = REQUIRE_EXPOSED
	max_distance = 1

/datum/interaction/lewd/fingerass/display_interaction(mob/living/user, mob/living/partner)
	user.visible_message("<span class='lewd'><b> [user]</b> [pick("крайне деликатно засовывает палец в задницу <b>[partner]</b>.",
		"медленно массирует пальцем <b>[partner]</b> изнутри задницы.",
		"ускоряясь, начинает доставать и засовывать палец в задницу <b>[partner]</b>, так, что она начинает трястись.",
		"аккуратно, но не сбавляя ритма засовывает в задницу <b>[partner]</b> второй палец.",
		"медленно разводит два пальца внутри, раздвигая анальное отверстие <b>[partner]</b>.")]</span>", ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), 'modular_sand/sound/interactions/champ_fingering.ogg', 50, 1, -1)
	partner.handle_post_sex(NORMAL_LUST, null, user)
