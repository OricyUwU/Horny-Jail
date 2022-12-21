/datum/interaction/cuddle
	description = "Поняшиться | Помогает справиться с увужасами."
	simple_message = "USER обнимается с TARGET."
	simple_style = "lewd"
	needs_physical_contact = TRUE

/datum/interaction/cuddle/display_interaction(mob/living/user, mob/living/target)
	var/static/list/possible_messages = list(
		"USER обнимается с TARGET.",
		"USER гладит TARGET по щеке.",
		"USER почесывает под подбородком TARGET.",
		"USER целует TARGET в шею.",
		"USER покусывает ушко TARGET.",
		"USER выдыхает теплый воздух в ухо TARGET.",
		"USER трется щекой об щеку TARGET.",
		"USER тыкается носами с TARGET.",
		"USER проводит руками по шее TARGET.",
		"USER проводит руками по груди TARGET.",
		"USER кладет ладони на щеки TARGET и вглядывается в глаза.",
	)
	var/use_message = replacetext(pick(possible_messages), "USER", " [user]")
	use_message = replacetext(use_message, "TARGET", " [target]")
	user.visible_message("<span class='[simple_style]'>[capitalize(use_message)]</span>")
