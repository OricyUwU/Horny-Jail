/datum/interaction/lewd/do_breastfeed
	description = "Покормить грудью"
	require_user_breasts = REQUIRE_EXPOSED
	require_target_mouth = TRUE
	max_distance = 1
	write_log_user = "breastfed"
	write_log_target = "was breastfed by"
	interaction_sound = null

/datum/interaction/lewd/do_breastfeed/display_interaction(mob/living/user, mob/living/target)
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
		"прижимается грудью ко рту <b>[target]</b>, выдавливая струи теплого [lowertext(milktext)] в рот <b>[target]</b>",
		"наполняет рот <b>[target]</b> теплым и сладким [lowertext(milktext)], сжимая свою грудь и тяжело дыша",
		"Выпускает сильную струю своего [lowertext(milktext)] прямо в горло <b>[target]</b>"
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
	target.reagents.add_reagent(milktype, rand(1,3 * modifier))

/datum/interaction/lewd/titgrope
	description = "Схватить грудь "
	require_user_hands = TRUE
	require_target_breasts = REQUIRE_ANY
	write_log_user = "groped"
	write_log_target = "was groped by"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/titgrope/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.a_intent == INTENT_HELP)
		user.visible_message(
				pick("<span class='lewd'><b>[user]</b> нежно обхватывает грудь <b>[target]</b>.</span>",
					 "<span class='lewd'><b>[user]</b> мягко сжимает грудь <b>[target]</b>.</span>",
					 "<span class='lewd'><b>[user]</b> поддерживает грудь <b>[target]</b> своими руками.</span>",
					 "<span class='lewd'><b>[user]</b> медленно проводит пальцами по груди <b>[target]</b>.</span>",
					 "<span class='lewd'><b>[user]</b> деликатно играет с соском <b>[target]</b> своим язычком.</span>",
					 "<span class='lewd'><b>[user]</b> легонько касается груди <b>[target]</b>.</span>"))
	if(user.a_intent == INTENT_HARM)
		user.visible_message(
				pick("<span class='lewd'><b>[user]</b> агрессивно хватает грудь <b>[target]</b>!</span>",
					 "<span class='lewd'><b>[user]</b> прикусывает сосок <b>[target]</b>!</span>",
					 "<span class='lewd'><b>[user]</b> сильно сжимает грудь <b>[target]</b>!</span>",
					 "<span class='lewd'><b>[user]</b> шлепает <b>[target]</b> по груди!</span>",
					 "<span class='lewd'><b>[user]</b> грубо играет с грудью <b>[target]</b>!</span>"))
	if(prob(5 + target.get_lust()))
		if(target.a_intent == INTENT_HELP)
			user.visible_message(
				pick("<span class='lewd'><b>[target]</b> подрагивает от возбуждения.</span>",
					 "<span class='lewd'><b>[target]</b> тихонько постанывает.</span>",
					 "<span class='lewd'><b>[target]</b> выдыхает с нежным стоном.</span>",
					 "<span class='lewd'><b>[target]</b> томно вздыхает.</span>",
					 "<span class='lewd'><b>[target]</b> слегка трясется.</span>",
					 "<span class='lewd'><b>[target]</b> мягко дышит, ощущая нежное прикосновение к голой коже.</span>"))
			if(target.get_lust() < 5)
				target.set_lust(5)
		if(target.a_intent == INTENT_DISARM)
			if (target.restrained())
				user.visible_message(
					pick("<span class='lewd'><b>[target]</b> игриво выкручивается из наручников.</span>",
						 "<span class='lewd'><b>[target]</b> выскальзывает из рук <b>[user]</b>.</span>",
						 "<span class='lewd'><b>[target]</b> украдко смотрит, слегка отталкиваясь от рук <b>[user]</b>.</span>",
						 "<span class='lewd'><b>[target]</b> кидается вперед, прижимаясь грудью к рукам <b>[user]</b>.</span>"))
			else
				user.visible_message(
					pick("<span class='lewd'><b>[target]</b> легонько шлепает <b>[user]</b> по рукам.</span>",
						 "<span class='lewd'><b>[target]</b> выскальзывает из рук <b>[user]</b>.</span>",
						 "<span class='lewd'><b>[target]</b> проводит рукой <b>[user]</b> по своей груди.</span>",
						 "<span class='lewd'><b>[target]</b> украдко проводит пальцами по костяшкам <b>[user]</b>.</span>"))
			if(target.get_lust() < 10)
				target.add_lust(1)
	if(target.a_intent == INTENT_GRAB)
		user.visible_message(
				pick("<span class='lewd'><b>[target]</b> хватает <b>[user]</b> за локоть.</span>",
				 "<span class='lewd'><b>[target]</b> впивается ногтями в руку <b>[user]</b>.</span>",
				 "<span class='lewd'><b>[target]</b> на секунду хватает <b>[user]</b> за запястье.</span>"))
	if(target.a_intent == INTENT_HARM)
		user.adjustBruteLoss(1)
		user.visible_message(
				pick("<span class='lewd'><b>[target]</b> грубо отталкивает <b>[user]</b> от себя!</span>",
				 "<span class='lewd'><b>[target]</b> со злостью вонзается ногтями в руку <b>[user]</b>!</span>",
				 "<span class='lewd'><b>[target]</b> яросно сопротивляется <b>[user]</b>!</span>",
				 "<span class='lewd'><b>[target]</b> царапает спину <b>[user]</b> до крови!</span>",
				 "<span class='lewd'><b>[target]</b> отбрасывает руку <b>[user]</b> от себя!</span>"))
	return
