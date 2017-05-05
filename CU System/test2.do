vsim -gui work.project_system


###################################ROM#############################################################
###################################################################################################

mem load -skip 0 -filltype value -filldata 000000 -fillradix hexadecimal /project_system/XmX/zz/rom

mem load -filltype value -filldata {086060 } -fillradix hexadecimal /project_system/XmX/zz/rom(0)		
mem load -filltype value -filldata {0001a1 } -fillradix hexadecimal /project_system/XmX/zz/rom(1)		
mem load -filltype value -filldata {530040 } -fillradix hexadecimal /project_system/XmX/zz/rom(2)		


#branch to Routine address
mem load -filltype value -filldata {600008 } -fillradix hexadecimal /project_system/XmX/zz/rom(3)		


######## Routine MOV #####################################################################

#branch to SRC fetch
mem load -filltype value -filldata {602006 } -fillradix hexadecimal /project_system/XmX/zz/rom(16)		

#branch to Write
mem load -filltype value -filldata {602806 } -fillradix hexadecimal /project_system/XmX/zz/rom(17)		


######## Routine ADD #####################################################################

#branch to SRC fetch
mem load -filltype value -filldata {602006 } -fillradix hexadecimal /project_system/XmX/zz/rom(32)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(33)		

mem load -filltype value -filldata {301000 } -fillradix hexadecimal /project_system/XmX/zz/rom(34)		
mem load -filltype value -filldata {550100 } -fillradix hexadecimal /project_system/XmX/zz/rom(35)		

#branch to save
mem load -filltype value -filldata {602c06 } -fillradix hexadecimal /project_system/XmX/zz/rom(36)		


######## Routine ADC #####################################################################

#branch to SRC fetch
mem load -filltype value -filldata {602006 } -fillradix hexadecimal /project_system/XmX/zz/rom(48)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(49)		

mem load -filltype value -filldata {301004 } -fillradix hexadecimal /project_system/XmX/zz/rom(50)		
mem load -filltype value -filldata {550100 } -fillradix hexadecimal /project_system/XmX/zz/rom(51)

#branch to save
mem load -filltype value -filldata {602c06 } -fillradix hexadecimal /project_system/XmX/zz/rom(52)		


######## Routine SUB #####################################################################

#branch to SRC fetch
mem load -filltype value -filldata {602006 } -fillradix hexadecimal /project_system/XmX/zz/rom(64)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(65)		

mem load -filltype value -filldata {301000 } -fillradix hexadecimal /project_system/XmX/zz/rom(66)		
mem load -filltype value -filldata {550280 } -fillradix hexadecimal /project_system/XmX/zz/rom(67)		

#branch to save
mem load -filltype value -filldata {602c06 } -fillradix hexadecimal /project_system/XmX/zz/rom(68)		


######## Routine SBC #####################################################################

#branch to SRC fetch
mem load -filltype value -filldata {602006 } -fillradix hexadecimal /project_system/XmX/zz/rom(80)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(81)		

mem load -filltype value -filldata {301000 } -fillradix hexadecimal /project_system/XmX/zz/rom(82)		
mem load -filltype value -filldata {550208 } -fillradix hexadecimal /project_system/XmX/zz/rom(83)	

#branch to save
mem load -filltype value -filldata {602c06 } -fillradix hexadecimal /project_system/XmX/zz/rom(84)		


######## Routine AND #####################################################################

#branch to SRC fetch
mem load -filltype value -filldata {602006 } -fillradix hexadecimal /project_system/XmX/zz/rom(96)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(97)		

mem load -filltype value -filldata {301000 } -fillradix hexadecimal /project_system/XmX/zz/rom(98)		
mem load -filltype value -filldata {550400 } -fillradix hexadecimal /project_system/XmX/zz/rom(99)		

#branch to save
mem load -filltype value -filldata {602c06 } -fillradix hexadecimal /project_system/XmX/zz/rom(100)		


######## Routine OR #####################################################################

#branch to SRC fetch
mem load -filltype value -filldata {602006 } -fillradix hexadecimal /project_system/XmX/zz/rom(112)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(113)		

