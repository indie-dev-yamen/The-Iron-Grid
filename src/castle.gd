extends Node2D
var armor_broken_this_turn :=false
var owner_id:=0
var selection_type:="castle"
var got_resources:=false
var hp_d:=[values.fort_hp,values.castle_hp,values.mega_castle_hp]
var hp:=values.fort_hp
var armor_d:=values.fort_armor
var armor_c:=values.fort_armor
var level:=0
var income:=[values.fort_income,values.castle_income,values.mega_castle_income]
var bonus:=[values.earning_per_turn_bonus,values.earning_per_turn_bonus,values.earning_per_turn_bonus]
var population:=[values.fort_population,values.castle_population,values.mega_castle_population]
var u1_cost:=[values.castle_cost_food,values.castle_cost_wood,values.castle_cost_metal]
var u2_cost:=[values.mega_castle_cost_food,values.mega_castle_cost_wood,values.mega_castle_cost_metal]
var trained:=false
var images=[load("res://fort.png"),load("res://castle.png"),load("res://mega_castle.png"),load("res://null_50_50.tres")]
var pos:=Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("bg").texture=get_node("bg").texture.duplicate(true)
	match owner_id:
		1:
			get_node("bg").texture.gradient.set_color(0,Color(1.0,0.0,0.0,0.7))
		2:
			get_node("bg").texture.gradient.set_color(0,Color(0.0,0.0,1.0,0.7))
		3:
			get_node("bg").texture.gradient.set_color(0,Color(1.0,1.0,0.0,0.7))
		4:
			get_node("bg").texture.gradient.set_color(0,Color(1.0,0.0,1.0,0.7))
		5:
			get_node("bg").texture.gradient.set_color(0,Color(0.0,1.0,0.0,0.7))
			
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_node("MeshInstance2D").texture = images[level]
	if hp<=0:
		level=-1
	if armor_c<=0 and not armor_broken_this_turn:
		armor_broken_this_turn=true
		hp+=armor_c-armor_d
