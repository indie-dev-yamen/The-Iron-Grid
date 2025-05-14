extends Node2D

var castle := load("res://castle.tscn")
var spear_man:=load("res://spearman.tscn")
var horse_man:=load("res://horseman.tscn")
var musketeer:=load("res://musketeer.tscn")
var cannon:=load("res://cannon.tscn")
var knight:=load("res://knight.tscn")



var farm:=load("res://farm.tscn")
var barracks:=load("res://barracks.tscn")
var mine:=load("res://mine.tscn")
var wall_wood:=load("res://wall_wood.tscn")
var wall_stone:=load("res://wall_stone.tscn")





var fort_png := load("res://fort.png")
var castle_png := load("res://castle.png")
var mega_castle_png := load("res://mega_castle.png")

var wheat_png :=load("res://wheat.png")
var wood_png :=load("res://wood.png")
var metal_png :=load("res://metal.png")

var spear_png:=load("res://spearman.png")
var horse_png:=load("res://horse.png")
var musket_png:=load("res://musket.png")
var cannon_png:=load("res://cannon.png")
var knight_png:=load("res://knight.png")


var null_png:=load("res://null_50_50.tres")

var right_png :=load("res://right_off.png")
var target_png :=load("res://target.jpg")

var barracks_png :=load("res://barracks.png")
var farm_png :=load("res://farm.png")
var mine_png :=load("res://mine.png")
var wall_wood_png :=load("res://wood_wall.jpg")
var wall_stone_png :=load("res://stone_wall.png")


