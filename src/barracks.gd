extends Node2D
var hp:=values.barracks_hp
var armor_d:=values.barracks_armor
var armor_c:=values.barracks_armor
var cost:=[values.barracks_cost_food,values.barracks_cost_wood,values.barracks_cost_metal]
var needs_level:=0
var max:=10
var owner_id:=0
var pos:=Vector2(0,0)
var armor_broken_this_turn=false
var trained:=false
var selection_type:="barracks"
var count_down:=3
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
	if hp<=0:
		set_meta("selectable",false)
		count_down-=1
		if count_down<0:
			get_parent().get_parent().buildings[owner_id-1].erase(self)
			get_parent().get_parent().grid2[pos.y][pos.x]=0
			queue_free()
	if armor_c<=0 and not armor_broken_this_turn:
		armor_broken_this_turn=true
		hp+=armor_c-armor_d
		
func turn_ended():
	trained=false