mem load -filltype value -filldata {301000 } -fillradix hexadecimal /project_system/XmX/zz/rom(114)		
mem load -filltype value -filldata {550500 } -fillradix hexadecimal /project_system/XmX/zz/rom(115)		


#branch to save
mem load -filltype value -filldata {602c06 } -fillradix hexadecimal /project_system/XmX/zz/rom(116)		


######## Routine XOR #####################################################################

#branch to SRC fetch
mem load -filltype value -filldata {602006 } -fillradix hexadecimal /project_system/XmX/zz/rom(128)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(129)		

mem load -filltype value -filldata {301000 } -fillradix hexadecimal /project_system/XmX/zz/rom(130)		
mem load -filltype value -filldata {550600 } -fillradix hexadecimal /project_system/XmX/zz/rom(131)		

#branch to save
mem load -filltype value -filldata {602c06 } -fillradix hexadecimal /project_system/XmX/zz/rom(132)		


######## Routine TST #####################################################################

#branch to SRC fetch
mem load -filltype value -filldata {602006 } -fillradix hexadecimal /project_system/XmX/zz/rom(144)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(145)		

mem load -filltype value -filldata {301000 } -fillradix hexadecimal /project_system/XmX/zz/rom(146)		
mem load -filltype value -filldata {550410 } -fillradix hexadecimal /project_system/XmX/zz/rom(147)	



######## Routine CMP #####################################################################

#branch to SRC fetch
mem load -filltype value -filldata {602006 } -fillradix hexadecimal /project_system/XmX/zz/rom(160)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(161)		

mem load -filltype value -filldata {301000 } -fillradix hexadecimal /project_system/XmX/zz/rom(162)		
mem load -filltype value -filldata {550280 } -fillradix hexadecimal /project_system/XmX/zz/rom(163)	

############################################################################################




######## Routine INC #####################################################################

#branch to SRC fetch  => No Src to fetch 
mem load -filltype value -filldata {000000 } -fillradix hexadecimal /project_system/XmX/zz/rom(176)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(177)		

mem load -filltype value -filldata {552110 } -fillradix hexadecimal /project_system/XmX/zz/rom(178)		

#branch to save
mem load -filltype value -filldata {602c06 } -fillradix hexadecimal /project_system/XmX/zz/rom(179)		


######## Routine DEC #####################################################################

#branch to SRC fetch  => No Src to fetch 
mem load -filltype value -filldata {000000 } -fillradix hexadecimal /project_system/XmX/zz/rom(192)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(193)		

mem load -filltype value -filldata {552300 } -fillradix hexadecimal /project_system/XmX/zz/rom(194)		

#branch to save
mem load -filltype value -filldata {602c06 } -fillradix hexadecimal /project_system/XmX/zz/rom(195)		


######## Routine CLR #####################################################################

#CLear temp
mem load -filltype value -filldata {050f00 } -fillradix hexadecimal /project_system/XmX/zz/rom(208)		
		
#branch to Write
mem load -filltype value -filldata {602806 } -fillradix hexadecimal /project_system/XmX/zz/rom(209)	

######## Routine INV #####################################################################

#branch to SRC fetch  => No Src to fetch 
mem load -filltype value -filldata {000000 } -fillradix hexadecimal /project_system/XmX/zz/rom(224)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(225)		

mem load -filltype value -filldata {552700 } -fillradix hexadecimal /project_system/XmX/zz/rom(226)		

#branch to save
mem load -filltype value -filldata {602c06 } -fillradix hexadecimal /project_system/XmX/zz/rom(227)		


######## Routine LSR #####################################################################

#branch to SRC fetch  => No Src to fetch 
mem load -filltype value -filldata {000000 } -fillradix hexadecimal /project_system/XmX/zz/rom(240)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(241)		

mem load -filltype value -filldata {552800 } -fillradix hexadecimal /project_system/XmX/zz/rom(242)		

#branch to save
mem load -filltype value -filldata {602c06 } -fillradix hexadecimal /project_system/XmX/zz/rom(243)		


######## Routine ROR #####################################################################

