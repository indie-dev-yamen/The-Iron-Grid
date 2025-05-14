extends Node2D
var n_players:=values.n_players
var current_turn:=1
var states:=[]
var castles:=[]
var resource_nodes:=[]
var grid2:=[]
var turn_times:=[]
var resources:=[]
var turn_time:=values.turn_time
var start_food:=values.start_food
var start_wood:=values.start_wood
var start_metal:=values.start_metal
var units:=[]
var buildings:=[]
var turns_played:=0
var turns_max:=values.turn_max

func _ready() -> void:
	 # Replace with function body.
	for n in range(n_players):
		states.append(0)
		turn_times.append(turn_time)
		resources.append([start_food, start_wood,start_metal])
		units.append([])
		buildings.append([])


func _process(delta: float) -> void:
	turn_times[current_turn-1]-=delta
	
func pass_turn():
	var turn_1_passed:=true
	if turns_played<n_players:
			turn_1_passed=false
	var ids_left:=[]
	for x in castles:
		if x.hp>0:
			ids_left.append(x.owner_id)
	if turn_1_passed:
		if ids_left.size()>1:
			for x in range(castles.size()):
				castles[x].got_resources=false
				castles[x].trained=false
				castles[x].armor_broken_this_turn=false
				castles[x].armor_c=castles[x].armor_d
				
				for unit in units[x]:
					if unit.get_meta("horse",false):
						unit.reset_pos()
					unit.moves_c=unit.moves_d
					unit.attacks_c=unit.attacks_d
					unit.armor_c=unit.armor_d
					unit.armor_broken_this_turn=false
				
		else:
			get_parent().winner_id=ids_left[0]
	for building in buildings[current_turn-1]:
		building.turn_ended()
	current_turn+=1
	turns_played+=1
	if turn_1_passed:
		while not (current_turn in ids_left):
			current_turn+=1
		
			if current_turn>n_players:
				current_turn=1
	if current_turn>n_players:
				current_turn=1
		
	if turns_played>=turns_max:
		var max_hp:=0
		var id:=0
		
		for x in ids_left:
			if castles[x-1].hp>max_hp:
				max_hp=castles[x-1].hp
				id = x
			elif castles[x-1].hp==max_hp:
				if castles[x-1].hp*100+resources[x-1][0]*5+resources[x-1][1]*10+resources[x-1][2]*20+units[x-1].size()*35>castles[id-1].hp*100+resources[id-1][0]*5+resources[id-1][1]*10+resources[id-1][2]*20+units[id-1].size()*35:
					id = x
				
		get_parent().winner_id=id
		
	
func used_population():
	var p:=0
	for unit in units[current_turn-1]:
		p+=unit.pop
	return p
	
