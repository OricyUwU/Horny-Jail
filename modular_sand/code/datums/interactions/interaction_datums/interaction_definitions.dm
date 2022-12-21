/datum/interaction/handshake
	description = "Пожать руку."
	simple_message = "USER пожимает руку TARGET."
	require_user_hands = TRUE
	needs_physical_contact = TRUE

/datum/interaction/pat
	description = "Похлопать по плечу."
	simple_message = "USER хлопает TARGET по плечу."
	require_user_hands = TRUE
	needs_physical_contact = TRUE

/datum/interaction/cheer
	description = "Приободрить."
	require_user_mouth = TRUE
	simple_message = "USER разводит пальцами губы TARGET в улыбке!"

/datum/interaction/highfive
	description = "Дать пять."
	require_user_mouth = TRUE
	simple_message = "USER и TARGET дают друг другу пять!"
	interaction_sound = 'modular_sand/sound/interactions/slap.ogg'
	needs_physical_contact = TRUE

/datum/interaction/headpat
	description = "Погладить по голове. Aww..."
	require_user_hands = TRUE
	simple_message = "USER гладит TARGET по голове!"
	needs_physical_contact = TRUE

/datum/interaction/salute
	description = "Отдать честь!"
	require_user_hands = TRUE
	simple_message = "USER отдает честь TARGET!"
	max_distance = 25

/datum/interaction/fistbump
	description = "Стукнуться кулачками!"
	require_user_hands = TRUE
	simple_message = "USER и TARGET бьются кулачками! ЕЕЕ!"
	needs_physical_contact = TRUE

/datum/interaction/pinkypromise
	description = "Сделать обещание на мизинчиках!"
	require_user_hands = TRUE
	simple_message = "USER цепляется мизинцами с TARGET! Обещание на мизинчиках!"
	needs_physical_contact = TRUE

/datum/interaction/bird
	description = "Показать средний палец!"
	require_user_hands = TRUE
	simple_message = "USER показывает TARGET средний палец!"
	max_distance = 25

/datum/interaction/holdhand
	description = "Взять за руку."
	require_user_hands = TRUE
	simple_message = "USER берет руку TARGET в свою."
	needs_physical_contact = TRUE
	max_distance = 25