#branch to SRC fetch  => No Src to fetch 
mem load -filltype value -filldata {000000 } -fillradix hexadecimal /project_system/XmX/zz/rom(256)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(257)		

mem load -filltype value -filldata {552900 } -fillradix hexadecimal /project_system/XmX/zz/rom(258)		

#branch to save
mem load -filltype value -filldata {602c06 } -fillradix hexadecimal /project_system/XmX/zz/rom(259)		


######## Routine RRC #####################################################################

#branch to SRC fetch  => No Src to fetch 
mem load -filltype value -filldata {000000 } -fillradix hexadecimal /project_system/XmX/zz/rom(272)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(273)		

mem load -filltype value -filldata {552A00 } -fillradix hexadecimal /project_system/XmX/zz/rom(274)		

#branch to save
mem load -filltype value -filldata {602c06 } -fillradix hexadecimal /project_system/XmX/zz/rom(275)		


######## Routine ASR #####################################################################

#branch to SRC fetch  => No Src to fetch 
mem load -filltype value -filldata {000000 } -fillradix hexadecimal /project_system/XmX/zz/rom(288)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(289)		

mem load -filltype value -filldata {552B00 } -fillradix hexadecimal /project_system/XmX/zz/rom(290)		

#branch to save
mem load -filltype value -filldata {602c06 } -fillradix hexadecimal /project_system/XmX/zz/rom(291)		


######## Routine LSL #####################################################################

#branch to SRC fetch  => No Src to fetch 
mem load -filltype value -filldata {000000 } -fillradix hexadecimal /project_system/XmX/zz/rom(304)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(305)		

mem load -filltype value -filldata {352C00 } -fillradix hexadecimal /project_system/XmX/zz/rom(306)		

#branch to save
mem load -filltype value -filldata {602c06 } -fillradix hexadecimal /project_system/XmX/zz/rom(307)		


######## Routine ROL #####################################################################

#branch to SRC fetch  => No Src to fetch 
mem load -filltype value -filldata {000000 } -fillradix hexadecimal /project_system/XmX/zz/rom(320)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(321)		

mem load -filltype value -filldata {352D00 } -fillradix hexadecimal /project_system/XmX/zz/rom(322)		

#branch to save
mem load -filltype value -filldata {602c06 } -fillradix hexadecimal /project_system/XmX/zz/rom(323)		


######## Routine RLC #####################################################################

#branch to SRC fetch  => No Src to fetch 
mem load -filltype value -filldata {000000 } -fillradix hexadecimal /project_system/XmX/zz/rom(336)		

#branch to DST fetch
mem load -filltype value -filldata {602406 } -fillradix hexadecimal /project_system/XmX/zz/rom(337)		

mem load -filltype value -filldata {552E00 } -fillradix hexadecimal /project_system/XmX/zz/rom(338)		

#branch to save
mem load -filltype value -filldata {602c06 } -fillradix hexadecimal /project_system/XmX/zz/rom(339)		

###########################################################################################


######## Routine BR #####################################################################

#branch to SRC fetch  => No Src to fetch 
mem load -filltype value -filldata {001173 } -fillradix hexadecimal /project_system/XmX/zz/rom(352)		


######## Routine BEQ #####################################################################

#branch to SRC fetch  => No Src to fetch 
mem load -filltype value -filldata {001060 } -fillradix hexadecimal /project_system/XmX/zz/rom(368)		
mem load -filltype value -filldata {000113 } -fillradix hexadecimal /project_system/XmX/zz/rom(369)		
	

######## Routine BNE #####################################################################

#branch to SRC fetch  => No Src to fetch 
mem load -filltype value -filldata {001060 } -fillradix hexadecimal /project_system/XmX/zz/rom(384)		
mem load -filltype value -filldata {000113 } -fillradix hexadecimal /project_system/XmX/zz/rom(385)		
	
	

######## Routine BLO #####################################################################

#branch to SRC fetch  => No Src to fetch 
mem load -filltype value -filldata {001060 } -fillradix hexadecimal /project_system/XmX/zz/rom(400)		
mem load -filltype value -filldata {000113 } -fillradix hexadecimal /project_system/XmX/zz/rom(401)		
	

######## Routine BLS #####################################################################

