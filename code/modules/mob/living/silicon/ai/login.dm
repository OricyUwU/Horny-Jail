/mob/living/silicon/ai/Login()
	..()
	set_eyeobj_visible(TRUE)
	if(multicam_on)
		end_multicam()
	view_core()
