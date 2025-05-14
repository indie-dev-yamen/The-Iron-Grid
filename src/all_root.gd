extends Node2D

var main :=load("res://main.tscn") 
var end_:=load("res://end_screen.tscn")
var winner_id:=-1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if winner_id!=-1:
		remove_child(get_node("main"))
		var inst = end_.instantiate()
		if winner_id==0:
			inst.get_node("TextEdit").text="     TIE"
		else:
			inst.get_node("TextEdit").text="WINNER\nPLAYER "+str(winner_id)
		winner_id=-1
			
		add_child(inst)
	if Input.is_action_just_released("start"):
		values.fort_hp=int(get_node("main_menu/stats").text)
		values.fort_armor=int(get_node("main_menu/stats2").text)
		values.fort_income=int(get_node("main_menu/stats3").text)
		values.fort_population=int(get_node("main_menu/stats4").text)

		values.castle_hp=int(get_node("main_menu/stats12").text)
		values.castle_armor=int(get_node("main_menu/stats13").text)
		values.castle_income=int(get_node("main_menu/stats14").text)
		values.castle_population=int(get_node("main_menu/stats15").text)
		values.castle_cost_food=int(get_node("main_menu/stats16").text)
		values.castle_cost_wood=int(get_node("main_menu/stats17").text)
		values.castle_cost_metal=int(get_node("main_menu/stats18").text)

		values.mega_castle_hp=int(get_node("main_menu/stats23").text)
		values.mega_castle_armor=int(get_node("main_menu/stats24").text)
		values.mega_castle_income=int(get_node("main_menu/stats25").text)
		values.mega_castle_population=int(get_node("main_menu/stats26").text)
		values.mega_castle_cost_food=int(get_node("main_menu/stats27").text)
		values.mega_castle_cost_wood=int(get_node("main_menu/stats28").text)
		values.mega_castle_cost_metal=int(get_node("main_menu/stats29").text)

		values.barracks_hp=int(get_node("main_menu/stats45").text)
		values.barracks_armor=int(get_node("main_menu/stats46").text)
		values.barracks_cost_food=int(get_node("main_menu/stats47").text)
		values.barracks_cost_wood=int(get_node("main_menu/stats48").text)
		values.barracks_cost_metal=int(get_node("main_menu/stats49").text)

		values.farm_hp=int(get_node("main_menu/stats34").text)
		values.farm_armor=int(get_node("main_menu/stats35").text)
		values.farm_income=int(get_node("main_menu/stats36").text)
		values.farm_cost_food=int(get_node("main_menu/stats37").text)
		values.farm_cost_wood=int(get_node("main_menu/stats38").text)
		values.farm_cost_metal=int(get_node("main_menu/stats39").text)

		values.mine_hp=int(get_node("main_menu/stats56").text)
		values.mine_armor=int(get_node("main_menu/stats57").text)
		values.mine_income=int(get_node("main_menu/stats58").text)
		values.mine_cost_food=int(get_node("main_menu/stats59").text)
		values.mine_cost_wood=int(get_node("main_menu/stats60").text)
		values.mine_cost_metal=int(get_node("main_menu/stats61").text)

		values.wall_wood_hp=int(get_node("main_menu/stats67").text)
		values.wall_wood_armor=int(get_node("main_menu/stats68").text)
		values.wall_wood_cost_food=int(get_node("main_menu/stats69").text)
		values.wall_wood_cost_wood=int(get_node("main_menu/stats70").text)
		values.wall_wood_cost_metal=int(get_node("main_menu/stats71").text)

		values.wall_stone_hp=int(get_node("main_menu/stats78").text)
		values.wall_stone_armor=int(get_node("main_menu/stats79").text)
		values.wall_stone_cost_food=int(get_node("main_menu/stats80").text)
		values.wall_stone_cost_wood=int(get_node("main_menu/stats81").text)
		values.wall_stone_cost_metal=int(get_node("main_menu/stats82").text)

		values.spear_hp=int(get_node("main_menu/stats89").text)
		values.spear_moves=int(get_node("main_menu/stats90").text)
		values.spear_pop=int(get_node("main_menu/stats91").text)
		values.spear_armor=int(get_node("main_menu/stats92").text)
		values.spear_cost_food=int(get_node("main_menu/stats93").text)
		values.spear_cost_wood=int(get_node("main_menu/stats94").text)
		values.spear_cost_metal=int(get_node("main_menu/stats95").text)
		values.spear_level=int(get_node("main_menu/stats96").text)
		values.spear_dmg=int(get_node("main_menu/stats97").text)
		values.spear_horse_dmg=int(get_node("main_menu/stats98").text)

		values.horse_hp=int(get_node("main_menu/stats100").text)
		values.horse_moves=int(get_node("main_menu/stats101").text)
		values.horse_pop=int(get_node("main_menu/stats102").text)
		values.horse_armor=int(get_node("main_menu/stats103").text)
		values.horse_cost_food=int(get_node("main_menu/stats104").text)
		values.horse_cost_wood=int(get_node("main_menu/stats105").text)
		values.horse_cost_metal=int(get_node("main_menu/stats106").text)
		values.horse_level=int(get_node("main_menu/stats107").text)
		values.horse_dmg=int(get_node("main_menu/stats108").text)

		values.musket_hp=int(get_node("main_menu/stats111").text)
		values.musket_moves=int(get_node("main_menu/stats112").text)
		values.musket_pop=int(get_node("main_menu/stats113").text)
		values.musket_armor=int(get_node("main_menu/stats114").text)
		values.musket_cost_food=int(get_node("main_menu/stats115").text)
		values.musket_cost_wood=int(get_node("main_menu/stats116").text)
		values.musket_cost_metal=int(get_node("main_menu/stats117").text)
		values.musket_level=int(get_node("main_menu/stats118").text)
		values.musket_dmg=int(get_node("main_menu/stats119").text)
		values.musket_range=int(get_node("main_menu/stats120").text)

		values.cannon_hp=int(get_node("main_menu/stats122").text)
		values.cannon_moves=int(get_node("main_menu/stats123").text)
		values.cannon_pop=int(get_node("main_menu/stats124").text)
		values.cannon_armor=int(get_node("main_menu/stats125").text)
		values.cannon_cost_food=int(get_node("main_menu/stats126").text)
		values.cannon_cost_wood=int(get_node("main_menu/stats127").text)
		values.cannon_cost_metal=int(get_node("main_menu/stats128").text)
		values.cannon_level=int(get_node("main_menu/stats129").text)
		values.cannon_dmg=int(get_node("main_menu/stats130").text)
		values.cannon_range=int(get_node("main_menu/stats131").text)

		values.knight_hp=int(get_node("main_menu/stats133").text)
		values.knight_moves=int(get_node("main_menu/stats134").text)
		values.knight_pop=int(get_node("main_menu/stats135").text)
		values.knight_armor=int(get_node("main_menu/stats136").text)
		values.knight_cost_food=int(get_node("main_menu/stats137").text)
		values.knight_cost_wood=int(get_node("main_menu/stats138").text)
		values.knight_cost_metal=int(get_node("main_menu/stats139").text)
		values.knight_level=int(get_node("main_menu/stats140").text)
		values.knight_dmg=int(get_node("main_menu/stats141").text)

		values.n_players=int(get_node("main_menu/TextEdit").text)
		values.start_food=int(get_node("main_menu/TextEdit2").text)
		values.start_wood=int(get_node("main_menu/TextEdit3").text)
		values.start_metal=int(get_node("main_menu/TextEdit4").text)
		values.n_wood=int(get_node("main_menu/TextEdit6").text)
		values.n_metal=int(get_node("main_menu/TextEdit7").text)
		values.map_size_x=int(get_node("main_menu/TextEdit8").text)
		values.map_size_y=int(get_node("main_menu/TextEdit10").text)
		values.earning_per_turn_food=int(get_node("main_menu/TextEdit11").text)
		values.earning_per_turn_wood=int(get_node("main_menu/TextEdit12").text)
		values.earning_per_turn_metal=int(get_node("main_menu/TextEdit13").text)
		values.earning_per_turn_bonus=int(get_node("main_menu/TextEdit15").text)
		values.turn_max=int(get_node("main_menu/TextEdit16").text)
		values.turn_time=int(get_node("main_menu/TextEdit17").text)
		var inst = main.instantiate()
		add_child(inst)
		remove_child(get_node("main_menu"))
		
