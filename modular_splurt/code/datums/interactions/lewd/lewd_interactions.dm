//help
/datum/interaction/lewd

	var/unholy = FALSE //Same as extreme but... we don't talk about this one...

	var/require_user_legs
	var/require_user_num_legs

	var/require_target_legs
	var/require_target_num_legs

	var/require_user_belly
	var/require_target_belly

/datum/interaction/lewd/evaluate_user(mob/living/user, silent = TRUE, action_check = TRUE)
	if(require_user_belly)
		switch(require_user_belly)
			if(REQUIRE_EXPOSED)
				if(!user.has_belly(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Для этого ваш живот не должен быть закрыт одеждой.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!user.has_belly(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>Кажется ваш живот слишком плоский для этого.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!user.has_belly(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Для этого ваш живот должен быть закрыт одеждой</span>")
					return FALSE

	if(require_user_legs)
		switch(require_user_legs)
			if(REQUIRE_EXPOSED)
				if(!user.has_legs(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Для этого ваши ноги должены быть закрыты одеждой.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!user.has_legs(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Для этого ваши ноги должны быть закрыты одеждой.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!user.has_legs(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>Кажется вам не хватает для этого ног.</span>")
					return FALSE

	if(require_user_num_legs && (user.has_legs() < require_user_num_legs))
		if(!silent)
			to_chat(user, "<span class='warning'>Кажется вам не хватает для этого ног.</span>")
		return FALSE


	if(unholy)
		var/client/cli = user.client
		if(cli)
			if(cli.prefs.unholypref == "No")
				if(!silent)
					to_chat(user, "<span class='warning'>Это явно не для вас.</span>")
				return FALSE
	. = ..()

/datum/interaction/lewd/evaluate_target(mob/living/user, mob/living/target, silent = TRUE)
	if(require_target_belly)
		switch(require_target_belly)
			if(REQUIRE_EXPOSED)
				if(!target.has_belly(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Для этого их живот не должен быть закрыт одеждой.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!target.has_belly(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>Кажется их живот слишком плоский для этого</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!target.has_belly(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Для этого их живот должен быть закрыт одеждой.</span>")
					return FALSE

	if(require_target_legs)
		switch(require_target_legs)
			if(REQUIRE_EXPOSED)
				if(!target.has_legs(REQUIRE_EXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Для этого ноги [target.p_their()] не должны быть закрыты одеждой.</span>")
					return FALSE
			if(REQUIRE_UNEXPOSED)
				if(!target.has_legs(REQUIRE_UNEXPOSED))
					if(!silent)
						to_chat(user, "<span class='warning'>Для этого ноги[target.p_their()] должны быть закрыты одеждой.</span>")
					return FALSE
			if(REQUIRE_ANY)
				if(!target.has_legs(REQUIRE_ANY))
					if(!silent)
						to_chat(user, "<span class='warning'>Кажется [target.p_they()] не хватает для этого ног.</span>")
					return FALSE

	if(require_target_num_legs && (target.has_legs() < require_target_num_legs))
		if(!silent)
			to_chat(user, "<span class='warning'>Кажется [target.p_they()] не хватает для этого ног.</span>")
		return FALSE

	if(unholy)
		var/client/cli = target.client
		if(cli)
			if(target.client.prefs.unholypref == "No")
				if(!silent)
					to_chat(user, "<span class='warning'>По некоторым причинам - вы не хотите этим заниматься с [target].</span>")
				return FALSE
	. = ..()

/mob/living/list_interaction_attributes(mob/living/LM)
	. = ..()
	if(has_belly(REQUIRE_EXPOSED))
		. += "...обладает животиком"
