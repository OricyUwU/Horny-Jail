/datum/interaction/lewd/oral
	description = "Поиграть язычком с киской."
	require_user_mouth = TRUE
	require_target_vagina = REQUIRE_EXPOSED
	write_log_user = "gave head to"
	write_log_target = "was given head by"
	interaction_sound = null
	max_distance = 1
	var/fucktarget = "vagina"

/datum/interaction/lewd/oral/blowjob
	description = "Отсосать."
	require_target_vagina = null
	require_target_penis = REQUIRE_EXPOSED
	fucktarget = "penis"

/datum/interaction/lewd/oral/display_interaction(mob/living/user, mob/living/partner)
	var/message
	var/obj/item/organ/genital/genital = null
	var/lust_increase = NORMAL_LUST
	var/u_He = user.p_they()
	var/u_Were = user.p_theyre()

	if(partner.is_fucking(user, CUM_TARGET_MOUTH))
		if(prob(partner.get_sexual_potency()))
			user.adjustOxyLoss(3)
			message = "вжимается лицом в киску <b>[partner]</b>!"
			lust_increase += 5
		else
			var/improv = FALSE
			switch(fucktarget)
				if("vagina")
					if(partner.has_vagina())
						message = pick(
							"целует киску <b>[partner]</b>, на секунду отрываясь и выдыхая теплый воздух.",
							"хватает губами лепестки киски <b>[partner]</b>, нежно их оттягивая.",
							"проводит языком по киске <b>[partner]</b>, от чего та раскрывается.",
							"обхватывает губами киску <b>[partner]</b> и начинает ласково водить языком вокруг клитора",
							"украдко взглянув, засовывает язычок внутрь киски <b>[partner]</b> и закрывает глаза.",
							"присасывается к клитору <b>[partner]</b>, подталкивая его языком.",
						)
					else
						improv = TRUE
				if("penis")
					if(partner.has_penis() || partner.has_strapon())
						message = pick(
							"ухмыльнувшись, целует головку члена <b>[partner]</b>.",
							"проводит мокрым язычком по всей длине члена <b>[partner]</b> .",
							"обхватывает губами член <b>[partner]</b> у основания и двигается к головке",
							"берет головку члена <b>[partner]</b> в рот и водит по ней языком",
							"медленно начинает водить голову вверх и вниз, держа член <b>[partner]</b> во рту.",
							"делает несколько быстрых движений головой так, что головка члена <b>[partner]</b> начинает биться в горло <b>[user]</b>.",
							"засовывает член <b>[partner]</b> на всю длину и давясь, начинает глотать",
						)
					else
						improv = TRUE
			if(improv)
				// get confused about how to do the sex
				message = pick(
					"облизывает живот <b>[partner]</b>, двигаясь все ниже.",
					"выглядит немного неуверенно, куда лижет <b>[partner]</b>.",
					"проводит языком между ног <b>[partner]</b>.",
					"целует бедро <b>[partner]</b>.",
					"старается лучше всего с <b>[partner]</b>.",
				)
	else
		var/improv = FALSE
		switch(fucktarget)
			if("vagina")
				if(partner.has_vagina())
					message = pick(
						"зарывается лицом в киску <b>[partner]</b>.",
						"тыкается носом в мокрую киску <b>[partner]</b>.",
						"зажимается между ляжками <b>[partner]</b>.",
						"становится на колени между ножек <b>[partner]</b>.",
						"хватается за ножки <b>[partner]</b>, и раздвигает их.",
						"засовывает лицо между ляжками <b>[partner]</b>",
					)
				else
					improv = TRUE
			if("penis")
				if(partner.has_penis() || partner.has_strapon())
					message = pick(
						"берет член <b>[partner]</b> в рот.",
						"обхватывает губами член <b>[partner]</b>",
						"зажимается личиком между ляжками <b>[partner]</b>.",
						"становится на колени между ног <b>[partner]</b>.",
						"сжимает руками ноги <b>[partner]</b>, целуя кончик члена.",
						"налягает на <b>[partner]</b>, прижимаясь всем тельцем.",
					)
				else
					improv = TRUE
		if(improv)
			message = pick(
				"начинает лизать <b>[partner]</b>.",
				"начинает целовать бедро <b>[partner]</b>.",
				"опускается между бёдер <b>[partner]</b>.",
				"ненадолго бросает озадаченный взгляд между ног <b>[partner]</b>.",
				"выглядит неуверенно, как справиться с отсутствием гениталий у <b>[partner]</b>.",
				"похоже, что [u_He] [u_Were] ожидали, что у <b>[partner]</b> будет член, или киска, или... что-то в этом роде.",
			)
			genital = null
		else
			switch(fucktarget)
				if("vagina")
					genital = partner.getorganslot(ORGAN_SLOT_VAGINA)
				if("penis")
					genital = partner.getorganslot(ORGAN_SLOT_PENIS)
		partner.set_is_fucking(user, CUM_TARGET_MOUTH, genital)

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/bj1.ogg',
									'modular_sand/sound/interactions/bj2.ogg',
									'modular_sand/sound/interactions/bj3.ogg',
									'modular_sand/sound/interactions/bj4.ogg',
									'modular_sand/sound/interactions/bj5.ogg',
									'modular_sand/sound/interactions/bj6.ogg',
									'modular_sand/sound/interactions/bj7.ogg',
									'modular_sand/sound/interactions/bj8.ogg',
									'modular_sand/sound/interactions/bj9.ogg',
									'modular_sand/sound/interactions/bj10.ogg',
									'modular_sand/sound/interactions/bj11.ogg'), 50, 1, -1)
	user.visible_message("<span class='lewd'><b>[user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(fucktarget != "penis" || partner.can_penetrating_genital_cum())
		partner.handle_post_sex(lust_increase, CUM_TARGET_MOUTH, user)
