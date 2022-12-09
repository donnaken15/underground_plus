
	script SwitchToWalkingPhysics
		BroadcastEvent Type = SkaterExitSkating
		ClearTrickQueues
		SkaterPhysicsControl_SwitchSkatingToWalking
		SkaterLoopingSound_TurnOff
		EnableInputEvents
		BroadcastEvent Type = SkaterEnterWalking
		KillExtraTricks
		PressureOff
		NollieOff
		SetTrickName ''
		SetTrickScore 0
		Display Blockspin
	endscript
	script SwitchToSkatingPhysics
		BroadcastEvent Type = SkaterExitWalking
		ClearAllWalkingExceptions
		ClearTrickQueue
		DisableInputEvents
		Obj_KillSpawnedScript Id = ComboRunOutTrickDisplayDelay
		Obj_KillSpawnedScript Id = ActivateGroundTricksDelay
		SetProps remove_tags = [WalkingGroundTricksInactive]
		SetTrickName ''
		SetTrickScore 0
		Display Blockspin
		RunTimer_Pause
		SkaterPhysicsControl_SwitchWalkingToSkating
		BroadcastEvent Type = SkaterEnterSkating
	endscript
	WalkGroundTricks = [
		{SwitchControl_Trigger Scr = WalkingRunToSkating}
	]
	WalkAirTricks = [
		{SwitchControl_Trigger Scr = WalkingAirToSkating}
	]
	script BeginWalkingGenericTrick
		CleanUp_WalkingtoSkating
		if NOT OnGround
			PerhapsAwardCaveman
		endif
	endscript
	script BeginWalkingManualTrick
		Walk_ScaleAnimSpeed Off
		CleanUp_WalkingtoSkating
		PerhapsAwardCaveman
	endscript
	script WalkingToRailTrick
		Walk_ScaleAnimSpeed Off
		PlayAnim Anim = JumpAirTo5050 From = 0 To = 0.30000001 Seconds
		PerhapsAwardCaveman HaveNotSwitchedPhysicsStatesYet
		CleanUp_WalkingtoSkating
	endscript
	script WalkingAirToTransitionTrick
		Walk_ScaleAnimSpeed Off
		PlayAnim Anim = JumpAirToAirIdle
		CleanUp_WalkingtoSkating
		WaitAnimWhilstChecking
		Goto Airborne Params = {NoSkateToWalkTricks}
	endscript
	script WalkingRunToSkating
		SkaterLoopingSound_TurnOff
		if (inNetGame)
			if NOT GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING
				if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING
					SetQueueTricks Jumptricks WalkToSkateTransition_GroundTricks SkateToWalkTricks
				else
					SetQueueTricks Jumptricks WalkToSkateTransition_GroundTricks
				endif
			else
				SetQueueTricks Jumptricks WalkToSkateTransition_GroundTricks
			endif
		else
			if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING
				SetQueueTricks Jumptricks WalkToSkateTransition_GroundTricks SkateToWalkTricks
			else
				SetQueueTricks Jumptricks WalkToSkateTransition_GroundTricks
			endif
		endif
		if AnimEquals[SkateToWalk WSkateToRun SlowSkateToStand BrakeToStand]
			PlayAnim Anim = WRunToSkate SyncToReversePreviousAnim EffectivePreviousAnimDuration = 0.5
		else
			PlayAnim Anim = WRunToSkate
		endif
		SetEventHandler Ex = FlailHitWall Scr = FlailVibrate
		SetEventHandler Ex = FlailLeft Scr = FlailVibrate
		SetEventHandler Ex = FlailRight Scr = FlailVibrate
		ClearException RunHasEnded
		ClearException GoalHasEnded
		ClearException Ollied
		Wait CavemanBailDuration Seconds
		SetException Ex = Ollied Scr = Ollie Params = {OutAnim = JumpAirToAirIdle SyncOutAnimToPreviousAnim}
		WaitAnimWhilstChecking AndManuals
		LandSkaterTricks
		Goto OnGroundAi
	endscript
	script WalkToSkateTransition_ToggleStance
		ApplyStanceToggle
		WaitAnimWhilstChecking AndManuals
		LandSkaterTricks
		Goto OnGroundAi
	endscript
	script WalkingAirToSkating
		SkaterLoopingSound_TurnOff
		Walk_ScaleAnimSpeed Off
		PlayAnim Anim = JumpAirToAirIdle
		Wait CavemanBailDuration Seconds
		WaitAnimWhilstChecking
		Goto Airborne Params = {NoSkateToWalkTricks}
	endscript
	script ComboRunOutTrickDisplayDelay
		Obj_GetId
		SetEventHandler Ex = SkaterExitCombo Scr = FilterSkaterExitComboEvent Params = {ThisSkaterId = <ObjId>}
		Wait RunoutTrickDelay Seconds
		SetTrickName 'Combo Run Out'
		SetTrickScore COMBO_RUNOUT_SCORE
		Display Blockspin
	endscript
	script FilterSkaterExitComboEvent
		if (<SkaterId> = <ThisSkaterId>)
			Goto NullScript
		endif
	endscript
	script PerhapsAwardCaveman
		if NOT GotParam HaveNotSwitchedPhysicsStatesYet
			GetPreviousPhysicsStateDuration
			if (<PreviousPhysicsStateDuration> > RunoutTrickDelay)
				SetTrickName 'Caveman'
				SetTrickScore CAVEMAN_SCORE
				Display
			endif
		else
			GetTimeSincePhysicsSwitch
			if (<TimeSincePhysicsSwitch> > RunoutTrickDelay)
				SetTrickName 'Caveman'
				SetTrickScore CAVEMAN_SCORE
				Display
			endif
		endif
	endscript
	script ActivateGroundTricksDelay
		Wait CavemanBailDuration Seconds
		SetProps remove_tags = [WalkingGroundTricksInactive]
		if Walk_Ground
			SetWalkingGroundTricks
		endif
	endscript
	script SetWalkingGroundTricks
		if NOT IsBoardMissing
			GetTags
			if NOT GotParam WalkingGroundTricksInactive
				SetQueueTricks WalkGroundTricks
			else
				SetQueueTricks NoTricks
			endif
		else
			SetQueueTricks NoTricks
		endif
		SetExtraGrindTricks NoTricks
		SetManualTricks NoTricks
	endscript
	script SetWalkingAirTricks
		if NOT IsBoardMissing
			SetQueueTricks special = SpecialTricks AirTricks WalkAirTricks
			SetExtraGrindTricks special = SpecialGrindTricks GrindTricks
			if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS
				if NOT ((inNetGame) && (GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_MANUALS))
					SetManualTricks special = SpecialManualTricks GroundManualTricks
				else
					SetManualTricks NoTricks
				endif
			else
				SetManualTricks NoTricks
			endif
		else
			SetQueueTricks NoTricks
			SetExtraGrindTricks NoTricks
			SetManualTricks NoTricks
		endif
	endscript
	script SetWalkingOffTricks
		SetQueueTricks NoTricks
		SetExtraGrindTricks NoTricks
		SetManualTricks NoTricks
	endscript
	script SetWalkingTrickState NewWalkingTrickState = GROUND WalkingTricksState = UNSET
		GetTags
		if NOT (<NewWalkingTrickState> = <WalkingTricksState>)
			ClearTrickQueues
			switch <NewWalkingTrickState>
				case GROUND
					ClearExceptionGroup WalkingTransitionTrickExceptions
					SetException Ex = AcidDrop Scr = WalkingAirToTransitionTrick Group = WalkingTransitionTrickExceptions
					SetException Ex = Rail Scr = WalkingToRailTrick Group = WalkingTransitionTrickExceptions
					RunTimer_Unpause
					SetEventHandler Ex = RunTimerUp Scr = Walk_LandSkaterTricks Group = RunTimerEvents
					SetEventHandler Ex = RunHasEnded Scr = EndOfRun_WalkingEvent Group = WalkingEndRunEvents
					SetEventHandler Ex = GoalHasEnded Scr = Goal_EndOfRun_WalkingEvent Group = WalkingEndRunEvents
					ResetLandedFromVert
					LaunchStateChangeEvent State = Skater_OnGround
					SetWalkingGroundTricks
				case AIR
					ClearEventBuffer Buttons = [UP DOWN] OlderThan = 0
					ClearExceptionGroup WalkingTransitionTrickExceptions
					SetException Ex = AcidDrop Scr = WalkingAirToTransitionTrick Group = WalkingTransitionTrickExceptions
					SetException Ex = Rail Scr = WalkingToRailTrick Group = WalkingTransitionTrickExceptions
					ClearExceptionGroup WalkingEndRunEvents
					ClearExceptionGroup RunTimerEvents
					LaunchStateChangeEvent State = Skater_InAir
					SetWalkingAirTricks
				case Off
					ClearExceptionGroup WalkingTransitionTrickExceptions
					RunTimer_Unpause
					SetEventHandler Ex = RunTimerUp Scr = Walk_LandSkaterTricks Group = RunTimerEvents
					SetEventHandler Ex = RunHasEnded Scr = EndOfRun_WalkingEvent Group = WalkingEndRunEvents
					SetEventHandler Ex = GoalHasEnded Scr = Goal_EndOfRun_WalkingEvent Group = WalkingEndRunEvents
					ResetLandedFromVert
					SetWalkingOffTricks
			endswitch
			SetTags WalkingTricksState = <NewWalkingTrickState>
		endif
	endscript
	script Walk_LandSkaterTricks
		LandSkaterTricks
		Obj_KillSpawnedScript Id = ComboRunOutTrickDisplayDelay
	endscript
	script WaitAnimWalking
		while
			DoNextManualTrick ScriptToRunFirst = BeginWalkingManualTrick FromWalk
			DoNextTrick ScriptToRunFirst = BeginWalkingGenericTrick
			if AnimFinished
				break
			endif
			Wait 1 GameFrame
		repeat
	endscript
	script WaitWalking
		while
			DoNextManualTrick ScriptToRunFirst = BeginWalkingManualTrick FromWalk
			DoNextTrick ScriptToRunFirst = BeginWalkingGenericTrick
			Wait 1 GameFrame
		repeat
	endscript
	script PlayWalkAnim
		if NOT IsBoardMissing
			PlayAnim <...>
		else
			AppendSuffixToChecksum Base = <Anim> SuffixString = "_Partial"
			if AnimExists <appended_id>
				PlayAnim <...> PartialAnimOverlay = <appended_id> PartialAnimOverlayId = BoardMissingPartialAnimOverlay
			else
				PlayAnim <...>
			endif
		endif
	endscript
	script PlayFlippedAnim
		if NOT Flipped
			PlayWalkAnim Anim = (<Anims>[1]) <...>
		else
			PlayWalkAnim Anim = (<Anims>[0]) <...>
		endif
	endscript
	script PlaySpeedChosenAnim
		Walk_GetSpeedScale
		if NOT GotParam NoSpeedUpdate
			switch <SpeedScale>
				case WALK_SLOW
					Walk_ScaleAnimSpeed Run StandardSpeed = (<Speeds>[0])
					PlayWalkAnim Anim = (<Anims>[0]) <...>
				case WALK_FAST
					Walk_ScaleAnimSpeed Run StandardSpeed = (<Speeds>[1])
					PlayWalkAnim Anim = (<Anims>[1]) <...>
				case RUN_SLOW
					Walk_ScaleAnimSpeed Run StandardSpeed = (<Speeds>[2])
					PlayWalkAnim Anim = (<Anims>[2]) <...>
				case RUN_FAST
					Walk_ScaleAnimSpeed Run StandardSpeed = (<Speeds>[3])
					PlayWalkAnim Anim = (<Anims>[3]) <...>
			endswitch
		else
			Walk_ScaleAnimSpeed Off
			switch <SpeedScale>
				case WALK_SLOW
					PlayWalkAnim Anim = (<Anims>[0]) Speed = (<Speeds>[0]) <...>
				case WALK_FAST
					PlayWalkAnim Anim = (<Anims>[1]) Speed = (<Speeds>[1]) <...>
				case RUN_SLOW
					PlayWalkAnim Anim = (<Anims>[2]) Speed = (<Speeds>[2]) <...>
				case RUN_FAST
					PlayWalkAnim Anim = (<Anims>[3]) Speed = (<Speeds>[3]) <...>
			endswitch
		endif
	endscript
	script RunSpeedChosenAnim
		PlaySpeedChosenAnim NoRestart <...>
		while
			WaitAnimWalkingFrame
			if AnimFinished
				break
			endif
			WaitAnimWalkingFrame
			if AnimFinished
				break
			endif
			WaitAnimWalkingFrame
			if AnimFinished
				break
			endif
			WaitAnimWalkingFrame
			if AnimFinished
				break
			endif
			PlaySpeedChosenAnim SyncToPreviousAnim NoRestart <...>
		repeat
	endscript
	script CycleSpeedChosenAnim
		PlaySpeedChosenAnim Cycle NoRestart <...>
		while
			WaitWalkingFrame
			WaitWalkingFrame
			WaitWalkingFrame
			WaitWalkingFrame
			PlaySpeedChosenAnim Cycle SyncToPreviousAnim NoRestart <...>
		repeat
	endscript
	script WaitWalkingFrame
		DoNextManualTrick ScriptToRunFirst = BeginWalkingManualTrick FromWalk
		DoNextTrick ScriptToRunFirst = BeginWalkingGenericTrick
		Wait 1 GameFrame
	endscript
	script WaitAnimWalkingFrame
		DoNextManualTrick ScriptToRunFirst = BeginWalkingManualTrick FromWalk
		DoNextTrick ScriptToRunFirst = BeginWalkingGenericTrick
		if AnimFinished
			return
		endif
		Wait 1 GameFrame
	endscript
	script ClearAllWalkingExceptions
		ClearExceptionGroup WalkingStateExceptions
		ClearExceptionGroup WalkingEvents
		ClearExceptionGroup WalkingEndRunEvents
		ClearExceptionGroup WalkingTransitionTrickExceptions
		ClearExceptionGroup WalkingCollideEvents
		ClearExceptionGroup RunTimerEvents
	endscript
	script JustStoppedSkatingState
		ClearExceptionGroup WalkingStateExceptions
		if NOT GotParam Restart
			SetException Ex = Run Scr = SkateToRunState Group = WalkingStateExceptions
			SetException Ex = Stand Scr = SkateToStandState Group = WalkingStateExceptions
			SetException Ex = Skid Scr = SkateToStandState Group = WalkingStateExceptions
			SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
			SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
			SetException Ex = Land Scr = LandState Group = WalkingStateExceptions
			SetException Ex = Hang Scr = AirToHangState Group = WalkingStateExceptions
			SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions
			SetException Ex = AIR Scr = SkateToAirState Group = WalkingStateExceptions
			SetException Ex = Jump Scr = SkateToAirState Group = WalkingStateExceptions
			SetException Ex = WalkOffEdge Scr = SkateToAirState Group = WalkingStateExceptions
			SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
			SetException Ex = Rail Scr = WalkingToRailTrick Group = WalkingStateExceptions
			SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions
			SetException Ex = AcidDrop Scr = WalkingAirToTransitionTrick Group = WalkingTransitionTrickExceptions
		else
			SetException Ex = Run Scr = StandState Group = WalkingStateExceptions
			SetException Ex = Stand Scr = StandState Group = WalkingStateExceptions
			SetException Ex = Skid Scr = StandState Group = WalkingStateExceptions
			SetException Ex = RotateLeft Scr = StandState Group = WalkingStateExceptions
			SetException Ex = RotateRight Scr = StandState Group = WalkingStateExceptions
			SetException Ex = Land Scr = StandState Group = WalkingStateExceptions
			SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
			SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
			SetException Ex = Hang Scr = HangState Group = WalkingStateExceptions
			SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions
			SetException Ex = AIR Scr = AirState Group = WalkingStateExceptions
			SetException Ex = Jump Scr = AirState Group = WalkingStateExceptions
			SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions
			SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
			SetException Ex = Rail Scr = WalkingToRailTrick Group = WalkingStateExceptions
			SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions
			SetException Ex = AcidDrop Scr = WalkingAirToTransitionTrick Group = WalkingTransitionTrickExceptions
			PlayWalkAnim Anim = WStand BlendPeriod = 0
			BlendPeriodOut 0
			GetCameraId
			<CameraId>::WalkCamera_Reset
		endif
		if NOT IsNGC
			SetEventHandler Ex = Trigger_L2 Scr = CameraFlushButton Group = WalkingEvents
		else
			SetEventHandler Ex = Trigger_L1 Scr = CameraFlushButton Group = WalkingEvents
		endif
		SetEventHandler Ex = Release_X Scr = JumpButton Group = WalkingEvents
		SetEventHandler Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBailWalk Group = WalkingCollideEvents
		SetException Ex = SkaterCollideBail Scr = SkaterCollideBail Group = WalkingCollideEvents
		SetTags WalkingGroundTricksInactive
		Obj_SpawnScript ActivateGroundTricksDelay Id = ActivateGroundTricksDelay
		SetWalkingTrickState NewWalkingTrickState = UNSET
		if CurrentScorePotGreaterThan 0
			Obj_SpawnScript ComboRunOutTrickDisplayDelay Id = ComboRunOutTrickDisplayDelay
		endif
		WaitWalking
	endscript
	script SkateToRunState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Stand Scr = SkateToStandState Group = WalkingStateExceptions Params = {SyncToPreviousAnim}
		SetException Ex = Skid Scr = SkateToStandState Group = WalkingStateExceptions Params = {SyncToPreviousAnim}
		SetException Ex = RotateLeft Scr = SkateToRotateState Group = WalkingStateExceptions Params = {SyncToPreviousAnim}
		SetException Ex = RotateRight Scr = SkateToRotateState Group = WalkingStateExceptions Params = {SyncToPreviousAnim}
		SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions
		SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions
		SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = GROUND
		Walk_ScaleAnimSpeed Off
		if AnimEquals WRunToSkate
			RunSpeedChosenAnim Anims = [SkateToWalk SkateToWalk WSkateToRun WSkateToRun] Speeds = [1 1 1.29999995 1.29999995] BlendPeriod = 0.30000001 SyncToReversePreviousAnim NoSpeedUpdate <...>
		else
			RunSpeedChosenAnim Anims = [SkateToWalk SkateToWalk WSkateToRun WSkateToRun] Speeds = [1 1 1.29999995 1.29999995] BlendPeriod = 0.1 NoSpeedUpdate <...>
		endif
		Goto RunState
	endscript
	script SkateToStandState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Run Scr = SkateToRunState Group = WalkingStateExceptions Params = {SyncToPreviousAnim}
		SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions
		SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions
		SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = GROUND
		Walk_ScaleAnimSpeed Off
		if AnimEquals[SlowDownBrake NewBrakeIdle NewBrakeIdle3 NewBrakeIdle5 NewBrakeIdle6 NewBrakeIdle7 NewBrakeIdle8]
			PlayAnim Anim = BrakeToStand BlendPeriod = 0.30000001
		else
			if AnimEquals WRunToSkate
				PlayAnim Anim = SlowSkateToStand BlendPeriod = 0.30000001 SyncToReversePreviousAnim EffectivePreviousAnimDuration = 0.5 <...>
			else
				PlayAnim Anim = SlowSkateToStand BlendPeriod = 0.1 <...>
			endif
		endif
		WaitAnimWalking
		Goto StandState
	endscript
	script SkateToRotateState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Run Scr = SkateToRunState Group = WalkingStateExceptions Params = {SyncToPreviousAnim}
		SetException Ex = Stand Scr = SkateToStandState Group = WalkingStateExceptions Params = {SyncToPreviousAnim}
		SetException Ex = Skid Scr = SkateToStandState Group = WalkingStateExceptions Params = {SyncToPreviousAnim}
		SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions
		SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions
		SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = GROUND
		Walk_ScaleAnimSpeed Off
		if AnimEquals WRunToSkate
			PlayAnim Anim = SkateToWalk BlendPeriod = 0.30000001 SyncToReversePreviousAnim <...>
		else
			if AnimEquals SkateToRun
				PlayAnim Anim = SkateToRun BlendPeriod = 0.1 <...>
			else
				PlayAnim Anim = SkateToWalk BlendPeriod = 0.1 <...>
			endif
		endif
		WaitAnimWalking
		Goto RunState
	endscript
	script SkateToAirState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Land Scr = LandState Group = WalkingStateExceptions
		SetException Ex = Hang Scr = AirToHangState Group = WalkingStateExceptions
		SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions
		SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions
		SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = AIR
		Walk_ScaleAnimSpeed Off
		PlayAnim Anim = AirIdleToJumpAir BlendPeriod = 0.30000001
		WaitAnimWalking
		Goto AirState
	endscript
	script RunState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Stand Scr = StandState Group = WalkingStateExceptions
		if GotParam NoSkid
			SetException Ex = Skid Scr = StandState Group = WalkingStateExceptions
		else
			SetException Ex = Skid Scr = SkidState Group = WalkingStateExceptions
		endif
		SetException Ex = RotateLeft Scr = RunToRotateLeftState Group = WalkingStateExceptions Params = {SyncToPreviousAnim}
		SetException Ex = RotateRight Scr = RunToRotateRightState Group = WalkingStateExceptions Params = {SyncToPreviousAnim}
		SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions
		SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions
		SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
		SetException Ex = Ride Scr = StandToRideState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = GROUND
		CycleSpeedChosenAnim Anims = [WalkSlow WalkFast WRun FastRun] Speeds = [63.88000107 130.44000244 350 520] BlendPeriod = 0.1
	endscript
	script StandState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Run Scr = StandToRunState Group = WalkingStateExceptions
		SetException Ex = RotateLeft Scr = StandToRotateLeftState Group = WalkingStateExceptions
		SetException Ex = RotateRight Scr = StandToRotateRightState Group = WalkingStateExceptions
		SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = StandJumpState Group = WalkingStateExceptions
		SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions
		SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
		SetException Ex = Ride Scr = StandToRideState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = GROUND
		GetSpeed
		SetSpeed (0.44999999 * <Speed>)
		Walk_ScaleAnimSpeed Off
		if AnimEquals[_180RunSkid SkateToSkid]
			PlayWalkAnim Anim = WStand NoRestart BlendPeriod = 0.30000001
		else
			PlayWalkAnim Anim = WStand NoRestart BlendPeriod = 0.1
		endif
		WaitAnimWalking
		while
			PlayWalkAnim BlendPeriod = 0.1 Anim = Random(
				@*3 WStand
				@RandomNoRepeat(
					@WStandIdle1
					@WStandIdle2
					@WStandIdle3
					@WStandIdle4
					@WStandIdle5
					@WStandIdle6
				)
			)
			WaitAnimWalking
		repeat
	endscript
	script StandToRunState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Stand Scr = StandState Group = WalkingStateExceptions
		SetException Ex = Skid Scr = StandState Group = WalkingStateExceptions
		SetException Ex = RotateLeft Scr = RunToRotateLeftState Group = WalkingStateExceptions
		SetException Ex = RotateRight Scr = RunToRotateRightState Group = WalkingStateExceptions
		SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions
		SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions
		SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
		SetException Ex = Ride Scr = StandToRideState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = GROUND
		RunSpeedChosenAnim Anims = [WStandToWalk WStandToWalk WStandToRun WStandToRun] Speeds = [100 100 370 370] BlendPeriod = 0.1
		Goto RunState
	endscript
	script SkidState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Stand Scr = StandState Group = WalkingStateExceptions
		SetException Ex = Run Scr = RunState Group = WalkingStateExceptions
		SetException Ex = RotateLeft Scr = RunToRotateLeftState Group = WalkingStateExceptions
		SetException Ex = RotateRight Scr = RunToRotateRightState Group = WalkingStateExceptions
		SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions
		SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions
		SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
		SetException Ex = Ride Scr = StandToRideState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = GROUND
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = _180RunSkid NoRestart BlendPeriod = 0.1
		WaitAnimWalking
		Goto StandState
	endscript
	script StandToRotateLeftState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Stand Scr = StandState Group = WalkingStateExceptions
		SetException Ex = Run Scr = StandToRunState Group = WalkingStateExceptions
		SetException Ex = Skid Scr = SkidState Group = WalkingStateExceptions
		SetException Ex = RotateRight Scr = RunToRotateRightState Group = WalkingStateExceptions
		SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = StandJumpState Group = WalkingStateExceptions
		SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions
		SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
		SetException Ex = Ride Scr = StandToRideState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = GROUND
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = WStandToWalk BlendPeriod = 0.05
		WaitAnimWalking
		SetException Ex = Run Scr = RunState Group = WalkingStateExceptions Params = {SyncToPreviousAnim}
		PlayWalkAnim Anim = WalkFast Cycle NoRestart BlendPeriod = 0.1
		WaitWalking
	endscript
	script RunToRotateLeftState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Stand Scr = StandState Group = WalkingStateExceptions
		SetException Ex = Run Scr = RunState Group = WalkingStateExceptions Params = {SyncToPreviousAnim}
		SetException Ex = Skid Scr = SkidState Group = WalkingStateExceptions
		SetException Ex = RotateRight Scr = RunToRotateRightState Group = WalkingStateExceptions
		SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = StandJumpState Group = WalkingStateExceptions
		SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions
		SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
		SetException Ex = Ride Scr = StandToRideState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = GROUND
		Walk_ScaleAnimSpeed Off
		if AnimEquals WalkSlow
			PlayWalkAnim Anim = WalkSlow Cycle NoRestart BlendPeriod = 0.1 <...>
		else
			PlayWalkAnim Anim = WalkFast Cycle NoRestart BlendPeriod = 0.1 <...>
		endif
		WaitWalking
	endscript
	script StandToRotateRightState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Stand Scr = StandState Group = WalkingStateExceptions
		SetException Ex = Run Scr = StandToRunState Group = WalkingStateExceptions
		SetException Ex = Skid Scr = SkidState Group = WalkingStateExceptions
		SetException Ex = RotateLeft Scr = RunToRotateLeftState Group = WalkingStateExceptions
		SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = StandJumpState Group = WalkingStateExceptions
		SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions
		SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
		SetException Ex = Ride Scr = StandToRideState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = GROUND
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = WStandToWalk BlendPeriod = 0.05
		WaitAnimWalking
		SetException Ex = Run Scr = RunState Group = WalkingStateExceptions Params = {SyncToPreviousAnim}
		PlayWalkAnim Anim = WalkFast Cycle NoRestart BlendPeriod = 0.1
		WaitWalking
	endscript
	script RunToRotateRightState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Stand Scr = StandState Group = WalkingStateExceptions
		SetException Ex = Run Scr = RunState Group = WalkingStateExceptions Params = {SyncToPreviousAnim}
		SetException Ex = Skid Scr = SkidState Group = WalkingStateExceptions
		SetException Ex = RotateLeft Scr = RunToRotateLeftState Group = WalkingStateExceptions
		SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = StandJumpState Group = WalkingStateExceptions
		SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions
		SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
		SetException Ex = Ride Scr = StandToRideState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = GROUND
		Walk_ScaleAnimSpeed Off
		if AnimEquals WalkSlow
			PlayWalkAnim Anim = WalkSlow Cycle NoRestart BlendPeriod = 0.1 <...>
		else
			PlayWalkAnim Anim = WalkFast Cycle NoRestart BlendPeriod = 0.1 <...>
		endif
		WaitWalking
	endscript
	script GroundPunchState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions
		SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions
		SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
		SetException Ex = Ride Scr = StandToRideState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = GROUND
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = WalkingSlap BlendPeriod = 0.1 To = 25
		WaitAnimWalking
		Goto GroundOrAirWaitState
	endscript
	script AirPunchState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Land Scr = LandState Group = WalkingStateExceptions
		SetException Ex = Hang Scr = AirToHangState Group = WalkingStateExceptions
		SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions
		SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = AIR
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = WalkingSlap BlendPeriod = 0.1 To = 25
		WaitAnimWalking
		Goto GroundOrAirWaitState
	endscript
	script RunJumpState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Land Scr = LandState Group = WalkingStateExceptions
		SetException Ex = Hang Scr = AirToHangState Group = WalkingStateExceptions
		SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions
		SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = AIR
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = RunToJump BlendPeriod = 0.1
		WaitAnimWalking
		Goto AirState
	endscript
	script StandJumpState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Land Scr = LandState Group = WalkingStateExceptions
		SetException Ex = Hang Scr = AirToHangState Group = WalkingStateExceptions
		SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions
		SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = AIR
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = StandToJump BlendPeriod = 0.1
		WaitAnimWalking
		Goto AirState
	endscript
	script WallplantState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Land Scr = LandState Group = WalkingStateExceptions
		SetException Ex = Hang Scr = AirToHangState Group = WalkingStateExceptions
		SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions
		SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = AIR
		BroadcastEvent Type = SkaterWallplant
		if CurrentScorePotGreaterThan 0
			SetTrickName 'Wall Jump'
			SetTrickScore 100
			Display
		endif
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = RunToJump BlendPeriod = 0.1
		WaitAnimWalking
		Goto AirState
	endscript
	script AirState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Land Scr = LandState Group = WalkingStateExceptions
		SetException Ex = Hang Scr = AirToHangState Group = WalkingStateExceptions
		SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions
		SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = AIR
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = JumpAir Cycle NoRestart BlendPeriod = 0.1
		WaitWalking
	endscript
	script LandState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Stand Scr = StandLandState Group = WalkingStateExceptions
		SetException Ex = Run Scr = RunLandState Group = WalkingStateExceptions
		SetException Ex = Skid Scr = SkidState Group = WalkingStateExceptions
		SetException Ex = RotateLeft Scr = StandToRotateLeftState Group = WalkingStateExceptions
		SetException Ex = RotateRight Scr = StandToRotateRightState Group = WalkingStateExceptions
		SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions
		SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions
		SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = GROUND
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		WaitWalking
	endscript
	script StandLandState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Run Scr = RunState Group = WalkingStateExceptions
		SetException Ex = Skid Scr = SkidState Group = WalkingStateExceptions
		SetException Ex = RotateLeft Scr = StandToRotateLeftState Group = WalkingStateExceptions
		SetException Ex = RotateRight Scr = StandToRotateRightState Group = WalkingStateExceptions
		SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = StandJumpState Group = WalkingStateExceptions
		SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions
		SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = GROUND
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = JumpLandToStand BlendPeriod = 0.05
		WaitAnimWalking
		Goto StandState
	endscript
	script RunLandState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Stand Scr = StandState Group = WalkingStateExceptions
		SetException Ex = Skid Scr = SkidState Group = WalkingStateExceptions
		SetException Ex = RotateLeft Scr = RunToRotateLeftState Group = WalkingStateExceptions
		SetException Ex = RotateRight Scr = RunToRotateRightState Group = WalkingStateExceptions
		SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions
		SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions
		SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = GROUND
		RunSpeedChosenAnim Anims = [JumpLandToWalk JumpLandToWalk JumpLandToRun JumpLandToRun] Speeds = [1.5 1.5 1.75 1.75] BlendPeriod = 0.1 NoSpeedUpdate
		BlendPeriodOut 0.30000001
		WaitAnimWalking
		Goto RunState
	endscript
	script HangState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = HangMoveLeft Scr = HangMoveLeftState Group = WalkingStateExceptions
		SetException Ex = HangMoveRight Scr = HangMoveRightState Group = WalkingStateExceptions
		SetException Ex = AIR Scr = HangToAirState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = HangToAirState Group = WalkingStateExceptions
		SetException Ex = PullUpFromHang Scr = PullUpFromHangState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = Off
		LaunchStateChangeEvent State = Skater_InHang
		Walk_ScaleAnimSpeed Off
		if AnimEquals[JumpToSwingHang JumpToWallHang]
			WaitAnimWalking
		endif
		PlayWalkAnim Anim = HangIdle Cycle NoRestart BlendPeriod = 0.30000001
		WaitWalking
	endscript
	script AirToHangState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = HangMoveLeft Scr = HangMoveLeftState Group = WalkingStateExceptions
		SetException Ex = HangMoveRight Scr = HangMoveRightState Group = WalkingStateExceptions
		SetException Ex = AIR Scr = HangToAirState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = HangToAirState Group = WalkingStateExceptions
		SetException Ex = PullUpFromHang Scr = PullUpFromHangState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = Off
		LaunchStateChangeEvent State = Skater_InHang
		Walk_ScaleAnimSpeed Off
		Walk_GetHangInitAnimType
		switch <HangInitAnimType>
			case SWING
				PlayWalkAnim Anim = JumpToSwingHang BlendPeriod = 0
			case WALL
				PlayWalkAnim Anim = JumpToWallHang BlendPeriod = 0
		endswitch
		WaitAnimWalking
		Goto HangState
	endscript
	script PlayHangMoveAnimCycle
		BlendPeriodOut 0.30000001
		PreviousPartialAnimOverlay = UndeterminedOverlay
		while
			Walk_GetHangAngle
			if GotParam ReverseAngle
				HangAngle = (0 - <HangAngle>)
			endif
			if ((<HangAngle> < 5) && (<HangAngle> > -5))
				PartialAnimOverlay = NoOverlay
			else
				if (<HangAngle> > 0)
					if (<HangAngle> < 15)
						AppendSuffixToChecksum Base = <HangAnim> SuffixString = "10_Partial"
						PartialAnimOverlay = <appended_id>
					else
						if (<HangAngle> < 25)
							AppendSuffixToChecksum Base = <HangAnim> SuffixString = "20_Partial"
							PartialAnimOverlay = <appended_id>
						else
							if (<HangAngle> < 35)
								AppendSuffixToChecksum Base = <HangAnim> SuffixString = "30_Partial"
								PartialAnimOverlay = <appended_id>
							else
								AppendSuffixToChecksum Base = <HangAnim> SuffixString = "40_Partial"
								PartialAnimOverlay = <appended_id>
							endif
						endif
					endif
				else
					if (<HangAngle> > -15)
						AppendSuffixToChecksum Base = <HangAnim> SuffixString = "10_PartialUp"
						PartialAnimOverlay = <appended_id>
					else
						if (<HangAngle> > -25)
							AppendSuffixToChecksum Base = <HangAnim> SuffixString = "20_PartialUp"
							PartialAnimOverlay = <appended_id>
						else
							if (<HangAngle> > -35)
								AppendSuffixToChecksum Base = <HangAnim> SuffixString = "30_PartialUp"
								PartialAnimOverlay = <appended_id>
							else
								AppendSuffixToChecksum Base = <HangAnim> SuffixString = "40_PartialUp"
								PartialAnimOverlay = <appended_id>
							endif
						endif
					endif
				endif
			endif
			if NOT (<PreviousPartialAnimOverlay> = <PartialAnimOverlay>)
				if (<PartialAnimOverlay> = NoOverlay)
					PlayAnim Anim = <HangAnim> Cycle <SyncToPreviousAnim> BlendPeriod = 0.1
				else
					PlayAnim Anim = <HangAnim> PartialAnimOverlay = <PartialAnimOverlay> Cycle <SyncToPreviousAnim> BlendPeriod = 0.1
				endif
			endif
			PreviousPartialAnimOverlay = <PartialAnimOverlay>
			SyncToPreviousAnim = SyncToPreviousAnim
			DoNextManualTrick ScriptToRunFirst = BeginWalkingManualTrick FromWalk
			DoNextTrick ScriptToRunFirst = BeginWalkingGenericTrick
			Wait 1 GameFrame
		repeat
	endscript
	script HangMoveLeftState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Hang Scr = HangState Group = WalkingStateExceptions
		SetException Ex = HangMoveRight Scr = HangMoveRightState Group = WalkingStateExceptions
		SetException Ex = AIR Scr = HangToAirState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = HangToAirState Group = WalkingStateExceptions
		SetException Ex = PullUpFromHang Scr = PullUpFromHangState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = Off
		LaunchStateChangeEvent State = Skater_InHang
		Walk_ScaleAnimSpeed HangMove
		if Flipped
			PlayHangMoveAnimCycle HangAnim = HangLeft ReverseAngle
		else
			PlayHangMoveAnimCycle HangAnim = HangRight ReverseAngle
		endif
	endscript
	script HangMoveRightState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Hang Scr = HangState Group = WalkingStateExceptions
		SetException Ex = HangMoveLeft Scr = HangMoveLeftState Group = WalkingStateExceptions
		SetException Ex = AIR Scr = HangToAirState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = HangToAirState Group = WalkingStateExceptions
		SetException Ex = PullUpFromHang Scr = PullUpFromHangState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = Off
		LaunchStateChangeEvent State = Skater_InHang
		Walk_ScaleAnimSpeed HangMove
		if Flipped
			PlayHangMoveAnimCycle HangAnim = HangRight
		else
			PlayHangMoveAnimCycle HangAnim = HangLeft
		endif
	endscript
	script HangToAirState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Land Scr = LandState Group = WalkingStateExceptions
		SetException Ex = Hang Scr = AirToHangState Group = WalkingStateExceptions
		SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions
		SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions
		ClearException JumpRequested
		SetWalkingTrickState NewWalkingTrickState = AIR
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = HangIdleToDrop BlendPeriod = 0.05
		WaitAnimWalking
		Goto AirState
	endscript
	script PullUpFromHangState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Jump Scr = AirState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = Off
		LaunchStateChangeEvent State = Skater_InHang
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = HangOnToTheTop BlendPeriod = 0.05 Speed = (walk_parameters.hang_anim_wait_speed)
		WaitAnimWalking
		Walk_AnimWaitComplete
		PlayWalkAnim Anim = WStand Cycle BlendPeriod = 0.30000001
		Goto GroundOrAirWaitState
	endscript
	script DropToHangState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Jump Scr = AirState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = Off
		LaunchStateChangeEvent State = Skater_InHang
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = StandToHang BlendPeriod = 0.30000001 Speed = (walk_parameters.hang_anim_wait_speed)
		WaitAnimWalking
		Walk_AnimWaitComplete
		Goto HangState
	endscript
	script LadderOntoBottomState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Jump Scr = AirState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = Off
		LaunchStateChangeEvent State = Skater_OnLadder
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = LadderClimbFromStandIdle BlendPeriod = 0.30000001 Speed = (walk_parameters.ladder_anim_wait_speed)
		WaitAnimWalking
		Walk_AnimWaitComplete
		Goto LadderMoveUpState
	endscript
	script LadderOntoTopState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Jump Scr = AirState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = Off
		LaunchStateChangeEvent State = Skater_OnLadder
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = LadderOntoTheTop Backwards BlendPeriod = 0.30000001 Speed = (walk_parameters.ladder_anim_wait_speed)
		WaitAnimWalking
		Walk_AnimWaitComplete
		Goto LadderMoveDownState
	endscript
	script LadderMoveUpState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = LadderMoveDown Scr = LadderMoveDownState Group = WalkingStateExceptions Params = {SyncToPreviousAnim}
		SetException Ex = LadderOffBottom Scr = LadderOffBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOffTop Scr = LadderOffTopState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = AirState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = Off
		LaunchStateChangeEvent State = Skater_OnLadder
		Walk_ScaleAnimSpeed LadderMove
		PlayWalkAnim Anim = LadderFastClimb Cycle BlendPeriod = 0.30000001 <...>
		WaitAnimWalking
	endscript
	script LadderMoveDownState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = LadderMoveUp Scr = LadderMoveUpState Group = WalkingStateExceptions Params = {SyncToPreviousAnim}
		SetException Ex = LadderOffBottom Scr = LadderOffBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOffTop Scr = LadderOffTopState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = AirState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = Off
		LaunchStateChangeEvent State = Skater_OnLadder
		Walk_ScaleAnimSpeed LadderMove
		PlayWalkAnim Anim = LadderFastClimb Cycle Backwards BlendPeriod = 0.30000001 <...>
		WaitAnimWalking
	endscript
	script LadderOffBottomState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Jump Scr = AirState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = Off
		LaunchStateChangeEvent State = Skater_OnLadder
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = LadderClimbFromStandIdle Backwards BlendPeriod = 0.30000001 Speed = (walk_parameters.ladder_anim_wait_speed)
		WaitAnimWalking
		Walk_AnimWaitComplete
		PlayWalkAnim Anim = WStand Cycle BlendPeriod = 0.30000001
		Goto GroundOrAirWaitState
	endscript
	script LadderOffTopState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Jump Scr = AirState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = Off
		LaunchStateChangeEvent State = Skater_OnLadder
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = LadderOntoTheTop BlendPeriod = 0.30000001 Speed = (walk_parameters.ladder_anim_wait_speed)
		WaitAnimWalking
		Walk_AnimWaitComplete
		PlayWalkAnim Anim = WStand Cycle BlendPeriod = 0.30000001
		Goto GroundOrAirWaitState
	endscript
	script WalkBailState
		ClearExceptionGroup WalkingStateExceptions
		BailSkaterTricks
		DisablePlayerInput AllowCameraControl
		InBail
		Obj_SpawnScript BailBoardControl Params = {BoardOffFrame = 10 BoardVel = (0.0,0.0,200.0) BoardRotVel = (0.0,0.0,0.0) BoardSkaterVel = 1}
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = WalkingBail
		WaitAnimWalking
		PlayWalkAnim Anim = WalkingBail PingPong From = End To = 100 Speed = 0.80000001 BlendPeriod = 0.1
		WaitForEvent Type = Stand
		BashOn
		PlayWalkAnim Anim = WalkingBailGetUp
		WaitAnimWalking
		SwitchOnBoard
		BailDone
		Goto StandState
	endscript
	script GroundOrAirWaitState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Run Scr = RunState Group = WalkingStateExceptions
		SetException Ex = Stand Scr = StandState Group = WalkingStateExceptions
		SetException Ex = Skid Scr = SkidState Group = WalkingStateExceptions
		SetException Ex = RotateLeft Scr = StandToRotateLeftState Group = WalkingStateExceptions
		SetException Ex = RotateRight Scr = StandToRotateRightState Group = WalkingStateExceptions
		SetException Ex = Hang Scr = AirToHangState Group = WalkingStateExceptions
		SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions
		SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
		SetException Ex = Land Scr = LandState Group = WalkingStateExceptions
		SetException Ex = AIR Scr = AirState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = StandJumpState Group = WalkingStateExceptions
		SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions
		SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
		SetException Ex = Rail Scr = WalkingToRailTrick Group = WalkingStateExceptions
		SetException Ex = AcidDrop Scr = WalkingAirToTransitionTrick Group = WalkingTransitionTrickExceptions
		SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions
		WaitWalking
	endscript
	script StandToRideState
		ClearAllWalkingExceptions
		Goto RideState
	endscript
	script RideState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Stand Scr = RideToStandState Group = WalkingStateExceptions
		while
			Wait 1 GameFrame
		repeat
	endscript
	script RideToStandState
		ClearExceptionGroup WalkingStateExceptions
		Goto StandState
	endscript
	script CameraFlushButton
		GetCameraId
		<CameraId>::WalkCamera_FlushRequest
	endscript
	script JumpButton
		LaunchEvent Type = JumpRequested
	endscript
	script JumpRequestedEvent
		ClearEventHandler JumpRequested
		Walk_GetState
		switch <State>
			case WALKING_GROUND
				Walk_Jump
				LaunchEvent Type = Jump
			case WALKING_AIR
				Walk_GetStateTime
				if (<StateTime> < Skater_Late_Jump_Slop)
					Walk_Jump
					LaunchEvent Type = Jump
				endif
			case WALKING_HANG
				Walk_GetStateDuration
				if (<StateDuration> > 0.5)
					Walk_Jump
					LaunchEvent Type = Jump
				else
					Walk_GetPreviousState
					if NOT (<PreviousState> = WALKING_AIR)
						Walk_Jump
						LaunchEvent Type = Jump
					else
						SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
					endif
				endif
			case WALKING_LADDER
				Walk_Jump
				LaunchEvent Type = Jump
			case WALKING_ANIMWAIT
				Walk_Jump
				LaunchEvent Type = Jump
		endswitch
	endscript
	script TakeBoardFromSkater
		SetBoardMissing
		SwitchOffBoard
	endscript
	script ReturnBoardToSkater
		UnsetBoardMissing
		if Walking
			GetTags
			switch <WalkingTricksState>
				case GROUND
					SetWalkingGroundTricks
				case AIR
					SetWalkingAirTricks
				case Off
					SetWalkingOffTricks
			endswitch
		endif
		SwitchOnBoard
		RemoveAnimController Id = BoardMissingPartialAnimOverlay
	endscript
