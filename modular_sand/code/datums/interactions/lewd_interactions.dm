// If I could have gotten away with using a tilde in the type path, I would have.
/datum/interaction/lewd
	// Description can take in %COCK% as a wildcard to get replaced with a cock/strapon accordingly.
	description = "Шлепнуть по заднице."
	simple_message = "USER шлепает TARGET по заднице!"
	simple_style = "danger"
	interaction_sound = 'sound/weapons/slap.ogg'
	needs_physical_contact = TRUE
	require_ooc_consent = TRUE
	max_distance = 1

	write_log_user = "ass-slapped"
	write_log_target = "was ass-slapped by"

	var/user_not_tired = FALSE
	var/target_not_tired = FALSE
	//Avoid using these!
	//Should only really use in case there are no related organs
	//but you want the target or user to be topless/bottomless.
	//Example: Nipple licking/sucking.
	//Otherwise, simply use the "require" vars, which
	//i have changed to actually check for the appropriate organs.
	//This is better because it means that exposing a genital while still
	//wearing something actually means you can do the s*x.
	var/require_user_topless
	var/require_target_topless
	var/require_user_bottomless
	var/require_target_bottomless
	//

	//REQUIRE_NONE for doesn't require.
	//REQUIRE_EXPOSED for requires exposed.
	//REQUIRE_ANY for both exposed and unexposed.
	//REQUIRE_UNEXPOSED for requires unexposed.
	var/require_user_penis
	var/require_user_anus
	var/require_user_vagina
	var/require_user_breasts
	var/require_user_feet
	var/require_user_balls

	//Different from the others above. Use the number of required feet.
	var/require_user_num_feet

	//Same logic presented before
	var/require_target_penis
	var/require_target_anus
	var/require_target_vagina
	var/require_target_breasts
	var/require_target_feet
	var/require_target_balls

	var/require_target_num_feet

	//"just fucking kill me" variables
	//also the same logic as before
	var/extreme = FALSE //Boolean. Used to hide extreme shit from those who do not want it.
	var/require_target_ears
	var/require_target_earsockets
	var/require_target_eyes
	var/require_target_eyesockets
	var/require_user_ears
	var/require_user_earsockets
	var/require_user_eyes
	var/require_user_eyesockets
	//

	var/user_refractory_cost
	var/target_refractory_cost

