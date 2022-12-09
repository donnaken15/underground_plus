
	Minigame_TimedCombo_GenericParams = {
		init = minigame_TimedCombo_init
		activate = minigame_TimedCombo_activate
		active = minigame_TimedCombo_active
		deactivate = minigame_TimedCombo_deactivate
		minigame
		no_restart
		in_combo = 0
	}
	script minigame_TimedCombo_init
		create name = <trigger_obj_id>
	endscript
	script minigame_TimedCombo_activate
		if ObjectExists id = minigame_combo_timer
			DestroyScreenElement id = minigame_combo_timer
		endif
		if ScreenElementExists id = minigame_message
			DestroyScreenElement id = minigame_message
		endif
		if ScreenElementExists id = MiniGame2
			DestroyScreenElement id = MiniGame2
		endif
		if ScreenElementExists id = MiniGame3
			DestroyScreenElement id = MiniGame3
		endif
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			type = TextBlockElement
			parent = root_window
			id = minigame_combo_timer
			text = " "
			font = small
			pos = (20.0,190.0)
			scale = 0.69999999
			rgba = [128 128 128 128]
			dims = (200.0,100.0)
			just = [left center]
			internal_just = [center center]
		}
	endscript
	script minigame_TimedCombo_active
		if NOT ScreenElementExists id = minigame_combo_timer
			printf "no minigame_combo_timer!  Tell brad"
			return
		endif
		if (<in_combo> = 1)
			GoalManager_UpdateComboTimer name = <goal_id>
			GoalManager_GetGoalParams name = <goal_id>
			if NOT GotParam minigame_text
				<minigame_text> = "River Combo"
			endif
			if GoalManager_CheckMinigameRecord name = <goal_id> <current_time>
				FormatText TextName = minigame_time "New Record!\n%s.%f\nsecond\n%t" s = <current_time_seconds> f = <current_time_fraction> t = <minigame_text>
				SetScreenElementProps {
					rgba = [128 128 32 128]
					id = minigame_combo_timer
					text = <minigame_time>
					scale = 0.69999999
				}
			else
				FormatText TextName = minigame_time "%s.%f\nsecond\n%t" s = <current_time_seconds> f = <current_time_fraction> t = <minigame_text>
				SetScreenElementProps {
					id = minigame_combo_timer
					text = <minigame_time>
					rgba = [115 26 26 95]
					scale = 0.69999999
				}
			endif
		else
			if GotParam cancelSkitch
				if Skater::Skitching
					return
				endif
				if Skater::AnimEquals SkitchInit
					return
				endif
			endif
			if SkaterCurrentScorePotGreaterThan 0
				GoalManager_EditGoal name = <goal_id> params = {in_combo = 1}
				GoalManager_SetStartTime name = <goal_id>
				RunScriptOnObject id = <trigger_obj_id> minigame_TimedCombo_set_exceptions params = {goal_id = <goal_id>}
			endif
		endif
	endscript
	script minigame_TimedCombo_deactivate
		<trigger_obj_id>::Obj_ClearExceptions
		GoalManager_EditGoal name = <goal_id> params = {in_combo = 0}
		if ObjectExists id = minigame_combo_timer
			RunScriptOnScreenElement id = minigame_combo_timer panel_message_wait_and_die params = {time = 2000}
		endif
	endscript
	script minigame_TimedCombo_set_exceptions
		Obj_SetException ex = SkaterLanded scr = minigame_TimedCombo_ResetTimer params = {goal_id = <goal_id>}
		Obj_SetException ex = SkaterBailed scr = minigame_TimedCombo_ResetTimer params = {goal_id = <goal_id>}
	endscript
	script minigame_TimedCombo_ResetTimer
		Obj_ClearExceptions
		GoalManager_EditGoal name = <goal_id> params = {in_combo = 0}
		SetScreenElementProps {
			id = minigame_combo_timer
			text = " "
		}
	endscript
	script minigame_TimedCombo_blinkTime
		DoMorph time = 0.1 alpha = 1
		DoMorph time = 0.11 alpha = 0
		DoMorph time = 0.2 alpha = 0
		DoMorph time = 0.20999999 alpha = 1
		wait 100
		Die
	endscript
