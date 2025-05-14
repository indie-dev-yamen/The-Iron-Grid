extends Node2D

var hp:=values.horse_hp
var dmg:=values.horse_dmg
var moves_d:=values.horse_moves
var moves_c:=0
var range:=1
var pop:=values.horse_pop
var armor_d:=values.horse_armor
var armor_c:=values.horse_armor
var cost:=[values.horse_cost_food,values.horse_cost_wood,values.horse_cost_metal]
var needs_level:=values.horse_level
var max:=10
var owner_id:=0
var pos:=Vector2(0,0)
var armor_broken_this_turn=false
var selection_type:="unit"
var attacks_d:=1
var attacks_c:=1
var temp_pos:=Vector2(0,0)
var took_position_of=null

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
	get_parent().get_parent().grid2[pos.y][pos.x]=self
	if hp<=0:
		get_parent().get_parent().units[owner_id-1].erase(self)
		get_parent().get_parent().grid2[pos.y][pos.x]=0
		queue_free()
	if armor_c<=0 and not armor_broken_this_turn:
		armor_broken_this_turn=true
		hp+=armor_c-armor_d
func move(npos):
		if took_position_of:
			get_parent().get_parent().grid2[pos.y][pos.x]=took_position_of
			get_parent().get_parent().grid2[npos.y][npos.x]=self
			took_position_of=null
		else:
			get_parent().get_parent().grid2[pos.y][pos.x]=0
			get_parent().get_parent().grid2[npos.y][npos.x]=self
		pos = npos
		global_transform.origin=Vector2(npos.x*64,npos.y*64)
		moves_c-=1
				
func attack(target_pos):
	var attacked:=false
	var target=get_parent().get_parent().grid2[target_pos.y][target_pos.x]
	if (moves_c==1 and ((target.armor_c>0 and target.hp+target.armor_c+target.armor_d<=dmg)or(target.armor_c<=0 and target.hp<=dmg)))or(moves_c>1):
		if target.armor_c>0:
				attacked=true
				attacks_c-=1
				target.armor_c-=dmg
		else:
				attacked=true
				attacks_c-=1
				target.hp-=dmg
	if attacked:
		temp_pos=pos
		pos = target_pos
		if target.hp>0 or (armor_c<=0 and target.hp+target.armor_c-target.armor_d):
			took_position_of=target
		else:
			took_position_of=null
		get_parent().get_parent().grid2[temp_pos.y][temp_pos.x]=0
		
		global_transform.origin=Vector2(pos.x*64,pos.y*64)
		moves_c-=1
		
	
	return attacked

func reset_pos():
	var resetted:=false
	if took_position_of:
		get_parent().get_parent().grid2[temp_pos.y][temp_pos.x]=self
		get_parent().get_parent().grid2[pos.y][pos.x]=took_position_of
		pos = temp_pos
		global_transform.origin=Vector2(pos.x*64,pos.y*64)
		resetted=true
		took_position_of=null
	if not resetted:
		get_parent().get_parent().grid2[pos.y][pos.x]=self

		
		
	