#branch to SRC fetch  => No Src to fetch 
mem load -filltype value -filldata {001060 } -fillradix hexadecimal /project_system/XmX/zz/rom(416)		
mem load -filltype value -filldata {000113 } -fillradix hexadecimal /project_system/XmX/zz/rom(417)		


######## Routine BHI #####################################################################

#branch to SRC fetch  => No Src to fetch 
mem load -filltype value -filldata {001060 } -fillradix hexadecimal /project_system/XmX/zz/rom(432)		
mem load -filltype value -filldata {000113 } -fillradix hexadecimal /project_system/XmX/zz/rom(433)		


######## Routine BHS #####################################################################

#branch to SRC fetch  => No Src to fetch 
mem load -filltype value -filldata {001060 } -fillradix hexadecimal /project_system/XmX/zz/rom(448)		
mem load -filltype value -filldata {000113 } -fillradix hexadecimal /project_system/XmX/zz/rom(449)		
	

####### fetch SRC blocks ##########

########################################123456#######
#MODE 1
	mem load -filltype value -filldata {150040 } -fillradix hexadecimal /project_system/XmX/zz/rom(512)		
	#MBI to return from src
	mem load -filltype value -filldata {60001c } -fillradix hexadecimal /project_system/XmX/zz/rom(513)		
		

#MODE 2 
	mem load -filltype value -filldata {186040 } -fillradix hexadecimal /project_system/XmX/zz/rom(520)		
	mem load -filltype value -filldata {110180 } -fillradix hexadecimal /project_system/XmX/zz/rom(521)		#here was 010180
	mem load -filltype value -filldata {550040 } -fillradix hexadecimal /project_system/XmX/zz/rom(522)		
		
	#MBI to return from src
	mem load -filltype value -filldata {60001c } -fillradix hexadecimal /project_system/XmX/zz/rom(523)		
	

#MODE 3
	mem load -filltype value -filldata {1964c0 } -fillradix hexadecimal /project_system/XmX/zz/rom(528)		
	mem load -filltype value -filldata {550040 } -fillradix hexadecimal /project_system/XmX/zz/rom(529)		
	#MBI to return from src
	mem load -filltype value -filldata {60001c } -fillradix hexadecimal /project_system/XmX/zz/rom(530)		
	
#MODE 4
	mem load -filltype value -filldata {086060 } -fillradix hexadecimal /project_system/XmX/zz/rom(536)		
	mem load -filltype value -filldata {100181 } -fillradix hexadecimal /project_system/XmX/zz/rom(537)		#here was 000181
	mem load -filltype value -filldata {501000 } -fillradix hexadecimal /project_system/XmX/zz/rom(538)		
	mem load -filltype value -filldata {184100 } -fillradix hexadecimal /project_system/XmX/zz/rom(539)		
	mem load -filltype value -filldata {550040 } -fillradix hexadecimal /project_system/XmX/zz/rom(540)		
	#MBI to return from src
	mem load -filltype value -filldata {60001c } -fillradix hexadecimal /project_system/XmX/zz/rom(541)		
	
#MODE 5
	mem load -filltype value -filldata {184040 } -fillradix hexadecimal /project_system/XmX/zz/rom(544)		
	mem load -filltype value -filldata {550040 } -fillradix hexadecimal /project_system/XmX/zz/rom(545)		
	#MBI to return from src
	mem load -filltype value -filldata {60001c } -fillradix hexadecimal /project_system/XmX/zz/rom(546)		
	
#MODE 6
	mem load -filltype value -filldata {186080 } -fillradix hexadecimal /project_system/XmX/zz/rom(552)		
	mem load -filltype value -filldata {110180 } -fillradix hexadecimal /project_system/XmX/zz/rom(553)		#here was 010180
	mem load -filltype value -filldata {584040 } -fillradix hexadecimal /project_system/XmX/zz/rom(554)		
	mem load -filltype value -filldata {550040 } -fillradix hexadecimal /project_system/XmX/zz/rom(556)				
	#MBI to return from src
	mem load -filltype value -filldata {60001c } -fillradix hexadecimal /project_system/XmX/zz/rom(557)		
	
