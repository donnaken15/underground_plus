
	minigame_fountain_genericParams = {
		init = minigame_fountain_init
		deactivate = minigame_fountain_deactivate
		number_collected = 1
		minigame_record = 0
		trigger_obj_id = TRG_MG_RoundCounter02
		no_restart
		minigame
		betting_game
		betting_guy_node = TRG_MG_BettingNav02
		bet_action = "grind the flag pole fountain ledge"
		bet_unit = "times"
		bet_easy = {
			bet_amount = 100
			bet_challenge = 2
			tries = 5
		}
		bet_medium = {
			bet_amount = 250
			bet_challenge = 5
			tries = 3
		}
		bet_hard = {
			bet_amount = 1000
			bet_challenge = 8
			tries = 2
		}
	}
	minigame_fountain2_genericParams = {
		deactivate = minigame_fountain_deactivate
		number_collected = 1
		minigame_record = 0
		trigger_obj_id = TRG_MG_JockCounter
		no_restart
		minigame
	}
	script minigame_fountain_init
		create name = <trigger_obj_id>
	endscript
	script minigame_fountain_deactivate
		printf "deactivating fountain minigame"
		minigame_fountain_done goal_id = <goal_id>
		GoalManager_EditGoal name = <goal_id> params = {number_collected = 1}
	endscript
	script minigame_fountain_done
		printf "minigame_fountain_done"
		GoalManager_EndBetAttempt name = <goal_id>
		if GotParam goal_id
			GoalManager_GetGoalParams name = <goal_id>
		else
			GoalManager_GetGoalParams name = Sch_goal_minigame_fountain
		endif
		<trigger_obj_id>::Obj_ClearExceptions
		GoalManager_DeactivateGoal name = Sch_goal_minigame_fountain
	endscript
	script minigame_fountain_GrindCounter type = "default" object = "Flag Pole" verb_s = "grind" verb_p = "grinds"
		if ScreenElementExists id = minigame_combo_timer
			DestroyScreenElement id = minigame_combo_timer
		endif
		GoalManager_StartBetAttempt name = <goal_id>
		if GotParam goal_id
			GoalManager_GetGoalParams name = <goal_id>
		else
			<goal_id> = Sch_goal_minigame_fountain
			GoalManager_GetGoalParams name = Sch_goal_minigame_fountain
		endif
		printf "grindCounter"
		if NOT GoalManager_GoalIsActive name = <goal_id>
			GoalManager_ActivateGoal name = <goal_id>
			RunScriptOnObject id = <trigger_obj_id> minigame_fountain_set_exceptions params = {goal_id = <goal_id>}
		endif
		GoalManager_GotCounterObject name = <goal_id>
		if GoalManager_CheckMinigameRecord name = <goal_id> <number_collected>
			create_panel_message id = minigame_record text = "New Record!" style = panel_message_MG_NewRecord
			FormatText TextName = minigame_message "%i" i = <number_collected>
			create_panel_message id = minigame_message text = <minigame_message> style = panel_message_MG_1_High
		else
			FormatText TextName = minigame_message "%i" i = <number_collected>
			create_panel_message id = minigame_message text = <minigame_message> style = panel_message_MG_1_Low
		endif
		create_panel_message id = MiniGame2 text = <object> style = panel_message_MG_2
		if IntegerEquals a = <number_collected> b = 1
			create_panel_message id = MiniGame3 text = <verb_s> style = panel_message_MG_3
		else
			create_panel_message id = MiniGame3 text = <verb_p> style = panel_message_MG_3
		endif
	endscript
	script minigame_fountain_set_exceptions
		printf "setting exceptions"
		Obj_SetException ex = SkaterLanded scr = minigame_fountain_done params = {goal_id = <goal_id>}
		Obj_SetException ex = SkaterBailed scr = minigame_fountain_done params = {goal_id = <goal_id>}
	endscript
	script minigame_fountain_success
		create_speech_box
	endscript
