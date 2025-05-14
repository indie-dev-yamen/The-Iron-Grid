extends Node2D

var ground_tile:=load("res://ground_tile.tscn")
var metal_tile:=load("res://metal_tile.tscn")
var wood_tile:=load("res://wood_tile.tscn")

var size:=Vector2(values.map_size_x,values.map_size_y)
var grid:=[]
var rng := RandomNumberGenerator.new()
var n_metal := values.n_metal
var n_wood:=values.n_wood
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_land()
	rng.seed=10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func generate_land():
	for y in range(size.y):
		grid.append([])
		for x in range(size.x/2):
			grid[-1].append(0)
	while n_metal>0:
		var x=rng.randi_range(0,size.x/2-1)
		var y=rng.randi_range(0,size.y-1)
		if grid[y][x]==0:
			grid[y][x]=1
			n_metal-=1
	while n_wood>0:
		var x=rng.randi_range(0,size.x/2-1)
		var y=rng.randi_range(0,size.y-1)
		if grid[y][x]==0:
			grid[y][x]=2
			n_wood-=1
	for y in range(size.y):
		for x in range(size.x/2-1,-1,-1):
			grid[y].append(grid[y][x])
			
	for y in range(size.y):
		for x in range(size.x):
			match grid[y][x]:
				0:
					var tile = ground_tile.instantiate()
					add_child(tile)
					tile.global_transform.origin=Vector2(x*64,y*64)
				1:
					var tile = wood_tile.instantiate()
					add_child(tile)
					tile.global_transform.origin=Vector2(x*64,y*64)
				2:
					var tile = metal_tile.instantiate()
					add_child(tile)
					tile.global_transform.origin=Vector2(x*64,y*64)
	for y in range(grid.size()):
		get_parent().grid2.append([])
		for x in range(grid[y].size()):
			get_parent().grid2[-1].append(0)
	
