
    
	skater_f_head = [
		{
			desc_id = None
			frontend_desc = 'None'
		}
        // ***************************************************
        // * BEGIN UNDERGROUND+ CUSTOM ITEM SLOTS
        // ***************************************************
		{
			desc_id = f_head_Custom01
			frontend_desc = 'NULL'
			mesh = "models/skater_female/head_steamer.skin"
		}
		{
			desc_id = f_head_Custom02
			frontend_desc = 'NULL'
			mesh = "models/skater_female/head_steamer.skin"
		}
		{
			desc_id = f_head_Custom03
			frontend_desc = 'NULL'
			mesh = "models/skater_female/head_steamer.skin"
		}
		{
			desc_id = f_head_Custom04
			frontend_desc = 'NULL'
			mesh = "models/skater_female/head_steamer.skin"
		}
		{
			desc_id = f_head_Custom05
			frontend_desc = 'NULL'
			mesh = "models/skater_female/head_steamer.skin"
		}
		{
			desc_id = f_head_Custom06
			frontend_desc = 'NULL'
			mesh = "models/skater_female/head_steamer.skin"
		}
		{
			desc_id = f_head_Custom07
			frontend_desc = 'NULL'
			mesh = "models/skater_female/head_steamer.skin"
		}
		{
			desc_id = f_head_Custom08
			frontend_desc = 'NULL'
			mesh = "models/skater_female/head_steamer.skin"
		}
		{
			desc_id = f_head_Custom09
			frontend_desc = 'NULL'
			mesh = "models/skater_female/head_steamer.skin"
		}
		{
			desc_id = f_head_Custom10
			frontend_desc = 'NULL'
			mesh = "models/skater_female/head_steamer.skin"
		}
        // ***************************************************
        // * END UNDERGROUND+ CUSTOM ITEM SLOTS
        // ***************************************************
		{
			desc_id = Steamer
			frontend_desc = 'Elissa Steamer'
			mesh = "models/skater_female/head_steamer.skin"
			is_pro_head
			is_steamer_head
		}
		{
			desc_id = Ksk_MaleSkin
			frontend_desc = 'Male Skin 1'
			mesh = "models/skater_male/Face_Male_01.skin"
			mesh_if_facemapped = "models/skater_male/Facemap_male_01.skin"
			replace = "CS_NSN_facemap.png"
			with = "textures/skater_male/CS_NSN_CAS_Male_Head01.png"
			replace1 = "CS_NSN_eye.png"
			with1 = "textures/skater_male/CS_NSN_eye_blue01.png"
			script disqualify_script
				//SetPart part = body desc_id = MaleBody
			endscript
			skintone = light
			multicolor = 1
		}
		{
			desc_id = Ksk_MaleSkin_2
			frontend_desc = 'Male Skin 2'
			mesh = "models/skater_male/Face_Male_01.skin"
			mesh_if_facemapped = "models/skater_male/Facemap_male_01.skin"
			replace = "CS_NSN_facemap.png"
			with = "textures/skater_male/CS_NSN_CAS_Male_Head06.png"
			script disqualify_script
				//SetPart part = body desc_id = MaleBody
			endscript
			skintone = light
			multicolor = 1
		}
		{
			desc_id = Ksk_MaleSkin_3
			frontend_desc = 'Male Skin 3'
			mesh = "models/skater_male/Face_Male_01.skin"
			mesh_if_facemapped = "models/skater_male/Facemap_male_01.skin"
			replace = "CS_NSN_facemap.png"
			with = "textures/skater_male/CS_NSN_CAS_Male_Head02.png"
			script disqualify_script
				//SetPart part = body desc_id = MaleBody
			endscript
			skintone = light
			multicolor = 1
		}
		{
			desc_id = Ksk_MaleSkin_4
			frontend_desc = 'Male Skin 4'
			mesh = "models/skater_male/Face_Male_01.skin"
			mesh_if_facemapped = "models/skater_male/Facemap_male_01.skin"
			replace = "CS_NSN_facemap.png"
			with = "textures/skater_male/CS_NSN_CAS_Male_Head04.png"
			script disqualify_script
				//SetPart part = body desc_id = MaleBody
			endscript
			skintone = light
			multicolor = 1
		}
		{
			desc_id = Ksk_MaleSkin_5
			frontend_desc = 'Male Skin 5'
			mesh = "models/skater_male/Face_Male_01.skin"
			mesh_if_facemapped = "models/skater_male/Facemap_male_01.skin"
			replace = "CS_NSN_facemap.png"
			with = "textures/skater_male/CS_NSN_CAS_Male_Head05.png"
			replace1 = "CS_NSN_eye.png"
			with1 = "textures/skater_male/CS_NSN_eye_hazel01.png"
			script disqualify_script
				//SetPart part = body desc_id = MaleBody
			endscript
			skintone = light
			multicolor = 1
		}
		
		/*{
			desc_id = Ksk_cas_Jenna
			frontend_desc = 'Jenna'
			script disqualify_script
				//SetPart part = body desc_id = Ksk_Jenna
			endscript
			skintone = light
		}*/
		
		{
			desc_id = #"0x12A569EF"
			frontend_desc = 'Light Skin 1'
			mesh = "models/skater_female/head_Female_01.skin"
			mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin"
			script disqualify_script
				//SetPart part = body desc_id = FemaleBody
			endscript
			skintone = light
		}
		
		{
			desc_id = Ksk_LightSkin1_Cutscene
			frontend_desc = 'Light Skin 1 Cutscene'
			mesh = "models/cutscenes/Head_cas_female01b.skin"
			mesh_if_facemapped = "models/cutscenes/Head_cas_female01.skin"
			script disqualify_script
				//SetPart part = body desc_id = FemaleBody
			endscript
			skintone = light
		}
		{
			desc_id = #"0x8BAC3855"
			frontend_desc = 'Light Skin 2'
			mesh = "models/skater_female/head_Female_01.skin"
			replace = "CS_NSN_F_wht_Head01"
			with = "textures/skater_male/CS_CRS_F_Wht_Head02"
			mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin"
			script disqualify_script
				//SetPart part = body desc_id = FemaleBody
			endscript
			skintone = light
		}
		{
			desc_id = #"0xFCAB08C3"
			frontend_desc = 'Light Skin 3'
			mesh = "models/skater_female/head_Female_01.skin"
			replace = "CS_NSN_F_wht_Head01"
			with = "textures/skater_male/CS_CRS_F_Wht_Head03"
			mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin"
			script disqualify_script
				//SetPart part = body desc_id = FemaleBody
			endscript
			skintone = light
		}
		{
			desc_id = Ksk_LightSkin4
			frontend_desc = 'Light Skin 4'
			mesh = "models/skater_female/head_Female_01.skin"
			replace = "CS_NSN_F_wht_Head01"
			with = "textures/skater_male/CS_CRS_F_Wht_Head04"
			mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin"
			script disqualify_script
				//SetPart part = body desc_id = FemaleBody
			endscript
			skintone = light
		}
		
		{
			desc_id = Ksk_LightSkin5
			frontend_desc = 'Light Skin 5'
			mesh = "models/skater_female/head_Female_01.skin"
			replace = "CS_NSN_F_wht_Head01"
			with = "textures/skater_male/CS_CRS_F_Wht_Head05"
			mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin"
			script disqualify_script
				//SetPart part = body desc_id = FemaleBody
			endscript
			skintone = light
		}
		
		{
			desc_id = #"0x7550E9CD"
			frontend_desc = 'Dark Skin 1'
			mesh = "models/skater_female/head_Female_01.skin"
			replace = "CS_NSN_F_wht_Head01"
			with = "textures/skater_male/CS_CRS_F_blk_Head02"
			mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin"
			script disqualify_script
				//SetPart part = body desc_id = FemaleBody2
			endscript
			skintone = dark
		}
		{
			desc_id = #"0xEC59B877"
			frontend_desc = 'Dark Skin 2'
			mesh = "models/skater_female/head_Female_01.skin"
			replace = "CS_NSN_F_wht_Head01"
			with = "textures/skater_male/CS_CRS_F_blk_Head03"
			mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin"
			script disqualify_script
				//SetPart part = body desc_id = FemaleBody2
			endscript
			skintone = dark
		}
		{
			desc_id = #"0x9B5E88E1"
			frontend_desc = 'Dark Skin 3'
			mesh = "models/skater_female/head_Female_01.skin"
			replace = "CS_NSN_F_wht_Head01"
			with = "textures/skater_male/CS_CRS_F_blk_Head05"
			mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin"
			script disqualify_script
				//SetPart part = body desc_id = FemaleBody2
			endscript
			skintone = dark
		}
		
		{
			desc_id = Ksk_DarkSkin4
			frontend_desc = 'Dark Skin 4'
			mesh = "models/skater_female/head_Female_01.skin"
			replace = "CS_NSN_F_wht_Head01"
			with = "textures/skater_male/CS_CRS_F_Blk_Head04"
			mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin"
			script disqualify_script
				//SetPart part = body desc_id = FemaleBody2
			endscript
			skintone = dark
		}
		{
			desc_id = Ksk_DarkSkin5
			frontend_desc = 'Dark Skin 5'
			mesh = "models/skater_female/head_Female_01.skin"
			replace = "CS_NSN_F_wht_Head01"
			with = "textures/skater_male/CS_NSN_F_blk_Head01"
			mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin"
			script disqualify_script
				//SetPart part = body desc_id = FemaleBody2
			endscript
			skintone = dark
		}
		
		{
			desc_id = #"0x017AEF91"
			frontend_desc = 'Tan Skin 1'
			mesh = "models/skater_female/head_Female_01.skin"
			replace = "CS_NSN_F_wht_Head01"
			with = "textures/skater_male/CS_CRS_F_Bwn_Head02"
			mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin"
			script disqualify_script
				//SetPart part = body desc_id = FemaleBody3
			endscript
			skintone = tan
		}
		{
			desc_id = #"0x9873BE2B"
			frontend_desc = 'Tan Skin 2'
			mesh = "models/skater_female/head_Female_01.skin"
			replace = "CS_NSN_F_wht_Head01"
			with = "textures/skater_male/CS_CRS_F_Bwn_Head04"
			mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin"
			script disqualify_script
				//SetPart part = body desc_id = FemaleBody3
			endscript
			skintone = tan
		}
		{
			desc_id = #"0xEF748EBD"
			frontend_desc = 'Tan Skin 3'
			mesh = "models/skater_female/head_Female_01.skin"
			replace = "CS_NSN_F_wht_Head01"
			with = "textures/skater_male/CS_CRS_F_Bwn_Head05"
			mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin"
			script disqualify_script
				//SetPart part = body desc_id = FemaleBody3
			endscript
			skintone = tan
		}
		
		{
			desc_id = Ksk_TanSkin4
			frontend_desc = 'Tan Skin 4'
			mesh = "models/skater_female/head_Female_01.skin"
			replace = "CS_NSN_F_wht_Head01"
			with = "textures/skater_male/CS_CRS_F_Bwn_Head01"
			mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin"
			script disqualify_script
				//SetPart part = body desc_id = FemaleBody3
			endscript
			skintone = tan
		}
		{
			desc_id = Ksk_TanSkin5
			frontend_desc = 'Tan Skin 5'
			mesh = "models/skater_female/head_Female_01.skin"
			replace = "CS_NSN_F_wht_Head01"
			with = "textures/skater_male/CS_CRS_F_Bwn_Head03"
			mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin"
			script disqualify_script
				//SetPart part = body desc_id = FemaleBody3
			endscript
			skintone = tan
		}
		
		{
			desc_id = #"0xD614ACC9"
			frontend_desc = 'Grey Skin 1'
			mesh = "models/skater_female/head_Female_01.skin"
			replace = "CS_NSN_F_wht_Head01"
			with = "textures/skater_male/CS_NSN_F_Gry_Head01.png"
			mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin"
			script disqualify_script
				//SetPart part = body desc_id = FemaleBody4
			endscript
			skintone = Grey
		}
		{
			desc_id = Skull
			frontend_desc = 'Skull'
			mesh = "models/skater_male/Head_Skull01.skin"
			mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin"
			no_color
			NoCutsceneHead
			skintone = light
		}
		{
			desc_id = Eyes
			frontend_desc = 'Eyes'
			mesh = "models/skater_male/Skin_Extra_eyes.skin"
			mesh_if_facemapped = "models/skater_female/Facemap_female_01.skin"
			script disqualify_script
				//ClearPart part = skater_f_hair
			endscript
			no_color
			NoCutsceneHead
			skintone = light
		}
	]
	skater_f_hair = [
		{
			desc_id = Bald
			frontend_desc = 'None'
			no_color
		}
        // ***************************************************
        // * BEGIN UNDERGROUND+ CUSTOM ITEM SLOTS
        // ***************************************************
		{
			desc_id = f_hair_Custom01
			frontend_desc = 'NULL'
			mesh = "models/skater_female/hair_medium.skin"
		}
		{
			desc_id = f_hair_Custom02
			frontend_desc = 'NULL'
			mesh = "models/skater_female/hair_medium.skin"
		}
		{
			desc_id = f_hair_Custom03
			frontend_desc = 'NULL'
			mesh = "models/skater_female/hair_medium.skin"
		}
		{
			desc_id = f_hair_Custom04
			frontend_desc = 'NULL'
			mesh = "models/skater_female/hair_medium.skin"
		}
		{
			desc_id = f_hair_Custom05
			frontend_desc = 'NULL'
			mesh = "models/skater_female/hair_medium.skin"
		}
		{
			desc_id = f_hair_Custom06
			frontend_desc = 'NULL'
			mesh = "models/skater_female/hair_medium.skin"
		}
		{
			desc_id = f_hair_Custom07
			frontend_desc = 'NULL'
			mesh = "models/skater_female/hair_medium.skin"
		}
		{
			desc_id = f_hair_Custom08
			frontend_desc = 'NULL'
			mesh = "models/skater_female/hair_medium.skin"
		}
		{
			desc_id = f_hair_Custom09
			frontend_desc = 'NULL'
			mesh = "models/skater_female/hair_medium.skin"
		}
		{
			desc_id = f_hair_Custom10
			frontend_desc = 'NULL'
			mesh = "models/skater_female/hair_medium.skin"
		}
        // ***************************************************
        // * END UNDERGROUND+ CUSTOM ITEM SLOTS
        // ***************************************************
		{
			desc_id = Medium
			frontend_desc = 'Medium 1'
			mesh = "models/skater_female/hair_medium.skin"
			hair_type = Medium
			replace = "CS_NSN_F_Hairline.png"
			with = "textures/skater_male/CS_NSN_F_Hairline01.png"
			in = all
			default_h = 45
			default_s = 38
			default_v = 32
		}
		{
			desc_id = Medium2
			frontend_desc = 'Medium 2'
			mesh = "models/skater_male/Hair_M_Medium2.skin"
			hair_type = Medium
			default_h = 20
			default_s = 32
			default_v = 38
		}
		{
			desc_id = Medium3
			frontend_desc = 'Medium 3'
			mesh = "models/skater_male/Hair_M_Medium3.skin"
			hair_type = Medium
			default_h = 20
			default_s = 32
			default_v = 38
		}
		{
			desc_id = Tracer
			frontend_desc = 'Tracer'
			mesh = "models/skater_female/hair_tracer.skin"
			hair_type = Medium
			//default_h = 64
			//default_s = 64
			//default_v = 64
            ugplus_type = 1
		}
		{
			desc_id = Short
			frontend_desc = 'Short'
			mesh = "models/skater_female/hair_F_short.skin"
			hair_type = Medium
			default_h = 45
			default_s = 38
			default_v = 32
		}
		{
			desc_id = Cropped
			frontend_desc = 'Cropped'
			mesh = "models/skater_female/hair_cropped.skin"
			hair_type = Medium
			default_h = 50
			default_s = 41
			default_v = 42
		}
		{
			desc_id = Bushy
			frontend_desc = 'Bushy'
			mesh = "models/skater_female/hair_bushy.skin"
			hair_type = Medium
			replace = "CS_NSN_F_Hairline.png"
			with = "textures/skater_male/CS_NSN_F_Hairline01.png"
			in = all
			default_h = 290
			default_s = 86
			default_v = 56
		}
		{
			desc_id = Long
			frontend_desc = 'Long 1'
			mesh = "models/skater_female/hair_long.skin"
			hair_type = Long
			replace = "CS_NSN_F_Hairline.png"
			with = "textures/skater_male/CS_NSN_F_Hairline01.png"
			in = all
		}
		{
			desc_id = Long2
			frontend_desc = 'Long 2'
			mesh = "models/skater_female/hair_F_Long2.skin"
			hair_type = Long
			default_h = 45
			default_s = 38
			default_v = 32
		}
		{
			desc_id = Long1
			frontend_desc = 'Long 3'
			mesh = "models/skater_male/Hair_M_W_Longhair_A.skin"
			hair_type = Long
			default_h = 20
			default_s = 32
			default_v = 38
		}
		{
			desc_id = Braids
			frontend_desc = 'Braids'
			mesh = "models/skater_female/hair_Braids.skin"
			hair_type = Medium
			default_h = 45
			default_s = 38
			default_v = 32
		}
		{
			desc_id = Pigtails
			frontend_desc = 'Pigtails'
			mesh = "models/skater_female/hair_pigtails.skin"
			hair_type = Medium
			default_h = 45
			default_s = 41
			default_v = 50
		}
		{
			desc_id = Ponytail
			frontend_desc = 'Ponytail 1'
			mesh = "models/skater_female/hair_ponytail.skin"
			hair_type = Ponytail
			default_h = 35
			default_s = 38
			default_v = 22
		}
		{
			desc_id = Ponytail1
			frontend_desc = 'Ponytail 2'
			mesh = "models/skater_male/Hair_M_Ponytail1.skin"
			hair_type = Ponytail
			default_h = 20
			default_s = 32
			default_v = 38
		}
		{
			desc_id = Ponytail2
			frontend_desc = 'Ponytail 3'
			mesh = "models/skater_male/Hair_M_Ponytail2.skin"
			hair_type = Ponytail
			default_h = 20
			default_s = 32
			default_v = 38
		}
		{
			desc_id = Mohawk
			frontend_desc = 'Mohawk 1'
			mesh = "models/skater_male/Hair_M_W_Mohawk.skin"
			replace = "CS_JB_Hair_MohawkD1.png"
			with = "textures/skater_male/CS_JB_Hair_MohawkL1"
			hair_type = Mohawk
		}
		{
			desc_id = #"0x0301B3FC"
			frontend_desc = 'Mohawk 2'
			mesh = "models/skater_female/Hair_F_Mohawk2.skin"
			hair_type = Mohawk
			default_h = 345
			default_s = 65
			default_v = 56
		}
		{
			desc_id = #"0x7406836A"
			frontend_desc = 'Mohawk 3'
			mesh = "models/skater_female/Hair_F_Mohawk.skin"
			hair_type = Mohawk
			default_h = 100
			default_s = 50
			default_v = 50
		}
		{
			desc_id = #"0x60FF48B0"
			frontend_desc = 'Liberty Spikes'
			mesh = "models/skater_male/Hair_M_LibertySpikes.skin"
			hair_type = Mohawk
			default_h = 285
			default_s = 80
			default_v = 52
		}
		{
			desc_id = Hair_MediumHAT
			frontend_desc = 'Hair MediumHAT'
			mesh = "models/skater_female/Hair_F_MediumHAT.skin"
		}
		{
			desc_id = Hair_PonytailHAT
			frontend_desc = 'Hair_PonytailHAT'
			mesh = "models/skater_male/Hair_M_PonytailHAT.skin"
		}
		{
			desc_id = Hair_LongHAT
			frontend_desc = 'Hair_LongHAT'
			mesh = "models/skater_female/Hair_F_LongHAT.skin"
		}
	]
	skater_f_torso = [
		{
			desc_id = None
			frontend_desc = 'None'
			shows_panties no_color
		}
		// ***************************************************
        // * BEGIN UNDERGROUND+ CUSTOM ITEM SLOTS
        // ***************************************************
		{
			desc_id = f_torso_Custom01
			frontend_desc = 'NULL'
			mesh = "models/skater_female/shirt_tshirt.skin"
		}
		{
			desc_id = f_torso_Custom02
			frontend_desc = 'NULL'
			mesh = "models/skater_female/shirt_tshirt.skin"
		}
		{
			desc_id = f_torso_Custom03
			frontend_desc = 'NULL'
			mesh = "models/skater_female/shirt_tshirt.skin"
		}
		{
			desc_id = f_torso_Custom04
			frontend_desc = 'NULL'
			mesh = "models/skater_female/shirt_tshirt.skin"
		}
		{
			desc_id = f_torso_Custom05
			frontend_desc = 'NULL'
			mesh = "models/skater_female/shirt_tshirt.skin"
		}
		{
			desc_id = f_torso_Custom06
			frontend_desc = 'NULL'
			mesh = "models/skater_female/shirt_tshirt.skin"
		}
		{
			desc_id = f_torso_Custom07
			frontend_desc = 'NULL'
			mesh = "models/skater_female/shirt_tshirt.skin"
		}
		{
			desc_id = f_torso_Custom08
			frontend_desc = 'NULL'
			mesh = "models/skater_female/shirt_tshirt.skin"
		}
		{
			desc_id = f_torso_Custom09
			frontend_desc = 'NULL'
			mesh = "models/skater_female/shirt_tshirt.skin"
		}
		{
			desc_id = f_torso_Custom10
			frontend_desc = 'NULL'
			mesh = "models/skater_female/shirt_tshirt.skin"
		}
        // ***************************************************
        // * END UNDERGROUND+ CUSTOM ITEM SLOTS
        // ***************************************************
		{
			desc_id = #"T-shirt"
			frontend_desc = 'T-Shirt'
			mesh = "models/skater_female/shirt_tshirt.skin"
			replace = "CS_NSN_F_TShirt01.png"
			with = "textures/skater_male/CS_NSN_Tshirt0"
			replace1 = "CS_NSN_F_TSleeve01.png"
			with1 = "textures/skater_male/CS_NSN_TSleeve0"
			supports_logo
			multicolor = 1
		}
		{
			desc_id = #"0xF3C1FB05"
			frontend_desc = 'Shirt Line'
			mesh = "models/skater_female/shirt_tshirt.skin"
			supports_logo
			multicolor = 1
		}
		{
			desc_id = #"0xFA9B94AE"
			frontend_desc = 'Camo T-Shirt'
			mesh = "models/skater_female/shirt_tshirt.skin"
			replace = "CS_NSN_F_TShirt01.png"
			with = "textures/skater_male/CS_NSN_shirt_camo01"
			replace1 = "CS_NSN_F_TSleeve01.png"
			with1 = "textures/skater_male/CS_NSN_shirtslv_camo_short01"
			supports_logo
			multicolor = 1
		}
		{
			desc_id = Striped
			frontend_desc = 'Striped'
			mesh = "models/skater_female/shirt_tshirt.skin"
			replace = "CS_NSN_F_TShirt01.png"
			with = "textures/skater_male/CS_NSN_shirt_stripe01"
			replace1 = "CS_NSN_F_TSleeve01.png"
			with1 = "textures/skater_male/CS_NSN_Sleeve_stripe01"
			supports_logo
			multicolor = 1
		}
		{
			desc_id = #"Tie-Dye"
			frontend_desc = 'Tie-Dye'
			mesh = "models/skater_female/shirt_tshirt.skin"
			replace = "CS_NSN_F_TShirt01.png"
			with = "textures/skater_male/CS_JB_shirt_tiedye"
			replace1 = "CS_NSN_F_TSleeve01.png"
			with1 = "textures/skater_male/CS_JB_sleeve_short_tiedye"
			supports_logo
			multicolor = 1
		}
		{
			desc_id = #"0xC904FBDF"
			frontend_desc = 'Button Open SS'
			mesh = "models/skater_female/shirt_button_open_ss.skin"
		}
		{
			desc_id = #"0x045EF541"
			frontend_desc = 'Button Open LS'
			mesh = "models/skater_female/Shirt_button_open_ls.skin"
			multicolor = 1
			script disqualify_script
				cas_temp_disq_remove_accessories
			endscript
		}
		{desc_id = #"0x90BF4386"
			frontend_desc = 'Halter Top'
			mesh = "models/skater_female/Shirt_haltertop.skin"
		}
		{
			desc_id = #"Baseball-T"
			frontend_desc = 'Baseball-T'
			mesh = "models/skater_female/Shirt_baseball-t.skin"
			supports_logo
			multicolor = 1
			default_h = 25
			default_s = 59
			default_v = 50
		}
		{
			desc_id = Sleeveless
			frontend_desc = 'Sleeveless'
			mesh = "models/skater_female/shirt_sleeveless.skin"
			supports_logo
			no_back_logo
		}
		{
			desc_id = #"0x328F4A97"
			frontend_desc = 'Button SS'
			mesh = "models/skater_female/shirt_button_ss.skin"
		}
		{
			desc_id = Collar
			frontend_desc = 'Collar'
			mesh = "models/skater_female/shirt_collar.skin"
			default_h = 345
			default_s = 29
			default_v = 56
		}
		{
			desc_id = Longsleeve
			frontend_desc = 'Longsleeve'
			mesh = "models/skater_female/Shirt_Longsleeve.skin"
			supports_logo
			script disqualify_script
				cas_temp_disq_remove_accessories
			endscript
			multicolor = 1
		}
		{
			desc_id = #"0x16CCB35A"
			frontend_desc = 'T-shirt Long Sleeve'
			mesh = "models/skater_female/shirt_T_longsleeve.skin"
			supports_logo
			script disqualify_script
				cas_temp_disq_remove_accessories
			endscript
			multicolor = 1
			default_h = 220
			default_s = 50
			default_v = 52
		}
		{
			desc_id = #"0xFFD54409"
			frontend_desc = 'Button LS'
			mesh = "models/skater_female/shirt_button_ls.skin"
			script disqualify_script
				cas_temp_disq_remove_accessories
			endscript
			default_h = 100
			default_s = 42
			default_v = 44
		}
		{
			desc_id = #"V-Neck"
			frontend_desc = 'V-Neck'
			mesh = "models/skater_female/shirt_SSVneck.skin"
			supports_logo
			multicolor = 1
		}
		{
			desc_id = Jersey
			frontend_desc = 'Jersey'
			mesh = "models/skater_female/shirt_jersey.skin"
			shows_panties
			not_with_backpack
		}
		{
			desc_id = #"0x14DE5FDD"
			frontend_desc = 'Tanktop Short'
			mesh = "models/skater_female/shirt_tanktop_2.skin"
			supports_logo
			no_back_logo
		}
		{
			desc_id = Tanktop
			frontend_desc = 'Tanktop'
			mesh = "models/skater_female/shirt_tanktop.skin"
			supports_logo
			no_back_logo
		}
		{
			desc_id = #"0xF4706317"
			frontend_desc = 'Tie-Dye Tank'
			mesh = "models/skater_female/shirt_tanktop.skin"
			replace = "CS_Nsn_female_tanktop.png"
			with = "textures/skater_male/CS_NSN_f_tanktop_dye"
			supports_logo
			no_back_logo
		}
		{
			desc_id = #"0x950DE15F"
			frontend_desc = 'Floral Tank'
			mesh = "models/skater_female/shirt_tanktop.skin"
			replace = "CS_Nsn_female_tanktop.png"
			with = "textures/skater_male/CS_NSN_f_tanktop_floral"
			supports_logo
			no_back_logo
		}
		{
			desc_id = #"0x1A8EFF7D"
			frontend_desc = 'Denim Jacket'
			mesh = "models/skater_female/shirt_denimjacket.skin"
			shows_panties
			not_with_backpack
			not_with_weird_hat
			script disqualify_script
				cas_temp_disq_remove_accessories
			endscript
		}
		{
			desc_id = #"0xA89E177C"
			frontend_desc = 'Baggy Vest'
			mesh = "models/skater_female/shirt_baggyvest.skin"
			shows_panties
			not_with_backpack
		}
		{
			desc_id = #"0x1502EDED"
			frontend_desc = 'Leather Vest'
			mesh = "models/skater_female/shirt_baggyvest.skin"
			replace = "CS_NH_baggyvest.png"
			with = "textures/skater_male/CS_NH_leathervest"
			shows_panties
			not_with_backpack
		}
		{
			desc_id = #"0x5D0A9EEF"
			frontend_desc = 'Hoody Up'
			mesh = "models/skater_female/shirt_F_Hoodyup.skin"
			supports_logo
			script disqualify_script
				ClearPart part = skater_f_hair
				ClearPart part = hat
				ClearPart part = helmet
				cas_temp_disq_remove_accessories
			endscript
			not_with_weird_hat
			default_h = 15
			default_s = 5
			default_v = 26
		}
		{
			desc_id = #"0xFBFA7BB3"
			frontend_desc = 'Hoody Down'
			mesh = "models/skater_female/shirt_F_Hoodydown.skin"
			supports_logo
			no_back_logo
			script disqualify_script
				cas_temp_disq_remove_accessories
			endscript
			not_with_weird_hat
			default_h = 20
			default_s = 20
			default_v = 34
		}
		{
			desc_id = #"0x59D37FFA"
			frontend_desc = 'Tube Top'
			mesh = "models/skater_female/shirt_tube.skin"
		}
		{
			desc_id = #"0x516EF9AE"
			frontend_desc = 'Coconut Bra'
			mesh = "models/skater_female/shirt_coconutbra.skin"
			not_with_backpack
		}
		{
			desc_id = #"0x47B29F1D"
			frontend_desc = 'Russian coat'
			mesh = "models/skater_male/shirt_jacket_bomber.skin"
			not_with_backpack
			script disqualify_script
				cas_temp_disq_remove_accessories
			endscript
			not_with_elbowpads
			not_with_weird_hat
			multicolor = 1
		}
		{
			desc_id = #"0xCCC7257E"
			frontend_desc = 'Jogger Jacket'
			mesh = "models/skater_female/shirt_jogger.skin"
			not_with_elbowpads
			script disqualify_script
				cas_temp_disq_remove_accessories
			endscript
			default_h = 325
			default_s = 50
			default_v = 50
		}
	]
	skater_f_legs = [
		{
			desc_id = None
			frontend_desc = 'None'
			shows_panties no_color
		}
        // ***************************************************
        // * BEGIN UNDERGROUND+ CUSTOM ITEM SLOTS
        // ***************************************************
		{
			desc_id = f_legs_Custom01
			frontend_desc = 'NULL'
			mesh = "models/skater_female/pant_shorts.skin"
		}
		{
			desc_id = f_legs_Custom02
			frontend_desc = 'NULL'
			mesh = "models/skater_female/pant_shorts.skin"
		}
		{
			desc_id = f_legs_Custom03
			frontend_desc = 'NULL'
			mesh = "models/skater_female/pant_shorts.skin"
		}
		{
			desc_id = f_legs_Custom04
			frontend_desc = 'NULL'
			mesh = "models/skater_female/pant_shorts.skin"
		}
		{
			desc_id = f_legs_Custom05
			frontend_desc = 'NULL'
			mesh = "models/skater_female/pant_shorts.skin"
		}
		{
			desc_id = f_legs_Custom06
			frontend_desc = 'NULL'
			mesh = "models/skater_female/pant_shorts.skin"
		}
		{
			desc_id = f_legs_Custom07
			frontend_desc = 'NULL'
			mesh = "models/skater_female/pant_shorts.skin"
		}
		{
			desc_id = f_legs_Custom08
			frontend_desc = 'NULL'
			mesh = "models/skater_female/pant_shorts.skin"
		}
		{
			desc_id = f_legs_Custom09
			frontend_desc = 'NULL'
			mesh = "models/skater_female/pant_shorts.skin"
		}
		{
			desc_id = f_legs_Custom10
			frontend_desc = 'NULL'
			mesh = "models/skater_female/pant_shorts.skin"
		}
        // ***************************************************
        // * END UNDERGROUND+ CUSTOM ITEM SLOTS
        // ***************************************************
		{
			desc_id = Shorts
			frontend_desc = 'Shorts'
			mesh = "models/skater_female/pant_shorts.skin"
			shows_panties
		}
		{
			desc_id = #"0x94590430"
			frontend_desc = 'Shorts Denim'
			mesh = "models/skater_female/pant_shorts.skin"
			replace = "CAS_CRS_Shorts_Cargo.png"
			with = "textures/skater_male/CAS_CRS_Shorts_Denim02"
			shows_panties
		}
		{
			desc_id = #"0x6740AA83"
			frontend_desc = 'Short Shorts Denim'
			mesh = "models/skater_female/pant_shortshorts.skin"
			shows_panties
		}
		{
			desc_id = #"0x5C81886B"
			frontend_desc = 'Short Flowers'
			mesh = "models/skater_female/pant_shortshorts.skin"
			replace = "CAS_CRS_Shorts_Denim.png"
			with = "textures/skater_male/CAS_CRS_Shorts_Pattern"
			shows_panties
		}
		{
			desc_id = #"0xB483AB44"
			frontend_desc = 'Shorts Daisy'
			mesh = "models/skater_female/pant_daisy.skin"
		}
		{
			desc_id = #"0x4B7D25DC"
			frontend_desc = 'Mini Skirt'
			mesh = "models/skater_female/pant_miniskirt.skin"
			default_h = 200
			default_s = 53
			default_v = 36
		}
		{
			desc_id = Regular
			frontend_desc = 'Regular'
			mesh = "models/skater_female/pant_regular.skin"
			covers_socks
		}
		{
			desc_id = Tight
			frontend_desc = 'Tight'
			mesh = "models/skater_female/pant_tight.skin"
			covers_socks
		}
		{
			desc_id = Baggy
			frontend_desc = 'Baggy'
			mesh = "models/skater_female/pant_baggy.skin"
			default_h = 55
			default_s = 35
			default_v = 34
			not_with_kneepads
			covers_socks
		}
		{
			desc_id = Steamer
			frontend_desc = 'Steamer'
			mesh = "models/skater_female/pant_baggy.skin"
			replace = "CS_NSN_pants_feamle.png"
			with = "textures/skater_male/CS_NSN_steamer_pants"
			covers_socks
		}
		{
			desc_id = #"0x085CA057"
			frontend_desc = 'Snow Pants'
			mesh = "models/skater_male/pants_baggy.skin"
			replace = "CS_NSN_pants_denim01.png"
			with = "textures/skater_male/CS_NSN_pants_snow02"
			not_with_kneepads
			covers_socks
		}
		{
			desc_id = #"0xE65F3BBA"
			frontend_desc = 'Camo Pants'
			mesh = "models/skater_female/pant_baggy.skin"
			replace = "CS_NSN_pants_feamle.png"
			with = "textures/skater_male/CS_NSN_cargoshorts_camo"
			covers_socks
		}
		{
			desc_id = #"0x5355D4AC"
			frontend_desc = 'Stripe Pants'
			mesh = "models/skater_female/pant_regular.skin"
			replace = "CS_NSN_pants_feamle.png"
			with = "textures/skater_male/CS_NSN_baggypants_stripe"
			covers_socks
		}
		{
			desc_id = Bellbottoms
			frontend_desc = 'Bellbottoms'
			mesh = "models/skater_female/pant_bellbottoms.skin"
			default_h = 225
			default_s = 18
			default_v = 42
			covers_socks
		}
		{
			desc_id = #"0xF702F526"
			frontend_desc = 'Ankle Pants'
			mesh = "models/skater_female/pant_ankle.skin"
			shows_panties
		}
		{
			desc_id = Jogger
			frontend_desc = 'Jogger'
			mesh = "models/skater_male/pants_jogger.skin"
			default_h = 325
			default_s = 50
			default_v = 50
		}
	]
	skater_f_socks = [
		{
			desc_id = None
			frontend_desc = 'None'
			no_color
		}
        // ***************************************************
        // * BEGIN UNDERGROUND+ CUSTOM ITEM SLOTS
        // ***************************************************
		{
			desc_id = f_socks_Custom01
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_socks.skin"
		}
		{
			desc_id = f_socks_Custom02
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_socks.skin"
		}
		{
			desc_id = f_socks_Custom03
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_socks.skin"
		}
		{
			desc_id = f_socks_Custom04
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_socks.skin"
		}
		{
			desc_id = f_socks_Custom05
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_socks.skin"
		}
		{
			desc_id = f_socks_Custom06
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_socks.skin"
		}
		{
			desc_id = f_socks_Custom07
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_socks.skin"
		}
		{
			desc_id = f_socks_Custom08
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_socks.skin"
		}
		{
			desc_id = f_socks_Custom09
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_socks.skin"
		}
		{
			desc_id = f_socks_Custom10
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_socks.skin"
		}
        // ***************************************************
        // * END UNDERGROUND+ CUSTOM ITEM SLOTS
        // ***************************************************
		{
			desc_id = High
			frontend_desc = 'High'
			mesh = "models/skater_male/extra_socks.skin"
			replace = "CS_NN_socks.png"
			with = "textures/skater_male/CS_NH_sock02"
			script disqualify_script
				cas_temp_disq_check_for_covered_socks
			endscript
		}
		{
			desc_id = Medium
			frontend_desc = 'Medium'
			mesh = "models/skater_male/extra_socks.skin"
			script disqualify_script
				cas_temp_disq_check_for_covered_socks
			endscript
		}
		{
			desc_id = Ankle
			frontend_desc = 'Ankle'
			mesh = "models/skater_male/extra_socks.skin"
			replace = "CS_NN_socks.png"
			with = "textures/skater_male/CS_NH_sock03"
			script disqualify_script
				cas_temp_disq_check_for_covered_socks
			endscript
		}
		{
			desc_id = Sport
			frontend_desc = 'Sport'
			mesh = "models/skater_male/extra_socks.skin"
			replace = "CS_NN_socks.png"
			with = "textures/skater_male/CAS_MLS_sportsocks"
			script disqualify_script
				cas_temp_disq_check_for_covered_socks
			endscript
		}
		{
			desc_id = English
			frontend_desc = 'English'
			mesh = "models/skater_male/extra_socks.skin"
			replace = "CS_NN_socks.png"
			with = "textures/skater_male/CAS_MLS_english"
			script disqualify_script
				cas_temp_disq_check_for_covered_socks
			endscript
		}
	]
	skater_f_backpack = [
		{
			desc_id = None
			frontend_desc = 'None'
			no_color
		}
        // ***************************************************
        // * BEGIN UNDERGROUND+ CUSTOM ITEM SLOTS
        // ***************************************************
		{
			desc_id = f_backpack_Custom01
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_backpack.skin"
		}
		{
			desc_id = f_backpack_Custom02
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_backpack.skin"
		}
		{
			desc_id = f_backpack_Custom03
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_backpack.skin"
		}
		{
			desc_id = f_backpack_Custom04
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_backpack.skin"
		}
		{
			desc_id = f_backpack_Custom05
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_backpack.skin"
		}
		{
			desc_id = f_backpack_Custom06
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_backpack.skin"
		}
		{
			desc_id = f_backpack_Custom07
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_backpack.skin"
		}
		{
			desc_id = f_backpack_Custom08
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_backpack.skin"
		}
		{
			desc_id = f_backpack_Custom09
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_backpack.skin"
		}
		{
			desc_id = f_backpack_Custom10
			frontend_desc = 'NULL'
			mesh = "models/skater_male/extra_backpack.skin"
		}
        // ***************************************************
        // * END UNDERGROUND+ CUSTOM ITEM SLOTS
        // ***************************************************
		{
			desc_id = Backpack1
			frontend_desc = 'Backpack 1'
			mesh = "models/skater_male/extra_backpack.skin"
			is_backpack
		}
		{
			desc_id = #"0xCA983356"
			frontend_desc = 'Backpack 2'
			mesh = "models/skater_male/extra_backpack.skin"
			replace = "CAS_TZ_Backpack02.png"
			with = "textures/skater_male/CAS_TZ_Backpack02a.png"
			is_backpack
		}
		{
			desc_id = #"0xBD9F03C0"
			frontend_desc = 'Backpack 3'
			mesh = "models/skater_male/extra_backpack02.skin"
			is_backpack
		}
		{
			desc_id = #"0x23FB9663"
			frontend_desc = 'Backpack 4'
			mesh = "models/skater_male/extra_backpack02.skin"
			replace = "CAS_TZ_Backpack03.png"
			with = "textures/skater_male/CAS_TZ_Backpack03a.png"
			is_backpack
		}
		{
			desc_id = #"0x54FCA6F5"
			frontend_desc = 'Backpack 5'
			mesh = "models/skater_male/extra_backpack03.skin"
			is_backpack
		}
		{
			desc_id = #"0xCDF5F74F"
			frontend_desc = 'Backpack 6'
			mesh = "models/skater_male/extra_backpack03.skin"
			replace = "CAS_TZ_Backpack01.png"
			with = "textures/skater_male/CAS_TZ_Backpack01a.png"
			is_backpack
		}
		
	]
	
	
	
	
	
	
	
	
	
	
	
	
	
	
