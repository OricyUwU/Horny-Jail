/datum/interaction/lewd/nipsuck
	description = "Поиграть языком с сосками"
	require_target_breasts = REQUIRE_EXPOSED
	require_user_mouth = TRUE
	write_log_user = "sucked соски"
	write_log_target = "had their соски sucked by"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/nipsuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if((user.a_intent == INTENT_HELP) || (user.a_intent == INTENT_DISARM))
		user.visible_message(
				pick("<span class='lewd'><b>[user]</b> нежно касается губами [pick("соска <b>[target]</b>.", "одного соска <b>[target]</b>, переключаясь затем на второй.")]</span>",
					"<span class='lewd'><b>[user]</b> аккуратно прикусывает [pick("сосок <b>[target]</b>.", "один сосок <b>[target]</b>, а затем второй.")]</span>",
					"<span class='lewd'><b>[user]</b> водит язычком по [pick("соску <b>[target]</b>.", "соскам <b>[target]</b> по очереди.")]</span>"))
		if(target.has_breasts(REQUIRE_EXPOSED))
			var/modifier = 1
			var/obj/item/organ/genital/breasts/B = target.getorganslot(ORGAN_SLOT_BREASTS)
			switch(B.size)
				if("c", "d", "e")
					modifier = 2
				if("f", "g", "h")
					modifier = 3
				else
					if(B.size in B.breast_values)
						modifier = clamp(B.breast_values[B.size] - 5, 0, INFINITY)
					else
						modifier = 1
			if(B.fluid_id)
				user.reagents.add_reagent(B.fluid_id, rand(1,2 * modifier))

	if(user.a_intent == INTENT_HARM)
		user.visible_message(
				pick("<span class='lewd'> <b>[user]</b> кусает <b>[target]</b> [pick("сосок", "соски")].</span>",
					"<span class='lewd'> <b>[user]</b> грубо присасывается к [pick("соску <b>[target]</b>, оставляя на груди красный след.", "соскам <b>[target]</b>, оставляя засосы.")]</span>"))
		if(target.has_breasts(REQUIRE_EXPOSED))
			var/modifier = 1
			var/obj/item/organ/genital/breasts/B = target.getorganslot(ORGAN_SLOT_BREASTS)
			switch(B.size)
				if("c", "d", "e")
					modifier = 2
				if("f", "g", "h")
					modifier = 3
				else
					if(B.size in B.breast_values)
						modifier = clamp(B.breast_values[B.size] - 5, 0, INFINITY)
					else
						modifier = 1
			if(B.fluid_id)
				user.reagents.add_reagent(B.fluid_id, rand(1,3 * modifier)) //aggressive sucking leads to high rewards

	if(user.a_intent == INTENT_GRAB)
		user.visible_message(
				pick("<span class='lewd'> <b>[user]</b> сжимает грудь и облизывает [pick("сосок <b>[target]</b>, от чего на нем начинают выступать капельки", "соски <b>[target]</b>, выдавливая из них сладкие капли")].</span>",
					"<span class='lewd'> <b>[user]</b> довольно упивается высасывая [pick("нектар из соска <b>[target]</b>", "нектар из сосков <b>[target]</b>")].</span>",
					"<span class='lewd'> <b>[user]</b> как ребенок прижался к груди и кормится грудью <b>[target]</b>, периодически сжимая ее.</span>"))
		if(target.has_breasts(REQUIRE_EXPOSED))
			var/modifier = 1
			var/obj/item/organ/genital/breasts/B = target.getorganslot(ORGAN_SLOT_BREASTS)
			switch(B.size)
				if("c", "d", "e")
					modifier = 2
				if("f", "g", "h")
					modifier = 3
				else
					if(B.size in B.breast_values)
						modifier = clamp(B.breast_values[B.size] - 5, 0, INFINITY)
					else
						modifier = 1
			if(B.fluid_id)
				user.reagents.add_reagent(B.fluid_id, rand(1,3 * modifier)) //aggressive sucking leads to high rewards

	if(prob(5 + target.get_lust()))
		if(target.a_intent == INTENT_HELP)
			if(!target.has_breasts())
				user.visible_message(
					pick("<span class='lewd'> <b>[target]</b> дрожит от возбуждения.</span>",
						"<span class='lewd'> <b>[target]</b> тихонько постанывает.</span>",
						"<span class='lewd'> <b>[target]</b> выдыхает с тихим вздохом.</span>",
						"<span class='lewd'> <b>[target]</b> вздыхает!</span>",
						"<span class='lewd'> <b>[target]</b> слегка подрагивает.</span>",
						"<span class='lewd'> <b>[target]</b> дрожит от наслаждения, пока кормит грудью.</span>"))
			else
				user.visible_message(
					pick("<span class='lewd'><b>[target]</b> дрожит от возбуждения.</span>",
						"<span class='lewd'><b>[target]</b> тихонько постанывает.</span>",
						"<span class='lewd'><b>[target]</b> выдыхает с тихим вздохом.</span>",
						"<span class='lewd'><b>[target]</b> вздыхает!</span>",
						"<span class='lewd'><b>[target]</b> слегка подрагивает.</span>",
						"<span class='lewd'><b>[target]</b> дрожит от наслаждения, пока кормит грудью.</span>",
						"<span class='lewd'><b>[target]</b> вытягивается от ощущения, как <b>[user]</b> наслаждается ее молоком.</span>"))
			if(target.get_lust() < 5)
				target.set_lust(5)
		if(target.a_intent == INTENT_DISARM)
			if (target.restrained())
				if(!target.has_breasts())
					user.visible_message(
						pick("<span class='lewd'><b>[target]</b> игриво выкручивается из наручников.</span>",
						 	"<span class='lewd'><b>[target]</b> выскальзывает из губ <b>[user]</b>.</span>",
						 	"<span class='lewd'><b>[target]</b> украдко смотрит, слегка отталкиваясь от губ <b>[user]</b>.</span>",
						 	"<span class='lewd'><b>[target]</b> кидается вперед, прижимаясь грудью ко рту <b>[user]</b>.</span>"))
			if(target.get_lust() < 10)
				target.add_lust(1)
	if(target.a_intent == INTENT_GRAB)
		user.visible_message(
				pick("<span class='lewd'><b>[target]</b> хватается за голову <b>[user]</b>.</span>",
				 "<span class='lewd'><b>[target]</b> впивается ногтями в голову <b>[user]</b>.</span>",
				 "<span class='lewd'><b>[target]</b> легонько отталкивает от себя голову <b>[user]</b>.</span>"))
	if(target.a_intent == INTENT_HARM)
		user.adjustBruteLoss(1)
		user.visible_message(
				pick("<span class='lewd'><b>[target]</b> дает пощечину <b>[user]</b>!</span>",
				 "<span class='lewd'><b>[target]</b> царапает лицо <b>[user]</b>!</span>",
				 "<span class='lewd'><b>[target]</b> яростно сопротивляется действиям <b>[user]</b>!</span>",
				 "<span class='lewd'><b>[target]</b> раздирает до крови лицо <b>[user]</b>!</span>",
				 "<span class='lewd'><b>[target]</b> бьет локтем по челюсти <b>[user]</b>!</span>"))
	target.dir = get_dir(target, user)
	user.dir = get_dir(user, target)
	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/oral1.ogg',
						'modular_sand/sound/interactions/oral2.ogg'), 70, 1, -1)
	return
