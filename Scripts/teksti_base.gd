extends Node #copied code, not made on jam...

@export_node_path("Label") var tekstit
@export_node_path("Timer") var timer_a

var writing = false
var typewrite_spede = 1

@onready var teksti : Label = get_node(tekstit)
@onready var write_timer : Timer = get_node(timer_a)

func reset_write(texti):
	texti.set_visible_characters(0) #no characters
	write_timer.start()

func write_end(): #when writing is finished
	writing = false
	write_timer.stop() #stop writing

func abs_write(texti): #write letter by letter (longer texts take longer time)
	if texti.visible_characters < texti.get_total_character_count():
		writing = true
		texti.set_visible_characters(texti.get_visible_characters()+typewrite_spede)
	elif texti.visible_characters >= texti.get_total_character_count():
		#texti.set_visible_characters(txt.get_total_character_count())
		texti.set_visible_characters(-1) #make sure every character is visible now
		write_end()

func rel_write(texti): #write portion by portion (all texts take same time)
	if texti.get_visible_ratio() < 1.0:
		writing = true
		texti.set_visible_ratio(texti.get_visible_ratio()+0.05)
	else:
		write_end()