#MODE 7
	mem load -filltype value -filldata {196240 } -fillradix hexadecimal /project_system/XmX/zz/rom(560)		
	mem load -filltype value -filldata {584040 } -fillradix hexadecimal /project_system/XmX/zz/rom(561)		
	mem load -filltype value -filldata {550040 } -fillradix hexadecimal /project_system/XmX/zz/rom(562)		
	#MBI to return from src
	mem load -filltype value -filldata {60001c } -fillradix hexadecimal /project_system/XmX/zz/rom(563)		
	
#MODE 8
	mem load -filltype value -filldata {086060 } -fillradix hexadecimal /project_system/XmX/zz/rom(568)		
	mem load -filltype value -filldata {100181 } -fillradix hexadecimal /project_system/XmX/zz/rom(569)		#here was 000181
	mem load -filltype value -filldata {501000 } -fillradix hexadecimal /project_system/XmX/zz/rom(570)		
	mem load -filltype value -filldata {184100 } -fillradix hexadecimal /project_system/XmX/zz/rom(571)		
	mem load -filltype value -filldata {584040 } -fillradix hexadecimal /project_system/XmX/zz/rom(572)		
	mem load -filltype value -filldata {550040 } -fillradix hexadecimal /project_system/XmX/zz/rom(573)	
	#MBI to return from src
	mem load -filltype value -filldata {60001c } -fillradix hexadecimal /project_system/XmX/zz/rom(574)		
	


####### fetch DST blocks ##########

#MODE 1
	mem load -filltype value -filldata {240040 } -fillradix hexadecimal /project_system/XmX/zz/rom(576)		
	#MBI to return from dst
	mem load -filltype value -filldata {60002c } -fillradix hexadecimal /project_system/XmX/zz/rom(577)		
	

#MODE 2
	mem load -filltype value -filldata {286040 } -fillradix hexadecimal /project_system/XmX/zz/rom(584)		
	mem load -filltype value -filldata {220180 } -fillradix hexadecimal /project_system/XmX/zz/rom(585)		#here was 020180
	#MBI to return from dst
	mem load -filltype value -filldata {60002c } -fillradix hexadecimal /project_system/XmX/zz/rom(586)		
	

#MODE 3
	mem load -filltype value -filldata {2a6240 } -fillradix hexadecimal /project_system/XmX/zz/rom(592)		
	#MBI to return from dst
	mem load -filltype value -filldata {60002c } -fillradix hexadecimal /project_system/XmX/zz/rom(593)		
	
	
#MODE 4
	mem load -filltype value -filldata {086060 } -fillradix hexadecimal /project_system/XmX/zz/rom(600)		
	mem load -filltype value -filldata {200181 } -fillradix hexadecimal /project_system/XmX/zz/rom(601)		#here was 000181
	mem load -filltype value -filldata {501000 } -fillradix hexadecimal /project_system/XmX/zz/rom(602)		
	mem load -filltype value -filldata {284100 } -fillradix hexadecimal /project_system/XmX/zz/rom(603)		
	#MBI to return from dst
	mem load -filltype value -filldata {60002c } -fillradix hexadecimal /project_system/XmX/zz/rom(604)		
	
	
#MODE 5
	mem load -filltype value -filldata {284040 } -fillradix hexadecimal /project_system/XmX/zz/rom(608)		
	#MBI to return from dst
	mem load -filltype value -filldata {60002c } -fillradix hexadecimal /project_system/XmX/zz/rom(609)		
	
	
#MODE 6
	mem load -filltype value -filldata {286040 } -fillradix hexadecimal /project_system/XmX/zz/rom(616)		
	mem load -filltype value -filldata {220180 } -fillradix hexadecimal /project_system/XmX/zz/rom(617)		#here was 020180
	mem load -filltype value -filldata {584040 } -fillradix hexadecimal /project_system/XmX/zz/rom(618)		
	#MBI to return from dst
	mem load -filltype value -filldata {60002c } -fillradix hexadecimal /project_system/XmX/zz/rom(619)		
	
	
