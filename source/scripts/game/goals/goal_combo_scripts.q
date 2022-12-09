
	Goal_amateurCOMBOline_genericParams = {
		goal_text = "Collect C-O-M-B-O"
		view_goals_text = "Collect C-O-M-B-O"
		goal_flags = [
			got_C
			got_O
			got_M
			got_B
			got_O2
		]
		init = ComboLetters_Init
		uninit = goal_uninit
		activate = ComboLetters_Activate
		fail = ComboLetters_Fail
		success = ComboLetters_Win
		expire = ComboLetters_Expire
		deactivate = ComboLetters_Deactivate
		letter_info = [
			{obj_id = TRG_Goal_COMBO_C text = "C"}
			{obj_id = TRG_Goal_COMBO_O text = "O"}
			{obj_id = TRG_Goal_COMBO_M text = "M"}
			{obj_id = TRG_Goal_COMBO_B text = "B"}
			{obj_id = TRG_Goal_COMBO_O2 text = "O"}
		]
		trigger_obj_id = TRG_G_COMBO_Pro
		restart_node = TRG_G_COMBO_RestartNode
		start_pad_id = G_COMBO_StartPad
		got_first_letter = 0
		record_type = score
	}
	Goal_ProCOMBOline_genericParams = {
		goal_text = "Collect C-O-M-B-O"
		view_goals_text = "Pro C-O-M-B-O letters"
		goal_flags = [
			got_C
			got_O
			got_M
			got_B
			got_O2
		]
		init = ComboLetters_Init
		uninit = goal_uninit
		activate = ComboLetters_Activate
		expire = ComboLetters_Expire
		fail = ComboLetters_Fail
		success = ComboLetters_Win
		deactivate = ComboLetters_Deactivate
		letter_info = [
			{obj_id = TRG_Goal_COMBO_C text = "C"}
			{obj_id = TRG_Goal_COMBO_O text = "O"}
			{obj_id = TRG_Goal_COMBO_M text = "M"}
			{obj_id = TRG_Goal_COMBO_B text = "B"}
			{obj_id = TRG_Goal_COMBO_O2 text = "O"}
		]
		time = 120
		trigger_obj_id = TRG_G_PROLINE_Pro
		restart_node = TRG_G_PROLINE_RestartNode
		start_pad_id = G_PROLINE_StartPad
		got_first_letter = 0
		record_type = score
	}
	Goal_MedCOMBOline_genericParams = {
		goal_text = "Collect C-O-M-B-O"
		view_goals_text = "Pro C-O-M-B-O letters"
		goal_flags = [
			got_C
			got_O
			got_M
			got_B
			got_O2
		]
		init = ComboLetters_Init
		uninit = goal_uninit
		activate = ComboLetters_Activate
		expire = ComboLetters_Expire
		fail = ComboLetters_Fail
		success = ComboLetters_Win
		deactivate = ComboLetters_Deactivate
		letter_info = [
			{obj_id = TRG_Goal_COMBO_C text = "C"}
			{obj_id = TRG_Goal_COMBO_O text = "O"}
			{obj_id = TRG_Goal_COMBO_M text = "M"}
			{obj_id = TRG_Goal_COMBO_B text = "B"}
			{obj_id = TRG_Goal_COMBO_O2 text = "O"}
		]
		time = 120
		trigger_obj_id = TRG_G_MedCOMBO_Pro
		restart_node = TRG_G_MedCOMBO_RestartNode
		start_pad_id = G_MedCOMBO_StartPad
		got_first_letter = 0
		record_type = score
	}
	script ComboLetters_Init
		goal_init goal_id = <goal_id>
	endscript
	script ComboLetters_Activate
		goal_start goal_id = <goal_id>
		Create_Combo goal_id = <goal_id>
		GoalManager_EditGoal name = <goal_id> params = {got_first_letter = 0}
		GetArraySize <goal_flags>
		<index> = 0
		while
			RunScriptOnObject id = ((<letter_info>[<index>]).obj_id) ComboLetter_InitLetter params = {goal_id = <goal_id> flag = (<goal_flags>[<index>]) id = ((<letter_info>[<index>]).obj_id)}
			<index> = (<index> + 1)
		repeat <array_size>
	endscript
	script ComboLetters_Deactivate
		KillSpawnedScript name = ComboLetter_GetLetter
		KillSpawnedScript name = ComboLetter_GotLetter
		KillSpawnedScript name = ComboLetter_GotLetter2
		KillSpawnedScript id = ComboLetter_GoalScript
		goal_deactivate goal_id = <goal_id>
		GoalManager_ResetGoalTrigger name = <goal_id>
		goal_combo_kill_letters goal_id = <goal_id>
		kill_combo_messages <...>
		GoalManager_EditGoal name = <goal_id> params = {got_first_letter = 0}
	endscript
	script ComboLetter_InitLetter
		GoalManager_GetGoalParams name = <goal_id>
		Obj_ClearExceptions
		Obj_RotY speed = 200
		Obj_SetInnerRadius 8
		Obj_SetException ex = SkaterInRadius scr = ComboLetter_GotLetter params = {goal_id = <goal_id> flag = <flag> id = <id>}
	endscript
	script ComboLetter_HUDLetter
		GetArraySize <letter_info>
		<index> = 0
		while
			if ((<goal_flags>[<index>]) = <flag>)
				<text> = ((<letter_info>[<index>]).text)
				<y_pos> = (150 + (30 * <index>))
				break
			endif
			<index> = (<index> + 1)
		repeat <array_size>
		if GotParam text
			create_panel_message {
				id = <flag>
				text = <text>
				style = combo_letter_panel_message
				params = {y_pos = <y_pos>}
			}
		else
			script_assert "couldn't find combo letter text"
		endif
	endscript
	script hide_combo_letters
		if ObjectExists id = got_C
			DoScreenElementMorph id = got_C time = 0 alpha = 0
		endif
		if ObjectExists id = got_O
			DoScreenElementMorph id = got_O time = 0 alpha = 0
		endif
		if ObjectExists id = got_M
			DoScreenElementMorph id = got_M time = 0 alpha = 0
		endif
		if ObjectExists id = got_B
			DoScreenElementMorph id = got_B time = 0 alpha = 0
		endif
		if ObjectExists id = got_O2
			DoScreenElementMorph id = got_O2 time = 0 alpha = 0
		endif
	endscript
	script unhide_combo_letters
		if ObjectExists id = got_C
			DoScreenElementMorph id = got_C time = 0 alpha = 1
		endif
		if ObjectExists id = got_O
			DoScreenElementMorph id = got_O time = 0 alpha = 1
		endif
		if ObjectExists id = got_M
			DoScreenElementMorph id = got_M time = 0 alpha = 1
		endif
		if ObjectExists id = got_B
			DoScreenElementMorph id = got_B time = 0 alpha = 1
		endif
		if ObjectExists id = got_O2
			DoScreenElementMorph id = got_O2 time = 0 alpha = 1
		endif
	endscript
	script ComboLetter_GotLetter
		SpawnSkaterScript ComboLetter_GotLetter2 params = {goal_id = <goal_id> id = <id> flag = <flag>}
	endscript
	script ComboLetter_GotLetter2
		if NOT IsInBail
			if SkaterCurrentScorePotGreaterThan 0
				ComboLetter_GetLetter <...>
			else
				if Skating
					if NOT OnGround
						ComboLetter_GetLetter <...>
					endif
				else
					if Walking
						if Walk_Air
							ComboLetter_GetLetter <...>
						endif
					endif
				endif
			endif
		endif
	endscript
	script ComboLetter_GetLetter
		KillLocal name = <id>
		GoalManager_GetGoalParams name = <goal_id>
		GoalManager_SetGoalFlag name = <goal_id> <flag> 1
		if GoalManager_AllFlagsSet name = <goal_id>
			BroadcastEvent Type = ComboLetter_GotLastLetter
		endif
		if (<got_first_letter> = 0)
			GoalManager_EditGoal name = <goal_id> params = {got_first_letter = 1}
			SpawnScript ComboLetter_StartCombo id = ComboLetter_GoalScript params = {goal_id = <goal_id>}
		endif
		PlaySound GapSound vol = 100
		ComboLetter_HUDLetter letter_info = <letter_info> goal_flags = <goal_flags> flag = <flag>
	endscript
	script ComboLetter_StartCombo
		ClearExceptions
		SetException ex = SkaterLanded scr = ComboLetters_ComboLanded params = {goal_id = <goal_id>}
		SetException ex = SkaterBailed scr = ComboLetters_ComboLost params = {goal_id = <goal_id>}
		SetException ex = ComboLetter_GotLastLetter scr = ComboLetter_GotLastLetter params = {goal_id = <goal_id>}
		if NOT Skater::CurrentScorePotGreaterThan 0
			SetException ex = SkaterEnterGround scr = ComboLetters_ComboLanded params = {goal_id = <goal_id>}
			SetException ex = SkaterEnterLadder scr = ComboLetters_ComboLanded params = {goal_id = <goal_id>}
			SetException ex = SkaterEnterHang scr = ComboLetters_ComboLanded params = {goal_id = <goal_id>}
			WaitForEvent Type = SkaterEnterCombo
			ClearException SkaterEnterGround
			ClearException SkaterEnterLadder
			ClearException SkaterEnterHang
		endif
		Block
	endscript
	script ComboLetter_GotLastLetter
		ClearExceptions
		if NOT Skater::CurrentScorePotGreaterThan 0
			SetException ex = SkaterEnterGround scr = ComboLetters_WinGoal params = {goal_id = <goal_id>}
			SetException ex = SkaterEnterLadder scr = ComboLetters_WinGoal params = {goal_id = <goal_id>}
			SetException ex = SkaterEnterHang scr = ComboLetters_WinGoal params = {goal_id = <goal_id>}
		endif
		SetException ex = SkaterBailed scr = ComboLetters_ComboLost params = {goal_id = <goal_id>}
		SetException ex = SkaterLanded scr = ComboLetters_WinGoal params = {goal_id = <goal_id>}
		Wait 60 Seconds
		Block
	endscript
	script ComboLetters_WinGoal
		ClearExceptions
		GoalManager_EditGoal name = <goal_id> params = {got_first_letter = 0}
		GoalManager_WinGoal name = <goal_id>
	endscript
	script ComboLetters_ComboLost
		ClearExceptions
		SpawnScript ComboLetters_ComboLost2 params = <...>
	endscript
	script ComboLetters_ComboLost2
		GoalManager_GetGoalParams name = <goal_id>
		if GoalManager_GoalIsActive name = <goal_id>
			GoalManager_ResetGoalTrigger name = <goal_id>
			GoalManager_LoseGoal name = <goal_id>
			create_panel_message id = new_goal_message text = "You lost your combo!" style = panel_message_generic_loss
		endif
	endscript
	script ComboLetters_ComboLanded
		ClearExceptions
		if NOT GoalManager_GoalIsActive name = <goal_id>
			return
		endif
		SpawnScript ComboLetters_ComboLanded2 params = <...>
	endscript
	script ComboLetters_ComboLanded2
		GoalManager_GetGoalParams name = <goal_id>
		GoalManager_LoseGoal name = <goal_id>
		create_panel_message id = new_goal_message text = "You lost your combo!" style = panel_message_generic_loss
	endscript
	script ComboLetters_Expire
		goal_expire goal_id = <goal_id>
		GoalManager_LoseGoal name = <goal_id>
	endscript
	script ComboLetters_Fail
		GoalManager_EditGoal name = <goal_id> params = {got_first_letter = 0}
		goal_fail goal_id = <goal_id>
	endscript
	script ComboLetters_Win
		goal_success goal_id = <goal_id>
	endscript
	script kill_combo_messages
		ReplayRecordSimpleScriptCall scriptname = kill_combo_messages
		GetArraySize <goal_flags>
		<index> = 0
		while
			if ScreenElementExists id = (<goal_flags>[<index>])
				RunScriptOnScreenElement id = (<goal_flags>[<index>]) kill_panel_message
			endif
			<index> = (<index> + 1)
		repeat <array_size>
	endscript
	script Create_Combo
		GoalManager_GetGoalParams name = <goal_id>
		GetArraySize <letter_info>
		<index> = 0
		while
			CreateLocal name = ((<letter_info>[<index>]).obj_id)
			RunScriptOnObject id = ((<letter_info>[<index>]).obj_id) bounce_combo_letter
			<index> = (<index> + 1)
		repeat <array_size>
	endscript
	script goal_combo_kill_letters
		GoalManager_GetGoalParams name = <goal_id>
		GetArraySize <letter_info>
		<index> = 0
		while
			KillLocal name = ((<letter_info>[<index>]).obj_id)
			<index> = (<index> + 1)
		repeat <array_size>
	endscript
	script bounce_combo_letter
		Obj_Hover Amp = 6 Freq = 2
	endscript
	script combo_letter_panel_message
		SetProps font = small just = [center center] rgba = [10 225 10 115]
		DoMorph time = 0.08 scale = 0.30000001 pos = ((695.0,0.0) + ((0.0,1.0) * <y_pos>))
		DoMorph time = 0.12 scale = 3.5 pos = ((610.0,0.0) + ((0.0,1.0) * <y_pos>))
		DoMorph time = 0.14 scale = 0.60000002
		DoMorph time = 0.16 scale = 1.79999995
		DoMorph time = 0.18000001 scale = 0.80000001
		DoMorph time = 0.2 scale = 1.20000005
	endscript