/datum/interaction/lewd/evaluate_user(mob/living/user, silent = TRUE, action_check = TRUE)
	. = ..()
	if(!.)
		return FALSE
	if(user_not_tired && !COOLDOWN_FINISHED(user, refractory_period))
		if(!silent) //bye spam
			to_chat(user, "<span class='warning'>You're still exhausted from the last time. You need to wait [DisplayTimeText(COOLDOWN_TIMELEFT(user, refractory_period), 1)] until you can do that!</span>")
		return FALSE

	if(require_user_bottomless && !user.is_bottomless())
		if(!silent)
			to_chat(user, "<span class='warning'>Your pants are in the way.</span>")
		return FALSE

	if(require_user_topless && !user.is_topless())
		if(!silent)
			to_chat(user, "<span class='warning'>Your top is in the way.</span>")
		return FALSE

	if(require_user_penis)
		switch(require_user_penis)
			if(REQUIRE_EXPOSED)
				if(!user.has_penis(REQUIRE_EXPOSED) && !user.has_strapon(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your penis need to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!user.has_penis(REQUIRE_ANY) && !user.has_strapon(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>You don't have a penis.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!user.has_penis(REQUIRE_UNEXPOSED) && !user.has_strapon(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your penis need to be unexposed.</span>")
					return FALSE

	if(require_user_balls)
		switch(require_user_balls)
			if(REQUIRE_EXPOSED)
				if(!user.has_balls(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your balls need to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!user.has_balls(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>You don't have balls.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!user.has_balls(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your balls need to be unexposed.</span>")
					return FALSE

	if(require_user_anus)
		switch(require_user_anus)
			if(REQUIRE_EXPOSED)
				if(!user.has_anus(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your anus need to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!user.has_anus(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>You don't have an anus.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!user.has_anus(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your anus need to be unexposed.</span>")
					return FALSE

	if(require_user_vagina)
		switch(require_user_vagina)
			if(REQUIRE_EXPOSED)
				if(!user.has_vagina(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your vagina need to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!user.has_vagina(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>You don't have a vagina.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!user.has_vagina(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your vagina need to be unexposed.</span>")
					return FALSE

	if(require_user_breasts)
		switch(require_user_breasts)
			if(REQUIRE_EXPOSED)
				if(!user.has_breasts(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your breasts need to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!user.has_breasts(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>You don't have breasts.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!user.has_breasts(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your breasts need to be unexposed.</span>")
					return FALSE

	if(require_user_feet)
		switch(require_user_feet)
			if(REQUIRE_EXPOSED)
				if(!user.has_feet(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your feet need to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!user.has_feet(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>You don't have enough feet.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!user.has_feet(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your feet need to be unexposed.</span>")
					return FALSE

	if(require_user_num_feet && (user.get_num_feet() < require_user_num_feet))
		if(!silent)
			to_chat(user, "<span class='warning'>You don't have enough feet.</span>")
		return FALSE

	if(require_user_eyes)
		switch(require_user_eyes)
			if(REQUIRE_EXPOSED)
				if(!user.has_eyes(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your eyes need to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!user.has_eyes(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>You don't have eyes.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!user.has_eyes(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your eyes need to be unexposed.</span>")
					return FALSE

	if(require_user_eyesockets)
		switch(require_user_eyesockets)
			if(REQUIRE_EXPOSED)
				if(!user.has_eyesockets(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your eyesockets need to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!user.has_eyesockets(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>You still have eyes.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!user.has_eyesockets(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your eyesockets need to be unexposed.</span>")
					return FALSE

	if(require_user_ears)
		switch(require_user_ears)
			if(REQUIRE_EXPOSED)
				if(!user.has_ears(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your ears need to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!user.has_ears(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>You don't have ears.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!user.has_ears(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your ears need to be unexposed.</span>")
					return FALSE

	if(require_user_earsockets)
		switch(require_user_earsockets)
			if(REQUIRE_EXPOSED)
				if(!user.has_earsockets(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your earsockets need to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!user.has_earsockets(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>You still have eyes.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!user.has_earsockets(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Your earsockets need to be unexposed.</span>")
					return FALSE

	if(extreme)
		var/client/cli = user.client
		if(cli)
			if(cli.prefs.extremepref == "No")
				if(!silent)
					to_chat(user, "<span class='warning'>That's way too much for you.</span>")
				return FALSE

	if(require_ooc_consent)
		if((!user.ckey) || (user.client && user.client.prefs.toggles & VERB_CONSENT))
			return TRUE
		if(action_check)
			return FALSE
	return FALSE

/datum/interaction/lewd/evaluate_target(mob/living/user, mob/living/target, silent = TRUE)
	. = ..()
	if(!.)
		return FALSE
	if(target_not_tired && !COOLDOWN_FINISHED(target, refractory_period))
		if(!silent) //same with this
			to_chat(user, "<span class='warning'>They're still exhausted from the last time. They need to wait [DisplayTimeText(COOLDOWN_TIMELEFT(target, refractory_period), 1)] until you can do that!</span>")
		return FALSE

	if(require_target_bottomless && !target.is_bottomless())
		if(!silent)
			to_chat(user, "<span class='warning'>Their pants are in the way.</span>")
		return FALSE

	if(require_target_topless && !target.is_topless())
		if(!silent)
			to_chat(user, "<span class='warning'>Their clothes are in the way.</span>")
		return FALSE

	if(require_target_penis)
		switch(require_target_penis)
			if(REQUIRE_EXPOSED)
				if(!target.has_penis(REQUIRE_EXPOSED) && !target.has_strapon(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their penis needs to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!target.has_penis(REQUIRE_ANY) && !target.has_strapon(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>They don't have a penis.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!target.has_penis(REQUIRE_UNEXPOSED) && !target.has_strapon(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their penis needs to be unexposed.</span>")
					return FALSE

	if(require_target_balls)
		switch(require_target_balls)
			if(REQUIRE_EXPOSED)
				if(!target.has_balls(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their balls need to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!target.has_balls(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>They don't have balls.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!target.has_balls(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their balls need to be unexposed.</span>")
					return FALSE

	if(require_target_anus)
		switch(require_target_anus)
			if(REQUIRE_EXPOSED)
				if(!target.has_anus(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their anus needs to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!target.has_anus(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>They don't have an anus.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!target.has_anus(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their anus needs to be unexposed.</span>")
					return FALSE

	if(require_target_vagina)
		switch(require_target_vagina)
			if(REQUIRE_EXPOSED)
				if(!target.has_vagina(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their vagina needs to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!target.has_vagina(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>They don't have a vagina.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!target.has_vagina(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their vagina needs to be unexposed.</span>")
					return FALSE

	if(require_target_breasts)
		switch(require_target_breasts)
			if(REQUIRE_EXPOSED)
				if(!target.has_breasts(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their breasts need to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!target.has_breasts(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>They don't have breasts.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!target.has_breasts(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their breasts need to be unexposed.</span>")
					return FALSE

	if(require_target_feet)
		switch(require_target_feet)
			if(REQUIRE_EXPOSED)
				if(!target.has_feet(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their feet need to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!target.has_feet(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>They don't have enough feet.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!target.has_feet(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their feet need to be unexposed.</span>")
					return FALSE

	if(require_target_num_feet && (target.get_num_feet() < require_target_num_feet))
		if(!silent)
			to_chat(user, "<span class='warning'>They don't have enough feet.</span>")
		return FALSE

	if(require_target_eyes)
		switch(require_target_eyes)
			if(REQUIRE_EXPOSED)
				if(!target.has_eyes(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their eyes need to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!target.has_eyes(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>They don't have eyes.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!target.has_eyes(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their eyes need to be unexposed.</span>")
					return FALSE

	if(require_target_eyesockets)
		switch(require_target_eyesockets)
			if(REQUIRE_EXPOSED)
				if(!target.has_eyesockets(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their eyesockets need to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!target.has_eyesockets(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>They still have eyes.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!target.has_eyesockets(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their eyesockets need to be unexposed.</span>")
					return FALSE

	if(require_target_ears)
		switch(require_target_ears)
			if(REQUIRE_EXPOSED)
				if(!target.has_ears(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their ears need to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!target.has_ears(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>They don't have ears.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!target.has_ears(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their ears need to be unexposed.</span>")
					return FALSE

	if(require_target_earsockets)
		switch(require_target_earsockets)
			if(REQUIRE_EXPOSED)
				if(!target.has_earsockets(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their earsockets need to be exposed.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!target.has_earsockets(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>They still have eyes.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!target.has_earsockets(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Their earsockets need to be unexposed.</span>")
					return FALSE

	if(extreme)
		var/client/cli = target.client
		if(cli)
			if(target.client.prefs.extremepref == "No")
				if(!silent)
					to_chat(user, "<span class='warning'>For some reason, you don't want to do this to [target].</span>")
				return FALSE

	if(require_ooc_consent)
		if((!target.ckey) || (target.client && target.client.prefs.toggles & VERB_CONSENT))
			return TRUE
	return FALSE

/datum/interaction/lewd/post_interaction(mob/living/user, mob/living/target)
	if(user_refractory_cost)
		COOLDOWN_START(user, refractory_period, user_refractory_cost*10)
	if(target_refractory_cost)
		COOLDOWN_START(target, refractory_period, target_refractory_cost*10)
	user.last_lewd_datum = src
	if(user.cleartimer)
		deltimer(user.cleartimer)
	user.cleartimer = addtimer(CALLBACK(user, /mob/living/proc/clear_lewd_datum), 300, TIMER_STOPPABLE)
	return ..()

/mob/living/list_interaction_attributes(mob/living/LM)
	var/dat = ..()
	if(!COOLDOWN_FINISHED(LM, refractory_period))
		dat += "... хватает воздух ртом от усталости."
	switch(a_intent)
		if(INTENT_HELP)
			dat += "... действует нежно."
		if(INTENT_DISARM)
			dat += "... ведет себя игриво."
		if(INTENT_GRAB)
			dat += "... ведет себя грубо."
		if(INTENT_HARM)
			dat += "... яростно отбивается."
	//Here comes the fucking weird shit.
	if(client)
		var/client/cli = client
		var/client/ucli = LM.client
		if(cli.prefs.extremepref != "No")
			if(!ucli || (ucli.prefs.extremepref != "No"))
				if(!get_item_by_slot(ITEM_SLOT_EARS_LEFT) && !get_item_by_slot(ITEM_SLOT_EARS_RIGHT))
					if(has_ears())
						dat += "... ты видишь уши."
					else
						dat += "... ты видишь отверстия на месте ушей."
				else
					dat += "... ты видишь закрытые уши."
				if(!get_item_by_slot(ITEM_SLOT_EYES))
					if(has_eyes())
						dat += "... ты видишь глаза."
					else
						dat += "... ты видишь глазницы."
				else
					dat += "... ты видишь завязанные глаза."
	//
	// check those loops only once, thanks
	var/is_topless = is_topless()
	var/is_bottomless = is_bottomless()
	if(is_topless && is_bottomless)
		dat += "... ты видишь полностью обнаженное тело."
	else
		if((is_topless && !is_bottomless) || (!is_topless && is_bottomless))
			dat += "... ты видишь практически голое тело."
		else
			dat += "... ты видишь одежду."
	if(has_breasts(REQUIRE_EXPOSED))
		dat += "... ты видишь грудь ([BREASTS_SIZE_DEF]-cups)."
	if(has_penis(REQUIRE_EXPOSED))
		dat += "... ты видишь член."
	if(has_strapon(REQUIRE_EXPOSED))
		dat += "... ты видишь пристегнутый страпон."
	if(has_balls(REQUIRE_EXPOSED))
		dat += "... ты видишь яйца."
	if(has_vagina(REQUIRE_EXPOSED))
		dat += "... ты видишь вагину."
	if(has_anus(REQUIRE_EXPOSED))
		dat += "... ты видишь анус."
	if(has_feet(REQUIRE_EXPOSED))
		switch(has_feet(REQUIRE_EXPOSED))
			if(2)
				dat += "... ты видишь две ноги."
			if(1)
				dat += "... ты видишь всего одну ногу."
	return dat
