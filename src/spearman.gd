extends Node2D

var hp:=values.spear_hp
var dmg:=values.spear_dmg
var horse_dmg:=values.spear_horse_dmg
var moves_d:=values.spear_moves
var moves_c:=0
var range:=1
var pop:=values.spear_pop
var armor_d:=values.spear_armor
var armor_c:=values.spear_armor
var cost:=[values.spear_cost_food,values.spear_cost_wood,values.spear_cost_metal]
var needs_level:=values.spear_level
var max:=15
var owner_id:=0
var pos:=Vector2(0,0)
var armor_broken_this_turn=false
var selection_type:="unit"
var attacks_d:=1
var attacks_c:=1

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
		get_parent().get_parent().units[owner_id-1].erase(self)
		get_parent().get_parent().grid2[pos.y][pos.x]=0
		queue_free()
	if armor_c<=0 and not armor_broken_this_turn:
		armor_broken_this_turn=true
		hp+=armor_c-armor_d
func move(npos):
	
				get_parent().get_parent().grid2[pos.y][pos.x]=0
				get_parent().get_parent().grid2[npos.y][npos.x]=self
				pos = npos
				global_transform.origin=Vector2(npos.x*64,npos.y*64)
				moves_c-=1
				
func attack(target_pos):
	var attacked:=false
	var target=get_parent().get_parent().grid2[target_pos.y][target_pos.x]
	if target.armor_c>0:
		if target.get_meta("horse",false):
			attacked=true
			attacks_c-=1
			target.armor_c-=horse_dmg
		else:
			attacked=true
			attacks_c-=1
			target.armor_c-=dmg
	else:
		if target.get_meta("horse",false):
			attacked=true
			attacks_c-=1
			target.hp-=horse_dmg
		else:
			attacked=true
			attacks_c-=1
			target.hp-=dmg
	
	return attacked
	
	
	