var state:=0
var selection_mode:="none"
var selected=null
var queued_after_select_position:=[]
var selecting_point_from_within:=[]
var selecting_for:="unit"
var latest_pos:=Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#add_child
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if selected:
		if selected.hp<=0:
			selected=null
			selection_mode="none"
		else:
			get_node("selected").texture_normal=selected.get_node("MeshInstance2D").texture
	else:
		get_node("selected").texture_normal=null_png
	if selection_mode=="castle":
		if Input.is_action_just_released("sa1"):
			if get_parent().castles[get_parent().current_turn-1].got_resources==false:
				get_parent().resources[get_parent().current_turn-1][0]+=get_parent().castles[get_parent().current_turn-1].income[selected.level]
				get_parent().castles[get_parent().current_turn-1].got_resources=true
		if Input.is_action_just_released("sa2"):
			if get_parent().castles[get_parent().current_turn-1].got_resources==false:
				get_parent().resources[get_parent().current_turn-1][1]+=get_parent().castles[get_parent().current_turn-1].income[selected.level]
				get_parent().castles[get_parent().current_turn-1].got_resources=true
		if Input.is_action_just_released("sa3"):
			if get_parent().castles[get_parent().current_turn-1].got_resources==false:
				get_parent().resources[get_parent().current_turn-1][2]+=get_parent().castles[get_parent().current_turn-1].income[selected.level]
				get_parent().castles[get_parent().current_turn-1].got_resources=true
		if Input.is_action_just_released("sa4"):
			if get_parent().castles[get_parent().current_turn-1].level==0:
				if get_parent().resources[get_parent().current_turn-1][0]>=selected.u1_cost[0] and get_parent().resources[get_parent().current_turn-1][1]>=selected.u1_cost[1] and get_parent().resources[get_parent().current_turn-1][2]>=selected.u1_cost[2]:
					selected.level=1
					get_parent().resources[get_parent().current_turn-1][0]-=selected.u1_cost[0]
					get_parent().resources[get_parent().current_turn-1][1]-=selected.u1_cost[1]
					get_parent().resources[get_parent().current_turn-1][2]-=selected.u1_cost[2]
					selected.hp=selected.hp_d[selected.level]
			elif get_parent().castles[get_parent().current_turn-1].level==1:
				if get_parent().resources[get_parent().current_turn-1][0]>=selected.u2_cost[0] and get_parent().resources[get_parent().current_turn-1][1]>=selected.u2_cost[1] and get_parent().resources[get_parent().current_turn-1][2]>=selected.u2_cost[2]:
					selected.level=2
					get_parent().resources[get_parent().current_turn-1][0]-=selected.u2_cost[0]
					get_parent().resources[get_parent().current_turn-1][1]-=selected.u2_cost[1]
					get_parent().resources[get_parent().current_turn-1][2]-=selected.u2_cost[2]
					selected.hp=selected.hp_d[selected.level]
		if Input.is_action_just_released("sa5"):
			var inst = spear_man.instantiate()
			if selected.level>=inst.needs_level and not selected.trained and get_parent().used_population()+inst.pop<=selected.population[selected.level] :
				if get_parent().resources[get_parent().current_turn-1][0]>=inst.cost[0] and get_parent().resources[get_parent().current_turn-1][1]>=inst.cost[1] and get_parent().resources[get_parent().current_turn-1][2]>=inst.cost[2]:
					queued_after_select_position=["summon",inst,selected]
					selecting_for="unit_summon"
					selecting_point_from_within=[1,selected.pos]
					selection_mode="choosing_pos"
		if Input.is_action_just_released("sa6"):
			var inst = horse_man.instantiate()
			if selected.level>=inst.needs_level and not selected.trained and get_parent().used_population()+inst.pop<=selected.population[selected.level]:
				if get_parent().resources[get_parent().current_turn-1][0]>=inst.cost[0] and get_parent().resources[get_parent().current_turn-1][1]>=inst.cost[1] and get_parent().resources[get_parent().current_turn-1][2]>=inst.cost[2]:
					queued_after_select_position=["summon",inst,selected]
					selecting_for="unit_summon"
					selecting_point_from_within=[1,selected.pos]
					selection_mode="choosing_pos"
		get_node("special_action1").texture_normal=wheat_png
		get_node("special_action2").texture_normal=wood_png
		get_node("special_action3").texture_normal=metal_png
		if get_parent().castles[get_parent().current_turn-1].level==0:
			get_node("special_action4").texture_normal=castle_png
		elif get_parent().castles[get_parent().current_turn-1].level==1:
			get_node("special_action4").texture_normal=mega_castle_png
		else:
			get_node("special_action4").texture_normal=null_png
		get_node("special_action5").texture_normal=spear_png
		get_node("special_action6").texture_normal=horse_png
		get_node("special_action7").texture_normal=null_png
		get_node("special_action8").texture_normal=null_png
		get_node("info").text="health:\n"+str(selected.hp)+"\npopulation:\n"+str(get_parent().used_population())+" / "+str(selected.population[selected.level])
	elif selection_mode=="choosing_pos":
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				var pos :Vector2= get_global_mouse_position()
				var grid_pos = Vector2(int((pos.x+32)/64),int((pos.y+32)/64))
				if grid_pos.x>=0 and grid_pos.y>=0 and grid_pos.x<get_parent().get_node("level").size.x and grid_pos.y<get_parent().get_node("level").size.y:
					if selecting_for=="unit_summon":
						
						if abs(grid_pos.x-selecting_point_from_within[1].x)<=selecting_point_from_within[0] and abs(grid_pos.y-selecting_point_from_within[1].y)<=selecting_point_from_within[0] and grid_pos!=selecting_point_from_within[1]:
							if get_parent().get_node("level").grid[grid_pos.y][grid_pos.x]==0 and not get_parent().grid2[grid_pos.y][grid_pos.x]:
								latest_pos=grid_pos
								if queued_after_select_position[0]=="summon":
									queued_after_select_position[2].trained=true
									get_parent().resources[get_parent().current_turn-1][0]-=queued_after_select_position[1].cost[0]
									get_parent().resources[get_parent().current_turn-1][1]-=queued_after_select_position[1].cost[1]
									get_parent().resources[get_parent().current_turn-1][2]-=queued_after_select_position[1].cost[2]
									queued_after_select_position[1].global_transform.origin=Vector2(grid_pos.x*64,grid_pos.y*64)
									queued_after_select_position[1].pos=grid_pos
									queued_after_select_position[1].owner_id=get_parent().current_turn
									get_parent().get_node("level").add_child(queued_after_select_position[1])
									selection_mode="none"
									get_parent().grid2[grid_pos.y][grid_pos.x]=queued_after_select_position[1]
									get_parent().units[get_parent().current_turn-1].append(queued_after_select_position[1])
					elif selecting_for=="unit_move":
						if abs(selecting_point_from_within[1].x-grid_pos.x)<=1 and abs(selecting_point_from_within[1].y-grid_pos.y)<=1 and grid_pos!=selecting_point_from_within[1]:
							if get_parent().get_node("level").grid[grid_pos.y][grid_pos.x]==0 and not get_parent().grid2[grid_pos.y][grid_pos.x]:
								latest_pos=grid_pos
								if queued_after_select_position[0]=="move":
									queued_after_select_position[1].move(grid_pos)
									selected=queued_after_select_position[1]
									selection_mode="unit"
					elif selecting_for=="unit_attack":
						if abs(selecting_point_from_within[1].x-grid_pos.x)<=1 and abs(selecting_point_from_within[1].y-grid_pos.y)<=1 and grid_pos!=selecting_point_from_within[1]:
							if get_parent().grid2[grid_pos.y][grid_pos.x] or queued_after_select_position[1].range>1 :
								latest_pos=grid_pos
								if queued_after_select_position[0]=="attack":
									var attacked:bool=queued_after_select_position[1].attack(grid_pos)
									if attacked:
										selected=queued_after_select_position[1]
										selection_mode="unit"
					elif selecting_for=="build":
						
						if abs(grid_pos.x-selecting_point_from_within[1].x)<=selecting_point_from_within[0] and abs(grid_pos.y-selecting_point_from_within[1].y)<=selecting_point_from_within[0] and grid_pos!=selecting_point_from_within[1]:
							if get_parent().get_node("level").grid[grid_pos.y][grid_pos.x]==0 and not get_parent().grid2[grid_pos.y][grid_pos.x]:
								latest_pos=grid_pos
								if queued_after_select_position[0]=="build":
									get_parent().resources[get_parent().current_turn-1][0]-=queued_after_select_position[1].cost[0]
									get_parent().resources[get_parent().current_turn-1][1]-=queued_after_select_position[1].cost[1]
									get_parent().resources[get_parent().current_turn-1][2]-=queued_after_select_position[1].cost[2]
									queued_after_select_position[1].global_transform.origin=Vector2(grid_pos.x*64,grid_pos.y*64)
									queued_after_select_position[1].pos=grid_pos
									queued_after_select_position[1].owner_id=get_parent().current_turn
									get_parent().get_node("level").add_child(queued_after_select_position[1])
									selection_mode="unit"
									selected=queued_after_select_position[2]
									get_parent().grid2[grid_pos.y][grid_pos.x]=queued_after_select_position[1]
									get_parent().buildings[get_parent().current_turn-1].append(queued_after_select_position[1])
					elif selecting_for=="build_mine":
						
						if abs(grid_pos.x-selecting_point_from_within[1].x)<=selecting_point_from_within[0] and abs(grid_pos.y-selecting_point_from_within[1].y)<=selecting_point_from_within[0] and grid_pos!=selecting_point_from_within[1]:
							if get_parent().get_node("level").grid[grid_pos.y][grid_pos.x]!=0 and not get_parent().grid2[grid_pos.y][grid_pos.x]:
								latest_pos=grid_pos
								if queued_after_select_position[0]=="build":
									get_parent().resources[get_parent().current_turn-1][0]-=queued_after_select_position[1].cost[0]
									get_parent().resources[get_parent().current_turn-1][1]-=queued_after_select_position[1].cost[1]
									get_parent().resources[get_parent().current_turn-1][2]-=queued_after_select_position[1].cost[2]
									queued_after_select_position[1].global_transform.origin=Vector2(grid_pos.x*64,grid_pos.y*64)
									queued_after_select_position[1].pos=grid_pos
									queued_after_select_position[1].owner_id=get_parent().current_turn
									get_parent().get_node("level").add_child(queued_after_select_position[1])
									selection_mode="unit"
									selected=queued_after_select_position[2]
									get_parent().grid2[grid_pos.y][grid_pos.x]=queued_after_select_position[1]
									get_parent().buildings[get_parent().current_turn-1].append(queued_after_select_position[1])
			
										
		get_node("special_action1").texture_normal=null_png
		get_node("special_action2").texture_normal=null_png
		get_node("special_action3").texture_normal=null_png
		get_node("special_action4").texture_normal=null_png
		get_node("special_action5").texture_normal=null_png
		get_node("special_action6").texture_normal=null_png
		get_node("special_action7").texture_normal=null_png
		get_node("special_action8").texture_normal=null_png
		get_node("info").text="choose a\n position"
		
	elif selection_mode=="unit":
		get_node("special_action1").texture_normal=right_png
		get_node("special_action2").texture_normal=target_png
		get_node("special_action3").texture_normal=barracks_png
		get_node("special_action4").texture_normal=wall_stone_png
		get_node("special_action5").texture_normal=farm_png
		get_node("special_action6").texture_normal=mine_png
		get_node("special_action7").texture_normal=wall_wood_png
		get_node("special_action8").texture_normal=null_png
		get_node("info").text="health:\n"+str(selected.hp)+"\nmoves:\n"+str(selected.moves_c)
	
		if Input.is_action_just_released("sa1"):
			if selected.moves_c>0:
				queued_after_select_position=["move",selected]
				selecting_for="unit_move"
				selecting_point_from_within=[1,selected.pos]
				selection_mode="choosing_pos"
		if Input.is_action_just_released("sa2"):
			if selected.attacks_c>0:
				queued_after_select_position=["attack",selected]
				selecting_for="unit_attack"
				selecting_point_from_within=[1,selected.pos]
				selection_mode="choosing_pos"
		if Input.is_action_just_released("sa3"):
			var inst = barracks.instantiate()
			if get_parent().castles[get_parent().current_turn-1].level>=inst.needs_level:
				if get_parent().resources[get_parent().current_turn-1][0]>=inst.cost[0] and get_parent().resources[get_parent().current_turn-1][1]>=inst.cost[1] and get_parent().resources[get_parent().current_turn-1][2]>=inst.cost[2]:
					queued_after_select_position=["build",inst,selected]
					selecting_for="build"
					selecting_point_from_within=[1,selected.pos]
					selection_mode="choosing_pos"
		if Input.is_action_just_released("sa4"):
			var inst = wall_stone.instantiate()
			if get_parent().castles[get_parent().current_turn-1].level>=inst.needs_level:
				if get_parent().resources[get_parent().current_turn-1][0]>=inst.cost[0] and get_parent().resources[get_parent().current_turn-1][1]>=inst.cost[1] and get_parent().resources[get_parent().current_turn-1][2]>=inst.cost[2]:
					queued_after_select_position=["build",inst,selected]
					selecting_for="build"
					selecting_point_from_within=[1,selected.pos]
					selection_mode="choosing_pos"
		if Input.is_action_just_released("sa5"):
			var inst = farm.instantiate()
			if get_parent().castles[get_parent().current_turn-1].level>=inst.needs_level:
				if get_parent().resources[get_parent().current_turn-1][0]>=inst.cost[0] and get_parent().resources[get_parent().current_turn-1][1]>=inst.cost[1] and get_parent().resources[get_parent().current_turn-1][2]>=inst.cost[2]:
					queued_after_select_position=["build",inst,selected]
					selecting_for="build"
					selecting_point_from_within=[1,selected.pos]
					selection_mode="choosing_pos"
		if Input.is_action_just_released("sa6"):
			var inst = mine.instantiate()
			if get_parent().castles[get_parent().current_turn-1].level>=inst.needs_level:
				if get_parent().resources[get_parent().current_turn-1][0]>=inst.cost[0] and get_parent().resources[get_parent().current_turn-1][1]>=inst.cost[1] and get_parent().resources[get_parent().current_turn-1][2]>=inst.cost[2]:
					queued_after_select_position=["build",inst,selected]
					selecting_for="build_mine"
					selecting_point_from_within=[1,selected.pos]
					selection_mode="choosing_pos"
		if Input.is_action_just_released("sa7"):
			var inst = wall_wood.instantiate()
			if get_parent().castles[get_parent().current_turn-1].level>=inst.needs_level:
				if get_parent().resources[get_parent().current_turn-1][0]>=inst.cost[0] and get_parent().resources[get_parent().current_turn-1][1]>=inst.cost[1] and get_parent().resources[get_parent().current_turn-1][2]>=inst.cost[2]:
					queued_after_select_position=["build",inst,selected]
					selecting_for="build"
					selecting_point_from_within=[1,selected.pos]
					selection_mode="choosing_pos"
					
	elif selection_mode=="barracks":
		get_node("special_action1").texture_normal=spear_png
		get_node("special_action2").texture_normal=horse_png
		get_node("special_action3").texture_normal=musket_png
		get_node("special_action4").texture_normal=cannon_png
		get_node("special_action5").texture_normal=knight_png
		get_node("special_action6").texture_normal=null_png
		get_node("special_action7").texture_normal=null_png
		get_node("special_action8").texture_normal=null_png
		get_node("info").text="health:\n" +str(selected.hp)+"\nTRAIN \nUNITS!!"
		if Input.is_action_just_released("sa1"):
			var inst = spear_man.instantiate()
			if get_parent().castles[get_parent().current_turn-1].level>=inst.needs_level and not selected.trained and get_parent().used_population()+inst.pop<=get_parent().castles[get_parent().current_turn-1].population[get_parent().castles[get_parent().current_turn-1].level] :
				if get_parent().resources[get_parent().current_turn-1][0]>=inst.cost[0] and get_parent().resources[get_parent().current_turn-1][1]>=inst.cost[1] and get_parent().resources[get_parent().current_turn-1][2]>=inst.cost[2]:
					queued_after_select_position=["summon",inst,selected]
					selecting_for="unit_summon"
					selecting_point_from_within=[1,selected.pos]
					selection_mode="choosing_pos"
		if Input.is_action_just_released("sa2"):
			var inst = horse_man.instantiate()
			if get_parent().castles[get_parent().current_turn-1].level>=inst.needs_level and not selected.trained and get_parent().used_population()+inst.pop<=get_parent().castles[get_parent().current_turn-1].population[get_parent().castles[get_parent().current_turn-1].level] :
				if get_parent().resources[get_parent().current_turn-1][0]>=inst.cost[0] and get_parent().resources[get_parent().current_turn-1][1]>=inst.cost[1] and get_parent().resources[get_parent().current_turn-1][2]>=inst.cost[2]:
					queued_after_select_position=["summon",inst,selected]
					selecting_for="unit_summon"
					selecting_point_from_within=[1,selected.pos]
					selection_mode="choosing_pos"
		if Input.is_action_just_released("sa3"):
			var inst = musketeer.instantiate()
			if get_parent().castles[get_parent().current_turn-1].level>=inst.needs_level and not selected.trained and get_parent().used_population()+inst.pop<=get_parent().castles[get_parent().current_turn-1].population[get_parent().castles[get_parent().current_turn-1].level] :
				if get_parent().resources[get_parent().current_turn-1][0]>=inst.cost[0] and get_parent().resources[get_parent().current_turn-1][1]>=inst.cost[1] and get_parent().resources[get_parent().current_turn-1][2]>=inst.cost[2]:
					queued_after_select_position=["summon",inst,selected]
					selecting_for="unit_summon"
					selecting_point_from_within=[1,selected.pos]
					selection_mode="choosing_pos"
		if Input.is_action_just_released("sa4"):
			var inst = cannon.instantiate()
			if get_parent().castles[get_parent().current_turn-1].level>=inst.needs_level and not selected.trained and get_parent().used_population()+inst.pop<=get_parent().castles[get_parent().current_turn-1].population[get_parent().castles[get_parent().current_turn-1].level] :
				if get_parent().resources[get_parent().current_turn-1][0]>=inst.cost[0] and get_parent().resources[get_parent().current_turn-1][1]>=inst.cost[1] and get_parent().resources[get_parent().current_turn-1][2]>=inst.cost[2]:
					queued_after_select_position=["summon",inst,selected]
					selecting_for="unit_summon"
					selecting_point_from_within=[1,selected.pos]
					selection_mode="choosing_pos"
		if Input.is_action_just_released("sa5"):
			var inst = knight.instantiate()
			if get_parent().castles[get_parent().current_turn-1].level>=inst.needs_level and not selected.trained and get_parent().used_population()+inst.pop<=get_parent().castles[get_parent().current_turn-1].population[get_parent().castles[get_parent().current_turn-1].level] :
				if get_parent().resources[get_parent().current_turn-1][0]>=inst.cost[0] and get_parent().resources[get_parent().current_turn-1][1]>=inst.cost[1] and get_parent().resources[get_parent().current_turn-1][2]>=inst.cost[2]:
					queued_after_select_position=["summon",inst,selected]
					selecting_for="unit_summon"
					selecting_point_from_within=[1,selected.pos]
					selection_mode="choosing_pos"
	else:
		get_node("special_action1").texture_normal=null_png
		get_node("special_action2").texture_normal=null_png
		get_node("special_action3").texture_normal=null_png
		get_node("special_action4").texture_normal=null_png
		get_node("special_action5").texture_normal=null_png
		get_node("special_action6").texture_normal=null_png
		get_node("special_action7").texture_normal=null_png
		get_node("special_action8").texture_normal=null_png
		get_node("info").text=""
		
		
	
	get_node("turn_of").text="turn_of:\n"+str(get_parent().current_turn)+"\nturn:"+str(get_parent().turns_played)
	get_node("food").text=str(get_parent().resources[get_parent().current_turn-1][0])
	get_node("wood").text=str(get_parent().resources[get_parent().current_turn-1][1])
	get_node("metal").text=str(get_parent().resources[get_parent().current_turn-1][2])
	get_node("time_left").text=str(int(get_parent().turn_times[get_parent().current_turn-1]))
	if Input.is_action_pressed("view_up"):
		global_transform.origin.y-=10
	elif Input.is_action_pressed("view_down"):
		global_transform.origin.y+=10
	elif Input.is_action_pressed("view_right"):
		global_transform.origin.x+=10
	elif Input.is_action_pressed("view_left"):
		global_transform.origin.x-=10
	elif Input.is_action_pressed("reset_select"):
		selected=null
		state=0
		selection_mode="none"
	elif Input.is_action_just_released("end_turn") or get_parent().turn_times[get_parent().current_turn-1]<0:
		for x in range(get_parent().n_players):
			get_parent().turn_times[x]=get_parent().turn_time
		get_parent().states[get_parent().current_turn-1]=1
		get_parent().pass_turn()
		state=0
		selected=null
		selection_mode="none"
		
		
	elif Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) :
		if get_parent().states[get_parent().current_turn-1]==0:
			var pos :Vector2= get_global_mouse_position()
			var inst = castle.instantiate()
			inst.global_transform.origin = Vector2(int((pos.x+32)/64)*64,int((pos.y+32)/64)*64) 
			var grid_pos = Vector2(int((pos.x+32)/64),int((pos.y+32)/64))
			if grid_pos.x>=0 and grid_pos.y>=0 and grid_pos.x<get_parent().get_node("level").size.x and grid_pos.y<get_parent().get_node("level").size.y:
				if get_parent().get_node("level").grid[grid_pos.y][grid_pos.x]==0 and not get_parent().grid2[grid_pos.y][grid_pos.x] :
					get_parent().grid2[grid_pos.y][grid_pos.x]=inst
					inst.pos=grid_pos
					inst.owner_id=get_parent().current_turn
					get_parent().get_node("level").add_child(inst)
					get_parent().states[get_parent().current_turn-1]=-1
					get_parent().castles.append(inst)
		if get_parent().states[get_parent().current_turn-1]==1 and selection_mode!="choosing_pos":
			match state:
				0:
					var pos :Vector2= get_global_mouse_position()
					var grid_pos = Vector2(int((pos.x+32)/64),int((pos.y+32)/64))
					if get_parent().grid2[grid_pos.y][grid_pos.x]:
						if get_parent().grid2[grid_pos.y][grid_pos.x].get_meta("selectable",false):
							if get_parent().grid2[grid_pos.y][grid_pos.x].owner_id == get_parent().current_turn:
								selected=get_parent().grid2[grid_pos.y][grid_pos.x]
								selection_mode=selected.selection_type
			
	if get_parent().states[get_parent().current_turn-1]==0:
		get_node("info").text="choose start\nposition"
	if get_parent().states[get_parent().current_turn-1]==-1:
		get_node("info").text="end your\nturn"

		