#MODE 7
	mem load -filltype value -filldata {2a6240 } -fillradix hexadecimal /project_system/XmX/zz/rom(624)		
	mem load -filltype value -filldata {584040 } -fillradix hexadecimal /project_system/XmX/zz/rom(625)		
	#MBI to return from dst
	mem load -filltype value -filldata {60002c } -fillradix hexadecimal /project_system/XmX/zz/rom(626)		
	
	
#MODE 8
	mem load -filltype value -filldata {086060 } -fillradix hexadecimal /project_system/XmX/zz/rom(632)		
	mem load -filltype value -filldata {200281 } -fillradix hexadecimal /project_system/XmX/zz/rom(633)		#here was 000281
	mem load -filltype value -filldata {501000 } -fillradix hexadecimal /project_system/XmX/zz/rom(634)		
	mem load -filltype value -filldata {284100 } -fillradix hexadecimal /project_system/XmX/zz/rom(635)		
	mem load -filltype value -filldata {584040 } -fillradix hexadecimal /project_system/XmX/zz/rom(636)		
	#MBI to return from dst
	mem load -filltype value -filldata {60002c } -fillradix hexadecimal /project_system/XmX/zz/rom(637)		
	


####### Write DST blocks ##########

#MODE 1
	mem load -filltype value -filldata {320050 } -fillradix hexadecimal /project_system/XmX/zz/rom(640)		
	# End signal Activated
	
#MODE 2
	mem load -filltype value -filldata {340040 } -fillradix hexadecimal /project_system/XmX/zz/rom(648)		
	mem load -filltype value -filldata {28A040 } -fillradix hexadecimal /project_system/XmX/zz/rom(649)		
	mem load -filltype value -filldata {220190 } -fillradix hexadecimal /project_system/XmX/zz/rom(650)		#here was 020190
	
#MODE 3
	mem load -filltype value -filldata {340040 } -fillradix hexadecimal /project_system/XmX/zz/rom(656)		
	mem load -filltype value -filldata {2AA340 } -fillradix hexadecimal /project_system/XmX/zz/rom(657)		
	mem load -filltype value -filldata {252340 } -fillradix hexadecimal /project_system/XmX/zz/rom(658)		
	mem load -filltype value -filldata {320010 } -fillradix hexadecimal /project_system/XmX/zz/rom(659)		
	
#MODE 4
	mem load -filltype value -filldata {086060 } -fillradix hexadecimal /project_system/XmX/zz/rom(664)		
	mem load -filltype value -filldata {200181 } -fillradix hexadecimal /project_system/XmX/zz/rom(665)		#here was 200181
	mem load -filltype value -filldata {501000 } -fillradix hexadecimal /project_system/XmX/zz/rom(666)		
	mem load -filltype value -filldata {280100 } -fillradix hexadecimal /project_system/XmX/zz/rom(667)		
	mem load -filltype value -filldata {348050 } -fillradix hexadecimal /project_system/XmX/zz/rom(668)		

#MODE 5
	mem load -filltype value -filldata {340040 } -fillradix hexadecimal /project_system/XmX/zz/rom(672)		
	mem load -filltype value -filldata {288050 } -fillradix hexadecimal /project_system/XmX/zz/rom(673)		
	
#MODE 6
	mem load -filltype value -filldata {286040 } -fillradix hexadecimal /project_system/XmX/zz/rom(680)		
	mem load -filltype value -filldata {220180 } -fillradix hexadecimal /project_system/XmX/zz/rom(681)		#here was 020180
	mem load -filltype value -filldata {580080 } -fillradix hexadecimal /project_system/XmX/zz/rom(682)		
	mem load -filltype value -filldata {348050 } -fillradix hexadecimal /project_system/XmX/zz/rom(683)		
	
#MODE 7
	mem load -filltype value -filldata {2A6240 } -fillradix hexadecimal /project_system/XmX/zz/rom(688)		
	mem load -filltype value -filldata {580040 } -fillradix hexadecimal /project_system/XmX/zz/rom(689)		
	mem load -filltype value -filldata {348050 } -fillradix hexadecimal /project_system/XmX/zz/rom(690)		
	
