//Sandstorm edits

/datum/interaction/lewd/display_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(!(isclownjob(target) && type == /datum/interaction/lewd))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>Задница <b>[target]</b> хонкает!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/titgrope/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	var/list/honks = list(
		"Клоунские ботинки <b>[target]</b> издают громкий скрип!",
		"Грудь <b>[target]</b> издает пронзительный хонк, когда <b>[user]</b>'хватает и сжимает ее!"
	)
	if(prob(50))
		target.visible_message("<span class='lewd'>[pick(honks)]</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/oral/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>Киска <b>[target]</b> издает хонк![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/oral/blowjob/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		var/genital_name = target.get_penetrating_genital_name(TRUE)
		target.visible_message("<span class='lewd'>[genital_name] <b>[target]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message("<span class='lewd'>Киска <b>[target]</b> издает хонк![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fuck/anal/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message("<span class='lewd'>Дырочка для веселья <b>[target]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/finger/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>Киска <b>[target]</b> издает хонк![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fingerass/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>Дырочка для веселья <b>[target]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/facefuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = target.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>[genital_name] <b>[target]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/throatfuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(istype(target, /mob/living) && user.is_fucking(target, CUM_TARGET_THROAT))
		var/stat_before = target.stat
		target.adjustOxyLoss(3)
		if(target.stat == UNCONSCIOUS && stat_before != UNCONSCIOUS)
			target.visible_message(message = "<font color=red><b> [target]</b> теряет сознание прямо на члене <b>\The [src]</b></span>", ignored_mobs = user.get_unconsenting())
	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>[genital_name] <b>[target]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/handjob/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>[genital_name] <b>[user]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/breastfuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(target))
		target.visible_message("<span class='lewd'>[pick(GLOB.breast_nouns)] <b>[target]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/mount/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(user))
		user.visible_message("<span class='lewd'>Киска <b>[user]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/mountass/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	if(prob(50) && isclownjob(user))
		target.visible_message("<span class='lewd'>Дырочка для веселья <b>[user]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/mountface/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>Дырочка для веселья <b>[user]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/footfuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>[genital_name] <b>[user]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/footfuck/double/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>[genital_name] <b>[user]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/footjob/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		var/genital_name = target.get_penetrating_genital_name(TRUE)
		target.visible_message("<span class='lewd'>[genital_name] <b>[target]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/footjob/double/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(target))
		return

	if(prob(50))
		var/genital_name = target.get_penetrating_genital_name(TRUE)
		target.visible_message("<span class='lewd'>[genital_name] <b>[target]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/nuts/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>Шары <b>[user]</b> хонкают![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/nut_smack/display_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(!(isclownjob(target) && type == /datum/interaction/lewd/nut_smack))
		return

	if(prob(50))
		target.visible_message("<span class='lewd'>Шары <b>[target]</b> хонкают![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/earfuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>[genital_name] <b>[user]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/eyefuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>[genital_name] <b>[user]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/frotting/display_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(!(isclownjob(target) || isclownjob(user)))
		return

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/do_breastfeed/display_interaction(mob/living/user, mob/living/target)
	var/obj/item/organ/genital/breasts/milkers = user.getorganslot(ORGAN_SLOT_BREASTS)
	var/blacklist = target.client?.prefs.gfluid_blacklist
	var/cached_fluid
	if((milkers?.get_fluid_id() in blacklist) || ((/datum/reagent/blood in blacklist) && ispath(milkers?.get_fluid_id(), /datum/reagent/blood)))
		cached_fluid = milkers?.get_fluid_id()
		milkers?.set_fluid_id(milkers?.default_fluid_id)

	. = ..()

	if(cached_fluid)
		milkers.set_fluid_id(cached_fluid)

	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>[pick(GLOB.breast_nouns)] <b>[user]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/jack/display_interaction(mob/living/carbon/human/user)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>[genital_name] <b>[user]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fingerass_self/display_interaction(mob/living/carbon/human/user)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>Дырочка для веселья <b>[user]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/finger_self/display_interaction(mob/living/carbon/human/user)
	. = ..()
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>Киска <b>[user]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/titgrope_self/display_interaction(mob/living/carbon/human/user)
	. = ..()
	if(!isclownjob(user))
		return

	var/list/honks = list(
		"Клоунские ботинки <b>[user]</b> издают громкий скрип!",
		"<b>[user]</b> хватает и сжамает свою грудь, отчего та - издает пронзительный хонк!"
	)
	if(prob(50))
		user.visible_message("<span class='lewd'>[pick(honks)]</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/self_nipsuck/display_interaction(mob/living/user, mob/living/target)
	var/obj/item/organ/genital/breasts/milkers = user.getorganslot(ORGAN_SLOT_BREASTS)
	var/blacklist = target.client?.prefs.gfluid_blacklist
	var/cached_fluid
	if((milkers?.get_fluid_id() in blacklist) || ((/datum/reagent/blood in blacklist) && ispath(milkers?.get_fluid_id(), /datum/reagent/blood)))
		cached_fluid = milkers?.get_fluid_id()
		milkers?.set_fluid_id(milkers?.default_fluid_id)

	. = ..()

	if(cached_fluid)
		milkers.set_fluid_id(cached_fluid)

	if(!isclownjob(user))
		return

	var/list/honks = list(
		"Клоунские ботинки <b>[user]</b> издают громкий скрип!",
		"<b>[user]</b> хватает и сжамает свою грудь, отчего та - издает пронзительный хонк!"
	)
	if(prob(50))
		user.visible_message("<span class='lewd'>[pick(honks)]</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/nipsuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	var/obj/item/organ/genital/breasts/milkers = target.getorganslot(ORGAN_SLOT_BREASTS)
	var/blacklist = user.client?.prefs.gfluid_blacklist
	var/cached_fluid
	if((milkers?.get_fluid_id() in blacklist) || ((/datum/reagent/blood in blacklist) && ispath(milkers?.get_fluid_id(), /datum/reagent/blood)))
		cached_fluid = milkers?.get_fluid_id()
		milkers?.set_fluid_id(milkers?.default_fluid_id)

	. = ..()

	if(cached_fluid)
		milkers.set_fluid_id(cached_fluid)

	if(!isclownjob(target) || !milkers)
		return

	var/list/honks = list(
		"Клоунские ботинки <b>[user]</b> издают громкий скрип!",
		"<b>[user]</b> высасывает грудь <b>[target]</b> до хонка!"
	)
	if(prob(50))
		user.visible_message("<span class='lewd'>[pick(honks)]</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/kiss/display_interaction(mob/living/user, mob/living/partner)
	. = ..()
	playlewdinteractionsound(partner, pick(
		'modular_splurt/sound/interactions/kiss/kiss1.ogg',
		'modular_splurt/sound/interactions/kiss/kiss2.ogg',
		'modular_splurt/sound/interactions/kiss/kiss3.ogg',
		'modular_splurt/sound/interactions/kiss/kiss4.ogg',
		'modular_splurt/sound/interactions/kiss/kiss5.ogg'), 50, 1, -1, ignored_mobs = user.get_unconsenting())

//Own stuff
/datum/interaction/lewd/oral/selfsuck
	description = "Отсосать себе"
	interaction_sound = null
	require_target_vagina = REQUIRE_NONE
	require_user_penis = REQUIRE_EXPOSED
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "сосет"
	write_log_target = null

/datum/interaction/lewd/oral/selfsuck/display_interaction(mob/living/carbon/human/user)
	user.do_oral_self(user, "пенис")
	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>[genital_name] <b>[user]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/oral/suckvagself
	description = "Отлизать себе"
	interaction_sound = null
	require_user_penis = REQUIRE_NONE
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "отлизывает"
	write_log_target = null

/datum/interaction/lewd/oral/suckvagself/display_interaction(mob/living/carbon/human/user)
	user.do_oral_self(user, "vagina")

/datum/interaction/lewd/breastfuckself
	description = "Помастурбировать себе своей грудью"
	interaction_sound = null
	require_user_penis = REQUIRE_EXPOSED
	require_user_breasts = REQUIRE_EXPOSED
	user_is_target = TRUE
	max_distance = 0
	write_log_user = "Мастурбирует грудью"
	write_log_target = null

/datum/interaction/lewd/breastfuckself/display_interaction(mob/living/carbon/human/user)
	user.do_breastfuck_self(user)
	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>Грудь <b>[user]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/deflate_belly
	description = "Сдуть живот"
	require_user_belly = REQUIRE_EXPOSED
	interaction_sound = null
	max_distance = 0
	user_is_target = TRUE
	write_log_user = "сдувает свой живот"
	write_log_target = null

/datum/interaction/lewd/deflate_belly/display_interaction(mob/living/carbon/user)
	var/obj/item/organ/genital/belly/gut = user.getorganslot(ORGAN_SLOT_BELLY)
	if(gut)
		gut.modify_size(-1)

/datum/interaction/lewd/do_breastsmother
	description = "Придушить своей грудью"
	require_user_breasts = REQUIRE_EXPOSED
	max_distance = 1
	interaction_sound = null
	write_log_target = "прижимает к груди лицо"
	write_log_user = "прижат лицом к груди"

/datum/interaction/lewd/do_breastsmother/display_interaction(mob/living/user, mob/living/target)
	user.do_breastsmother(target)

	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>Грудь <b>[user]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/do_boobjob
	description = "Подрочить грудью"
	require_user_breasts = REQUIRE_EXPOSED
	require_target_penis = REQUIRE_EXPOSED
	interaction_sound = null
	max_distance = 1
	write_log_target = "подрочили грудью"
	write_log_user = "дрочит грудью"

/datum/interaction/lewd/do_boobjob/display_interaction(mob/living/user, mob/living/target)
	user.do_boobjob(target)

	if(!isclownjob(user))
		return

	if(prob(50))
		user.visible_message("<span class='lewd'>Грудь <b>[user]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/lick_nuts
	description = "Облизать шары"
	require_user_mouth = TRUE
	require_target_balls = REQUIRE_EXPOSED
	interaction_sound = null
	max_distance = 1
	write_log_target = "яйца облизаны"
	write_log_user = "облизывает яйца"

/datum/interaction/lewd/lick_nuts/display_interaction(mob/living/user, mob/living/target)
	user.lick_nuts(target)

/datum/interaction/lewd/grope_ass
	description = "Схватить за задницу"
	simple_message = "USER хватает TARGET за задницу!"
	require_user_hands = TRUE
	max_distance = 1
	interaction_sound = null
	write_log_target = "схвачен за задницу"
	write_log_target = "обхватывает задницу"

/datum/interaction/lewd/fuck_cock
	description = "Трахнуть в член."
	require_user_penis = REQUIRE_EXPOSED
	require_target_penis = REQUIRE_EXPOSED
	interaction_sound = null
	max_distance = 1
	write_log_target = "трахнут в член"
	write_log_user = "трахает член"

/datum/interaction/lewd/fuck_cock/display_interaction(mob/living/user, mob/living/target)
	user.do_cockfuck(target)

	if(!(isclownjob(target) || isclownjob(user)))
		return

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/fuck_thighs
	description = "Трахнуть между ляшек"
	require_user_penis = REQUIRE_EXPOSED
	require_target_legs = REQUIRE_ANY
	require_target_num_legs = 2
	write_log_user = "присовывает между ляшек"
	write_log_target = "ляшки трахаются"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/fuck_thighs/display_interaction(mob/living/user, mob/living/target)
	user.do_thighfuck(target)

	if(!isclownjob(user))
		return

	if(prob(50))
		var/genital_name = user.get_penetrating_genital_name(TRUE)
		user.visible_message("<span class='lewd'>[genital_name] <b>[user]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(user, 'sound/items/bikehorn.ogg', 40, 1, -1)

/datum/interaction/lewd/do_thighjob
	description = "Подрочить ляшками"
	require_target_penis = REQUIRE_EXPOSED
	require_user_legs = REQUIRE_ANY
	require_user_num_legs = 2
	write_log_user = "дрочит ляшками"
	write_log_target = "смотрит как их член дрочит ляшками"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/do_thighjob/display_interaction(mob/living/user, mob/living/target)
	user.do_thighjob(target)

	if(!isclownjob(target))
		return

	if(prob(50))
		var/genital_name = target.get_penetrating_genital_name(TRUE)
		target.visible_message("<span class='lewd'>[genital_name] <b>[target]</b> хонкает![pick(" loudly", "")]!</span>")

	playlewdinteractionsound(target, 'sound/items/bikehorn.ogg', 40, 1, -1)

////////////////////////////////////////////////////////////////////////////////////////////////////////
///////// 									U N H O L Y										   /////////
////////////////////////////////////////////////////////////////////////////////////////////////////////

//не будет анхоли, пиздуй отсюда)))) xoxo КИТ
//борк, у тебя вместо 2 узлов будет 4, если вернешь сюда анхоли. Я БЛЯТЬ НЕ ШУЧУ!
