	number_of_console_lines = 6
	script create_console
		if NOT ObjectExists id = console_message_vmenu
			SetScreenElementLock id = root_window off
			if LevelIs load_skateshop
				pos = (50.0,240.0)
			else
				pos = (20.0,265.0)
			endif
			CreateScreenElement {
				type = VMenu
				parent = root_window
				id = console_message_vmenu
				padding_scale = 0.64999998
				font = dialog
				just = [left top]
				internal_just = [left center]
				pos = <pos>
				z_priority = 0
			}
		endif
	endscript
	script create_console_message text = "Default console message" rgba = [113 121 127 80]
		if NOT GetGlobalFlag flag = NO_DISPLAY_CHATWINDOW
			if NOT ObjectExists id = console_message_vmenu
				create_console
			endif
			SetScreenElementLock id = console_message_vmenu off
			if ScreenElementExists id = {console_message_vmenu child = (number_of_console_lines - 1)}
				DestroyScreenElement id = {console_message_vmenu child = 0}
			endif
			if LevelIs load_skateshop
				dims = (750.0,10.0)
				pos = (50.0,240.0)
				change number_of_console_lines = 7
				max_chat_height = 150
			else
				dims = (750.0,10.0)
				pos = (20.0,265.0)
				change number_of_console_lines = 6
				max_chat_height = 96
			endif
			if GotParam join
				rgba = [0 80 0 80]
			else
				if GotParam left
					rgba = [80 0 0 80]
				endif
			endif
			SetScreenElementProps id = console_message_vmenu pos = <pos>
			CreateScreenElement {
				type = TextBlockElement
				parent = console_message_vmenu
				font = dialog
				text = <text>
				internal_just = [left top]
				rgba = <rgba>
				scale = 0.80000001
				not_focusable
				dims = <dims>
				allow_expansion
				z_priority = 5
			}
			while
				total_height = 0
				index = number_of_console_lines
				while
					if ScreenElementExists id = {console_message_vmenu child = (number_of_console_lines - <index>)}
						GetScreenElementDims id = {console_message_vmenu child = (number_of_console_lines - <index>)}
						<total_height> = (<total_height> + <height>)
						<index> = (<index> - 1)
					else
						break
					endif
				repeat
				if (<total_height> > <max_chat_height>)
					DestroyScreenElement id = {console_message_vmenu child = 0}
				else
					break
				endif
			repeat
			if GotParam wait_and_die
				RunScriptOnScreenElement id = <id> console_message_wait_and_die params = {time = <time>}
				return
			endif
			if NOT LevelIs load_skateshop
				if NOT GotParam dont_die
					RunScriptOnScreenElement id = <id> console_message_wait_and_die
				endif
			endif
		endif
	endscript
	script hide_console_window
		if ObjectExists id = console_message_vmenu
			DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0
		endif
	endscript
	script unhide_console_window
		if ObjectExists id = console_message_vmenu
			DoScreenElementMorph id = console_message_vmenu time = 0 scale = 1
		endif
	endscript
	script console_left_justify
		if ObjectExists id = console_message_vmenu
			SetScreenElementLock id = console_message_vmenu off
			SetScreenElementProps {
				id = console_message_vmenu
				just = [left top]
				internal_just = [left center]
			}
			SetScreenElementProps {
				id = console_message_vmenu
				pos = (20.0,265.0)
			}
		endif
	endscript
	script console_right_justify
		if ObjectExists id = console_message_vmenu
			SetScreenElementLock id = console_message_vmenu off
			SetScreenElementProps {
				id = console_message_vmenu
				just = [right top]
				internal_just = [right center]
			}
			SetScreenElementProps {
				id = console_message_vmenu
				pos = (620.0,265.0)
			}
		endif
	endscript
	script console_hide
		if ObjectExists id = console_message_vmenu
			RunScriptOnScreenElement id = console_message_vmenu console_hide2
		endif
	endscript
	script console_hide2
		DoMorph scale = 0
	endscript
	script console_unhide
		if ObjectExists id = console_message_vmenu
			RunScriptOnScreenElement id = console_message_vmenu console_unhide2
		endif
	endscript
	script console_unhide2
		DoMorph scale = 1
	endscript
	script console_clear
		if ScreenElementExists id = console_message_vmenu
			DestroyScreenElement id = console_message_vmenu preserve_parent
		endif
	endscript
	script console_destroy
		if ObjectExists id = console_message_vmenu
			DestroyScreenElement id = console_message_vmenu
		endif
	endscript
	script console_message_wait_and_die time = 30
		wait <time> seconds
		DoMorph time = 0.5 alpha = 0
		Die
	endscript