#MODE 8
	mem load -filltype value -filldata {086060 } -fillradix hexadecimal /project_system/XmX/zz/rom(696)		
	mem load -filltype value -filldata {200181 } -fillradix hexadecimal /project_system/XmX/zz/rom(697)		#here was 000181
	mem load -filltype value -filldata {501000 } -fillradix hexadecimal /project_system/XmX/zz/rom(698)		
	mem load -filltype value -filldata {284100 } -fillradix hexadecimal /project_system/XmX/zz/rom(699)		
	mem load -filltype value -filldata {580040 } -fillradix hexadecimal /project_system/XmX/zz/rom(700)		
	mem load -filltype value -filldata {348050 } -fillradix hexadecimal /project_system/XmX/zz/rom(701)		




####### Save blocks ##########

#save result 1
	mem load -filltype value -filldata {320410 } -fillradix hexadecimal /project_system/XmX/zz/rom(704)		

#save result 2
	mem load -filltype value -filldata {348410 } -fillradix hexadecimal /project_system/XmX/zz/rom(706) 	

########################################################################################
###################################ROM#############################################################
###################################################################################################


add wave -position insertpoint  \
sim:/project_system/Rest_Y \
sim:/project_system/read_memory \
sim:/project_system/write_memory \
sim:/project_system/Y_in \
sim:/project_system/R1_In \
sim:/project_system/R2_In \
sim:/project_system/R3_In \
sim:/project_system/R4_In \
sim:/project_system/R1_Out \
sim:/project_system/R2_Out \
sim:/project_system/R3_Out \
sim:/project_system/R4_Out \
sim:/project_system/TEMP_Out \
sim:/project_system/TEMP_In \
sim:/project_system/MAR_In \
sim:/project_system/MDR_In \
sim:/project_system/MDR_Out \
sim:/project_system/Alu_Select \
sim:/project_system/Alu_Cin \
sim:/project_system/X_enable \
sim:/project_system/IR_IN \
sim:/project_system/IR_Address_Out \
sim:/project_system/Rest_Temp \
sim:/project_system/system_clock \
sim:/project_system/R1_data_Out \
sim:/project_system/R2_data_Out \
sim:/project_system/R3_data_Out \
sim:/project_system/R4_data_Out \
sim:/project_system/TEMP_data_Out \
sim:/project_system/MAR_data_Out \
sim:/project_system/MDR_data_Out \
sim:/project_system/MDR_data_IN \
sim:/project_system/Memory_data_Out \
sim:/project_system/Y_data_Out


###################################RAM#############################################################
mem load -i C:/Users/sherifmagdy/Desktop/Arch/OURProj/AssemRam.mem /project_system/u18/ram

###################################CLOCKS##########################################################
force -freeze sim:/project_system/system_clock 1 0, 0 {50 ps} -r 100
force -freeze sim:/project_system/memory_clock 0 0, 1 {50 ps} -r 100




add wave -position insertpoint  \
sim:/cu/IR
add wave -position insertpoint  \
sim:/cu/ClocK
add wave -position insertpoint  \
sim:/cu/Reset


add wave -position insertpoint  \
sim:/cu/MPCIN
add wave -position insertpoint  \
sim:/cu/address


add wave -position insertpoint  \
sim:/cu/CW

add wave -position insertpoint  \
sim:/cu/Csignals

add wave -position insertpoint  \
sim:/cu/MPI

add wave -position insertpoint  \
sim:/cu/N

add wave -position insertpoint  \
sim:/cu/M

add wave -position insertpoint  \
sim:/cu/X

add wave -position insertpoint  \
sim:/cu/Level1IN3

add wave -position insertpoint  \
sim:/cu/Level1IN2
add wave -position insertpoint  \
sim:/cu/Level1IN1

add wave -position insertpoint  \
sim:/cu/ORing
add wave -position insertpoint  \
sim:/cu/saveresult

add wave -position insertpoint  \
sim:/cu/Endsignal


# force IR to specific opcode
###################################||---||---
force -freeze sim:/cu/IR 16'b0000100000000001 0


force -freeze sim:/cu/Endsignal 1 0
run

noforce sim:/cu/ENDSignal
run 2200





