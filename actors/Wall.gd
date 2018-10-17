tool

extends StaticBody2D

export (PoolVector2Array) var points setget set_points

func set_points(pts):
	points = pts
	if has_node('CollisionShape2D'):
		refresh()
		
func _ready():
	refresh()
	
func refresh():
	var shape = ConvexPolygonShape2D.new()
	if points == null or len(points) < 3:
		points = PoolVector2Array([Vector2(-100,-100),Vector2(100,-100),Vector2(100,100),Vector2(-100,100)]) # clockwise!
	shape.set_points(points)
	$CollisionShape2D.set_shape(shape)
	$Polygon2D.set_polygon(points)
	