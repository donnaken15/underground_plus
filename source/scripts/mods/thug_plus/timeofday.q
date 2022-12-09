
	FakeLights_Night_on = 0
	FakeLights_Evening_on = 0
	Headlights_on = 0
	Fog_on = 0
	Rain_on = 0
	Snow_on = 0
	tod_skaterlights = tod_skaterlights_day
	script set_tod_morning
		change current_tod = morning
		change tod_skaterlights = tod_skaterlights_morning
		change lev_red = 64
		change lev_green = 77
		change lev_blue = 81
		change sky_red = 64
		change sky_green = 77
		change sky_blue = 81
		change FakeLights_Night_on = 0
		change FakeLights_Evening_on = 0
		change Headlights_on = 0
		change Fog_on = 1
		change fog_red = 85
		change fog_green = 100
		change fog_blue = 105
		change fog_alpha = 108
		change fog_dist = 350
		change Rain_on = 0
		change Snow_on = 0
	endscript
	tod_skaterlights_morning =
	{
		ambient_red = 41
		ambient_green = 42
		ambient_blue = 45
		ambient_mod_factor = 0.18000001
		heading_0 = 188
		pitch_0 = 351
		red_0 = 16
		green_0 = 19
		blue_0 = 29
		mod_factor_0 = 0.12
		heading_1 = 0
		pitch_1 = 0
		red_1 = 34
		green_1 = 42
		blue_1 = 49
		mod_factor_1 = 0.1
	}
	script set_tod_evening
		change current_tod = evening
		change tod_skaterlights = tod_skaterlights_evening
		change lev_red = 100
		change lev_green = 95
		change lev_blue = 74
		Fog_on = 1
		change fog_red = 100
		change fog_green = 86
		change fog_blue = 29
		change fog_alpha = 30
		change fog_dist = 960.0
		change sky_red = 76
		change sky_green = 66
		change sky_blue = 50
		change FakeLights_Night_on = 0
		change FakeLights_Evening_on = 1
		change Headlights_on = 1
	endscript
	tod_skaterlights_evening =
	{
		ambient_red = 39
		ambient_green = 38
		ambient_blue = 32
		ambient_mod_factor = 0.30000001
		heading_0 = 50.0
		pitch_0 = 330
		red_0 = 104
		green_0 = 101
		blue_0 = 60
		mod_factor_0 = 0.75
		heading_1 = 240
		pitch_1 = 330
		red_1 = 45
		green_1 = 42
		blue_1 = 38
		mod_factor_1 = 0.40000001
	}
	script set_tod_night
		change current_tod = night
		change tod_skaterlights = tod_skaterlights_night
		change lev_red = 50
		change lev_green = 65
		change lev_blue = 75
		change Fog_on = 1
		change fog_red = 5
		change fog_green = 16
		change fog_blue = 22
		change fog_alpha = 63
		change fog_dist = 513
		change sky_red = 18
		change sky_green = 22
		change sky_blue = 24
		change FakeLights_Night_on = 1
		change FakeLights_Evening_on = 0
		change Headlights_on = 1
	endscript
	tod_skaterlights_night =
	{
		ambient_red = 26
		ambient_green = 36
		ambient_blue = 40
		ambient_mod_factor = 0.30000001
		heading_0 = 330.0
		pitch_0 = 330
		red_0 = 70
		green_0 = 100
		blue_0 = 106
		mod_factor_0 = 0.80000001
		heading_1 = 151
		pitch_1 = 330
		red_1 = 15
		green_1 = 30
		blue_1 = 30
		mod_factor_1 = 0.1
	}
	script set_tod_nj_fog
		change current_tod = day
		change tod_skaterlights = tod_skaterlights_fog_nj
		change lev_red = 85
		change lev_green = 95
		change lev_blue = 98
		change Fog_on = 0
		change fog_red = 50
		change fog_green = 61
		change fog_blue = 61
		change fog_alpha = 100
		change fog_dist = 471.5
		change sky_red = 40
		change sky_green = 47
		change sky_blue = 45
		change Rain_on = 1
		change rain_rate = 12
		change rain_frames = 26
		change rain_height = 1050
		change rain_length = 93
		change rain_blend = 5
		change rain_fixed = 13
		change rain_red = 185
		change rain_green = 180
		change rain_blue = 185
		change rain_alpha = 245
		change rain_red2 = 130
		change rain_green2 = 140
		change rain_blue2 = 90
		change rain_alpha2 = 255
		change splash_rate = 0.94999999
		change splash_life = 8
		change splash_size = 2
		change splash_blend = 1
		change splash_fixed = 34
		change splash_red = 244
		change splash_green = 246
		change splash_blue = 247
		change splash_alpha = 46
		change Snow_on = 0
		change FakeLights_Night_on = 0
		change FakeLights_Evening_on = 0
		change Headlights_on = 0
	endscript
	tod_skaterlights_fog_nj =
	{
		ambient_red = 33
		ambient_green = 40
		ambient_blue = 54
		ambient_mod_factor = 0.30000001
		heading_0 = 50
		pitch_0 = 330
		red_0 = 130
		green_0 = 120
		blue_0 = 97
		mod_factor_0 = 1.39999998
		heading_1 = 240
		pitch_1 = 330
		red_1 = 58
		green_1 = 62
		blue_1 = 66
		mod_factor_1 = 0.40000001
	}
	script set_tod_nightvision
		change current_tod = nightvision
		change tod_skaterlights = tod_skaterlights_nightvision
		change lev_red = 0
		change lev_green = 180
		change lev_blue = 0
		change Fog_on = 1
		change fog_red = 0
		change fog_green = 0
		change fog_blue = 0
		change fog_alpha = 63
		change fog_dist = 513
		change sky_red = 0
		change sky_green = 0
		change sky_blue = 0
		change FakeLights_Night_on = 0
		change FakeLights_Evening_on = 0
		change Headlights_on = 1
	endscript
	tod_skaterlights_nightvision =
	{
		ambient_red = 0
		ambient_green = 180
		ambient_blue = 0
		ambient_mod_factor = 0.5
		heading_0 = 310
		pitch_0 = 335
		red_0 = 0
		green_0 = 47
		blue_0 = 0
		mod_factor_0 = 0.80000001
		heading_1 = 140
		pitch_1 = 344
		red_1 = 0
		green_1 = 22
		blue_1 = 0
		mod_factor_1 = 0.80000001
	}
	script set_tod_SCJ_Cutscene
		change current_tod = SCJ_Cutscene
		change tod_skaterlights = tod_skaterlights_SCJ_Cutscene
		change lev_red = 46
		change lev_green = 38
		change lev_blue = 34
		change Fog_on = 0
		change Rain_on = 0
	endscript
	tod_skaterlights_SCJ_Cutscene = {
		ambient_red = 26
		ambient_green = 26
		ambient_blue = 30
		ambient_mod_factor = 0
		heading_0 = 220
		pitch_0 = 320
		red_0 = 100
		green_0 = 70
		blue_0 = 60
		mod_factor_0 = 0
		heading_1 = 120
		pitch_1 = 320
		red_1 = 15
		green_1 = 10
		blue_1 = 10
		mod_factor_1 = 0
	}
	script set_tod_KISS
		change current_tod = KISS
		change tod_skaterlights = tod_skaterlights_kiss
		change lev_red = 87
		change lev_green = 82
		change lev_blue = 92
		change Fog_on = 1
		change fog_red = 87
		change fog_green = 82
		change fog_blue = 92
		change fog_alpha = 63
		change fog_dist = 1000
		change sky_red = 73
		change sky_green = 67
		change sky_blue = 95
		change FakeLights_Night_on = 0
		change FakeLights_Evening_on = 0
		change Headlights_on = 1
	endscript
	tod_skaterlights_kiss =
	{
		ambient_red = 40
		ambient_green = 36
		ambient_blue = 43
		ambient_mod_factor = 0
		heading_0 = 190
		pitch_0 = 310
		red_0 = 30
		green_0 = 20
		blue_0 = 30
		mod_factor_0 = 0.03
		heading_1 = 40
		pitch_1 = 350
		red_1 = 51
		green_1 = 31
		blue_1 = 19
		mod_factor_1 = 0
	}
	script set_tod_nj_morning
		change current_tod = nj_morning
		change tod_skaterlights = tod_skaterlights_nj_morning
		change lev_red = 64
		change lev_green = 67
		change lev_blue = 81
		change sky_red = 50
		change sky_green = 58
		change sky_blue = 58
		change Fog_on = 1
		change fog_red = 85
		change fog_green = 100
		change fog_blue = 105
		change fog_alpha = 70
		change fog_dist = 385
		change FakeLights_Night_on = 0
		change FakeLights_Evening_on = 0
		change Headlights_on = 0
	endscript
	tod_skaterlights_nj_morning =
	{
		ambient_red = 51
		ambient_green = 52
		ambient_blue = 55
		ambient_mod_factor = 0
		heading_0 = 20
		pitch_0 = 120
		red_0 = 16
		green_0 = 19
		blue_0 = 29
		mod_factor_0 = 0.1
		heading_1 = 50
		pitch_1 = 320
		red_1 = 44
		green_1 = 42
		blue_1 = 79
		mod_factor_1 = 0.5
	}
	script set_tod_nj_evening
		change current_tod = nj_evening
		change tod_skaterlights = tod_skaterlights_nj_evening
		change lev_red = 102
		change lev_green = 82
		change lev_blue = 64
		change sky_red = 58
		change sky_green = 48
		change sky_blue = 38
		change Fog_on = 1
		change fog_red = 70
		change fog_green = 50
		change fog_blue = 40
		change fog_alpha = 70
		change fog_dist = 491
		change FakeLights_Night_on = 0
		change FakeLights_Evening_on = 0
		change Headlights_on = 0
	endscript
	tod_skaterlights_nj_evening =
	{
		ambient_red = 61
		ambient_green = 56
		ambient_blue = 49
		ambient_mod_factor = 0.60000002
		heading_0 = 320
		pitch_0 = 170
		red_0 = 50
		green_0 = 50
		blue_0 = 40
		mod_factor_0 = 0.30000001
		heading_1 = 50
		pitch_1 = 330
		red_1 = 70
		green_1 = 50
		blue_1 = 28
		mod_factor_1 = 0.5
	}
	script set_tod_nj_night
		change current_tod = nj_night
		change tod_skaterlights = tod_skaterlights_nj_night
		change lev_red = 50
		change lev_green = 65
		change lev_blue = 75
		change sky_red = 21
		change sky_green = 25
		change sky_blue = 26
		change Fog_on = 0
		change fog_red = 5
		change fog_green = 16
		change fog_blue = 22
		change fog_alpha = 63
		change fog_dist = 513
		change FakeLights_Night_on = 1
		change FakeLights_Evening_on = 0
		change Headlights_on = 1
		change Rain_on = 1
	endscript
	tod_skaterlights_nj_night =
	{
		ambient_red = 26
		ambient_green = 36
		ambient_blue = 40
		ambient_mod_factor = 0.30000001
		heading_0 = 50
		pitch_0 = 330
		red_0 = 70
		green_0 = 100
		blue_0 = 106
		mod_factor_0 = 1.39999998
		heading_1 = 240
		pitch_1 = 330
		red_1 = 15
		green_1 = 30
		blue_1 = 30
		mod_factor_1 = 0.40000001
	}
	script set_tod_startup
		printf "##### SETTING LEVEL BACK TO DEFAULT, STARTUP TOD"
		change current_tod = day
		change tod_skaterlights = tod_skaterlights_day
		change lev_red = 128
		change lev_green = 128
		change lev_blue = 128
		change FakeLights_Night_on = 0
		change FakeLights_Evening_on = 0
		change Headlights_on = 0
		change sky_red = 128
		change sky_green = 128
		change sky_blue = 128
		change Rain_on = 0
		change Snow_on = 0
		change splash_rate = 0
		Get_fog_values_levelsq
		return TurnOn_SkaterLevelLights = 1
	endscript
	script set_tod_day
		set_tod_rainoff
		change current_tod = day
		change tod_skaterlights = tod_skaterlights_day
		change lev_red = 128
		change lev_green = 128
		change lev_blue = 128
		change FakeLights_Night_on = 0
		change FakeLights_Evening_on = 0
		change Headlights_on = 0
		change sky_red = 128
		change sky_green = 128
		change sky_blue = 128
		change Snow_on = 0
		change Rain_on = 0
		Get_fog_values_levelsq
	endscript
	tod_skaterlights_day =
	{
		ambient_red = 50
		ambient_green = 50
		ambient_blue = 50
		ambient_mod_factor = 0.30000001
		heading_0 = 60
		pitch_0 = 330
		red_0 = 136
		green_0 = 120
		blue_0 = 110
		mod_factor_0 = 0.75
		heading_1 = 245
		pitch_1 = 330
		red_1 = 72
		green_1 = 70
		blue_1 = 66
		mod_factor_1 = 0.75
	}
	script Get_fog_values_levelsq
		GetCurrentLevel
		level_struct = <level_structure>
		if StructureContains structure = <level_struct> fog_red
			fog_red = (<level_struct>.fog_red)
			fog_blue = (<level_struct>.fog_blue)
			fog_green = (<level_struct>.fog_green)
			fog_alpha = (<level_struct>.fog_alpha)
			fog_dist = (<level_struct>.fog_dist)
			Set_fog_from_levelsq <...>
		endif
	endscript
	script Set_fog_from_levelsq
		if NOT (<fog_alpha> = 0)
			change Fog_on = 1
			change fog_red = <fog_red>
			change fog_blue = <fog_blue>
			change fog_green = <fog_green>
			change fog_alpha = <fog_alpha>
			change fog_dist = <fog_dist>
		else
			change Fog_on = 0
			change fog_alpha = 0
			change fog_dist = 1000
		endif
	endscript
	script Get_Skaterlight_direction_levelsq level_struct = level_nj heading_0 = 50 pitch_0 = 330 heading_1 = 240 pitch_1 = 330
		GetCurrentLevel
		level_struct = <level_structure>
		heading_0 = (<level_struct>.heading_0)
		pitch_0 = (<level_struct>.pitch_0)
		heading_1 = (<level_struct>.heading_1)
		pitch_1 = (<level_struct>.pitch_1)
		return heading_0 = <heading_0> pitch_0 = <pitch_0> heading_1 = <heading_1> pitch_1 = <pitch_1>
	endscript
	script set_tod_vc_evening
		change current_tod = evening
		change tod_skaterlights = tod_skaterlights_vc_evening
		change lev_red = 115
		change lev_green = 105
		change lev_blue = 85
		change Fog_on = 1
		change fog_red = 82
		change fog_green = 78
		change fog_blue = 63
		change fog_alpha = 72
		change fog_dist = 856.0
		change sky_red = 88
		change sky_green = 78
		change sky_blue = 74
		change Rain_on = 1
		change rain_rate = 9
		change rain_frames = 34
		change rain_height = 1759
		change rain_length = 89
		change rain_blend = 9
		change rain_fixed = 20
		change rain_red = 0
		change rain_green = 0
		change rain_blue = 0
		change rain_alpha = 0
		change rain_red2 = 0
		change rain_green2 = 0
		change rain_blue2 = 0
		change rain_alpha2 = 0
		change splash_rate = 1.0
		change splash_life = 5
		change splash_size = 3
		change splash_blend = 1
		change splash_fixed = 37
		change splash_red = 255
		change splash_green = 255
		change splash_blue = 255
		change splash_alpha = 255
		change FakeLights_Night_on = 0
		change FakeLights_Evening_on = 1
		change Headlights_on = 0
	endscript
	tod_skaterlights_vc_evening =
	{
		ambient_red = 50
		ambient_green = 50
		ambient_blue = 44
		ambient_mod_factor = 0.61000001
		heading_0 = 171.0
		pitch_0 = 300
		red_0 = 60
		green_0 = 53
		blue_0 = 39
		mod_factor_0 = 0.60000002
		heading_1 = 335
		pitch_1 = 304
		red_1 = 44
		green_1 = 46
		blue_1 = 50
		mod_factor_1 = 0.1
	}
	script set_tod_ru_day
		set_tod_day
		change Snow_on = 0
		change Fog_on = 1
		change fog_red = 140
		change fog_green = 135
		change fog_blue = 135
		change fog_alpha = 50
		change fog_dist = 500.0
	endscript
	script set_tod_ru_day_snow
		set_tod_day
		change Fog_on = 1
		change fog_red = 140
		change fog_green = 140
		change fog_blue = 140
		change fog_alpha = 122
		change fog_dist = 500.0
		change Snow_on = 1
		change snow_rate = 5
		change snow_frames = 194
		change snow_height = 464
		change snow_size = 3
		change snow_blend = 6
		change snow_fixed = 24
		change snow_red = 128
		change snow_green = 128
		change snow_blue = 128
		change snow_alpha = 128
	endscript
	script set_tod_ru_night
		set_tod_night
		change sky_red = 11
		change sky_green = 24
		change sky_blue = 25
		change Snow_on = 0
		change Fog_on = 1
		change fog_red = 6
		change fog_green = 20
		change fog_blue = 22
		change fog_alpha = 63
		change fog_dist = 513
	endscript
	script set_tod_ru_night_snow
		set_tod_ru_night
		Fog_on = 1
		change fog_red = 26
		change fog_green = 43
		change fog_blue = 48
		change fog_alpha = 125
		change fog_dist = 500.0
		change Snow_on = 1
		change snow_rate = 4
		change snow_frames = 155
		change snow_height = 464
		change snow_size = 3
		change snow_blend = 6
		change snow_fixed = 22
		change snow_red = 128
		change snow_green = 128
		change snow_blue = 128
		change snow_alpha = 128
	endscript
	script set_tod_scj
		change current_tod = scj
		change tod_skaterlights = tod_skaterlights_scj
		change lev_red = 99
		change lev_green = 99
		change lev_blue = 99
		change FakeLights_Night_on = 1
		change FakeLights_Evening_on = 0
		change sky_red = 111
		change sky_green = 60
		change sky_blue = 38
		change Fog_on = 1
		change fog_red = 27
		change fog_green = 19
		change fog_blue = 23
		change fog_alpha = 70
		change fog_dist = 705
	endscript
	tod_skaterlights_scj =
	{
		ambient_red = 58
		ambient_green = 57
		ambient_blue = 59
		ambient_mod_factor = 0.75
		heading_0 = 351
		pitch_0 = 303
		red_0 = 80
		green_0 = 63
		blue_0 = 59
		mod_factor_0 = 1.25999999
		heading_1 = 314
		pitch_1 = 272
		red_1 = 47
		green_1 = 50
		blue_1 = 52
		mod_factor_1 = 0.46000001
	}
	script set_tod_newrain
		change Rain_on = 1
		change Snow_on = 0
		change rain_rate = 16
		change rain_frames = 22
		change rain_height = 1986
		change rain_length = 74
		change rain_blend = 9
		change rain_fixed = 80
		change rain_red = 5
		change rain_green = 5
		change rain_blue = 0
		change rain_alpha = 0
		change rain_red2 = 55
		change rain_green2 = 55
		change rain_blue2 = 55
		change rain_alpha2 = 45
		change splash_rate = 1.0
		change splash_life = 18
		change splash_size = 3
		change splash_blend = 1
		change splash_fixed = 64
		change splash_red = 85
		change splash_green = 85
		change splash_blue = 85
		change splash_alpha = 125
	endscript
	script set_tod_rainoff
		change Rain_on = 0
		change Snow_on = 0
		change splash_rate = 0
	endscript
	script set_tod_snow
		change Rain_on = 0
		change Fog_on = 1
		change fog_red = 70
		change fog_green = 70
		change fog_blue = 70
		change fog_alpha = 120
		change fog_dist = 555.0
		change Snow_on = 1
		change snow_rate = 5
		change snow_frames = 194
		change snow_height = 464
		change snow_size = 3
		change snow_blend = 6
		change snow_fixed = 24
		change snow_red = 128
		change snow_green = 128
		change snow_blue = 128
		change snow_alpha = 128
	endscript
	script launch_timeofday_menu
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		make_new_menu {
			menu_id = timeofday_menu
			vmenu_id = timeofday_vmenu
			menu_title = "TIME OF DAY"
			type = VScrollingMenu
			dims = (200.0,200.0)
			padding_scale = 1.10000002
			pos = (210.0,50.0)
		}
		SetScreenElementProps {id = timeofday_menu
			event_handlers = [
				{pad_back create_pause_menu}
			]
		}
		make_text_sub_menu_item text = "Day" id = tod_day pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_day}
		make_text_sub_menu_item text = "Dynamic" id = tod_ksk_dynamic pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_dynamic}
		make_text_sub_menu_item text = "NJ Morning" auto_id pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_nj_morning}
		make_text_sub_menu_item text = "Morning" id = tod_morn pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_morning}
		make_text_sub_menu_item text = "Evening" id = tod_even pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_evening}
		make_text_sub_menu_item text = "VC Evening" id = tod_vc_evening pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_vc_evening}
		make_text_sub_menu_item text = "NJ Evening" auto_id pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_nj_evening}
		make_text_sub_menu_item text = "Night" id = tod_night pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_night}
		make_text_sub_menu_item text = "RU Night" auto_id pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_ru_night}
		make_text_sub_menu_item text = "NJ Night" auto_id pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_nj_night}
		make_text_sub_menu_item text = "SCJ Indoor" id = tod_scj pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_scj}
		make_text_sub_menu_item text = "SCJ Cutscene" auto_id pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_scj2}
		make_text_sub_menu_item text = "Rain" id = tod_rainon pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_rain}
		make_text_sub_menu_item text = "New Rain" id = tod_rainon2 pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_newrain}
		make_text_sub_menu_item text = "NJ Fog and Rain" id = tod_njfog pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_nj_fog}
		make_text_sub_menu_item text = "Snow On" id = tod_snowon pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_snow}
		make_text_sub_menu_item text = "Rain/Snow Off" id = tod_rainoff pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_weather_off}
		make_text_sub_menu_item text = "Night Vision" auto_id pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_nvision}
		make_text_sub_menu_item text = "KISS Cutscene" auto_id pad_choose_script = server_change_tod pad_choose_params = {actual_script = server_change_tod_kiss}
		
		set_sub_bg pos = (320.0,54.0)
		RunScriptOnScreenElement id = current_menu_anchor animate_in params = {final_pos = (320.0,134.0)}
	endscript
	
	script server_change_tod_day
		script_change_tod tod_action = set_tod_day is_local = <is_local>
	endscript
	script server_change_tod_dynamic
		script_change_tod tod_action = ksk_looping_tod dynamic_on is_local = <is_local>
	endscript
	script server_change_tod_morning
		script_change_tod tod_action = set_tod_morning is_local = <is_local>
	endscript
	script server_change_tod_evening
		script_change_tod tod_action = set_tod_evening is_local = <is_local>
	endscript
	script server_change_tod_nj_fog
		script_change_tod tod_action = set_tod_nj_fog is_local = <is_local>
	endscript
	script server_change_tod_night
		script_change_tod tod_action = set_tod_night is_local = <is_local>
	endscript
	script server_change_tod_scj
		script_change_tod tod_action = set_tod_scj is_local = <is_local>
	endscript
	script server_change_tod_scj2
		script_change_tod tod_action = set_tod_SCJ_Cutscene is_local = <is_local>
	endscript
	script server_change_tod_nvision
		script_change_tod tod_action = set_tod_nightvision is_local = <is_local>
	endscript
	script server_change_tod_ru_night
		script_change_tod tod_action = set_tod_ru_night is_local = <is_local>
	endscript
	script server_change_tod_kiss
		script_change_tod tod_action = set_tod_KISS is_local = <is_local>
	endscript
	script server_change_tod_nj_morning
		script_change_tod tod_action = set_tod_nj_morning is_local = <is_local>
	endscript
	script server_change_tod_nj_evening
		script_change_tod tod_action = set_tod_nj_evening is_local = <is_local>
	endscript
	script server_change_tod_vc_evening
		script_change_tod tod_action = set_tod_vc_evening is_local = <is_local>
	endscript
	script server_change_tod_nj_night
		script_change_tod tod_action = set_tod_nj_night is_local = <is_local>
	endscript
	script server_change_tod_rain
		script_change_tod tod_action = set_tod_rain is_local = <is_local>
	endscript
	script server_change_tod_newrain
		script_change_tod tod_action = set_tod_newrain is_local = <is_local>
	endscript
	script server_change_tod_snow
		script_change_tod tod_action = set_tod_snow is_local = <is_local>
	endscript
	script server_change_tod_weather_off
		script_change_tod tod_action = set_tod_rainoff is_local = <is_local>
	endscript
	script server_change_tod
		if InNetGame
			if OnServer
				SpawnScript NetEnabled <actual_script> params = {is_local = 1}
			else
				SpawnScript <actual_script> params = {is_local = 1}
			endif
		else
			SpawnScript <actual_script> params = {is_local = 1}
		endif
	endscript
	
	TOD_ENABLED = 1
	script script_change_tod is_local = 0
		if (<is_local> = 0)
			create_console_message text = "Host changed time of day"
		endif
		if NOT GotParam dynamic_on
			KillSpawnedScript name = ksk_dynamic_tod
			KillSpawnedScript name = ksk_dynamic_weather
		endif
		if GotParam tod_action
			printf "##### calling time of day action script"
			<tod_action>
			if GotParam tod_action2
				printf "##### calling time of day action 2 script"
				<tod_action2>
			endif
		endif
		if (TOD_ENABLED)
			
			
			
			<skaterlights_target> = (tod_skaterlights)
			Get_Skaterlight_direction_levelsq
			set_level_lights tod_skaterlights
			<setcolorz> = (lev_red + (lev_green * 256) + (lev_blue * 65536))
			<skycolor> = (sky_red + (sky_green * 256) + (sky_blue * 65536))
			if NOT (show_all_trick_objects)
				SetSceneColor color = <setcolorz> sky = <skycolor> lightgroup = outdoor
				SetSceneColor color = <setcolorz> lightgroup = nolevellights
				SetSceneColor color = 8421505 lightgroup = indoor
			endif
		endif
		if NOT GotParam Dont_Modify_Fog
			if (Fog_on)
				
				EnableFog
				SetFogColor r = fog_red b = fog_blue g = fog_green a = fog_alpha
				SetFogDistance distance = fog_dist
			else
				DisableFog
			endif
		endif
		if NOT GotParam dynamic_on
			
			if (Rain_on)
				WeatherSetRainActive
				WeatherSetRainHeight rain_height
				WeatherSetRainFrames rain_frames
				WeatherSetRainLength rain_length
				WeatherSetRainRate rain_rate
				<raincolor> = (rain_red + (rain_green * 256) + (rain_blue * 65536) + (rain_alpha * 16777216))
				<raincolor2> = (rain_red2 + (rain_green2 * 256) + (rain_blue2 * 65536) + (rain_alpha2 * 16777216))
				get_rain_mode_string
				WeatherSetRainBlendMode <checksum> (rain_fixed + 0)
				WeatherSetRainColor <raincolor> <raincolor2>
				GetCurrentLevel
				switch <level>
					case load_sk5ed
						Heavy_Rain_SFX_On
					case load_sk5ed_gameplay
						Heavy_Rain_SFX_On
					case load_nj
						Heavy_Rain_SFX_On
					case load_ny
						Heavy_Rain_SFX_On
					case load_hi
						Heavy_Rain_SFX_On
					case load_vc
						Heavy_Rain_SFX_On
				endswitch
			else
				Heavy_Rain_SFX_Off
				WeatherSetRainRate 0
			endif
			if splash_rate = 0
				WeatherSetSplashRate 0
			else
				<splashcolor> = (splash_red + (splash_green * 256) + (splash_blue * 65536) + (splash_alpha * 16777216))
				WeatherSetSplashRate splash_rate
				WeatherSetSplashLife splash_life
				WeatherSetSplashSize splash_size
				get_rain_mode_string splash
				WeatherSetSplashBlendMode <checksum> (splash_fixed + 0)
				WeatherSetRainColor <splashcolor>
			endif
			if (Snow_on)
				WeatherSetSnowActive
				WeatherSetsnowHeight snow_height
				WeatherSetsnowFrames snow_frames
				WeatherSetsnowSize snow_size
				WeatherSetsnowRate snow_rate
				<snowcolor> = (snow_red + (snow_green * 256) + (snow_blue * 65536) + (snow_alpha * 16777216))
				get_rain_mode_string snow
				WeatherSetSnowBlendMode <checksum> (snow_fixed + 0)
				WeatherSetSnowColor <snowcolor>
			else
				WeatherSetsnowRate 0
			endif
		endif
		script_set_level_tod
		
		
		
		
		if NOT GotParam dynamic_on
			if NOT GotParam dontchangelights
				if GotParam TurnOn_SkaterLevelLights
					printf "##### TURNING ON SKATER ONLY LEVEL LIGHTS THAT SHOULD ALWAYS BE THERE"
					FakeLights percent = 100 time = 0 prefix = TRG_Skater_levellight
				endif
				wait 1 gameframe
				if (FakeLights_Evening_on)
					printf "##### evening fakelights on"
					FakeLights percent = 100 time = 0 prefix = TRG_Evening_levellight
				else
					printf "##### evening fakelights off"
					FakeLights percent = 0 time = 0 prefix = TRG_Evening_levellight
				endif
				wait 1 gameframe
				if (FakeLights_Night_on)
					printf "##### night fakelights on"
					FakeLights percent = 100 time = 0 prefix = TRG_levellight
				else
					printf "##### night fakelights off"
					FakeLights percent = 0 time = 0 prefix = TRG_levellight
				endif
				if (Headlights_on)
					CarTOD_TurnOnHeadlights
				else
					CarTOD_TurnOffHeadlights
				endif
			endif
		endif
	endscript
	script script_reset_tod
		if NOT GotParam dynamic_on
		endif
		change FakeLights_Night_on = 0
		change FakeLights_Evening_on = 0
		change Rain_on = 0
		change Snow_on = 0
		change splash_rate = 0
		DisableFog
		Heavy_Rain_SFX_Off
		WeatherSetRainRate 0
		WeatherSetSplashRate 0
		WeatherSetsnowRate 0
		printf "##### evening fakelights off"
		FakeLights percent = 0 time = 0 prefix = TRG_Evening_levellight
		wait 1 gameframe
		printf "##### night fakelights off"
		FakeLights percent = 0 time = 0 prefix = TRG_levellight
	endscript
	script script_set_level_tod
		switch current_tod
			case morning
				printf "### Morning NOW ###"
				create prefix = "MorningOn"
				kill prefix = "DefaultOn"
				kill prefix = "EveningOn"
				kill prefix = "NightOn"
			case day
				printf "### Day NOW ###"
				create prefix = "DefaultOn"
				kill prefix = "MorningOn"
				kill prefix = "EveningOn"
				kill prefix = "NightOn"
			case evening
				printf "### Evening NOW ###"
				create prefix = "EveningOn"
				kill prefix = "DefaultOn"
				kill prefix = "MorningOn"
				kill prefix = "NightOn"
			case night
				printf "### Night NOW ###"
				create prefix = "NightOn"
				kill prefix = "DefaultOn"
				kill prefix = "MorningOn"
				kill prefix = "EveningOn"
			default
				printf "### no tod set ###"
		endswitch
		if ((current_tod = night) || (current_tod = nj_night))
			printf " ++++++++++++++++++ setting NIGHT sound boxes +++++++++++++++++"
			kill prefix = "TRG_SFX_TrigBox_Day_"
			kill prefix = "TRG_SFX_TrigBox_Night_"
			create prefix = "TRG_SFX_TrigBox_Night_"
		else
			printf " ++++++++++++++++++++++ setting day/morning/evening sound boxes +++++++++++++++++"
			kill prefix = "TRG_SFX_TrigBox_Day_"
			kill prefix = "TRG_SFX_TrigBox_Night_"
			create prefix = "TRG_SFX_TrigBox_Day_"
		endif
		Veh_Generic_TOD <...>
	endscript
	TOD_TOGGLE = 0
	current_tod = day
	script instant_tod_change
		printf " ------------------------------------- calling instant_tod_change"
		if NOT GotParam tod_action
			if GotParam current_tod
				switch <current_tod>
					case morning
						<tod_action> = set_tod_morning
					case day
						<tod_action> = set_tod_day
					case night
						<tod_action> = set_tod_night
					case evening
						<tod_action> = set_tod_evening
					case nightvision
						<tod_action> = set_tod_nightvision
					case KISS
						<tod_action> = set_tod_KISS
					case SCJ_Cutscene
						<tod_action> = set_tod_SCJ_Cutscene
					default
						<tod_action> = set_tod_day
				endswitch
			endif
		endif
		script_change_tod tod_action = <tod_action>
		if GotParam tod_action2
			script_change_tod tod_action = <tod_action2>
		endif
	endscript
	
	
	script set_tod_from_params
		<setcolorz> = (<lev_red> + (<lev_green> * 256) + (<lev_blue> * 65536))
		<skycolor> = (<sky_red> + (<sky_green> * 256) + (<sky_blue> * 65536))
		
		
		SetSceneColor color = <setcolorz> sky = <skycolor> lightgroup = outdoor
		SetSceneColor color = <setcolorz> lightgroup = nolevellights
		SetSceneColor color = 8421505 lightgroup = indoor
		EnableFog
		SetFogColor r = <fog_red> b = <fog_blue> g = <fog_green> a = <fog_alpha>
		SetFogDistance distance = <fog_dist>
	endscript
	
	
	
	
	
	
	
	
	
