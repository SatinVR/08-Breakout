extends RigidBody2D

var Lives = 0 #declares lives variable
var Score = 0 #declare score variable
func _ready():
    contact_monitor = true
    set_max_contacts_reported(4)

func _init():
	Lives = 5 #sets amount of lives to declared number

func _physics_process(delta):
    var bodies = get_colliding_bodies()
    for body in bodies:
        if body.is_in_group("Tiles"):
            body.queue_free()
            Score = Score + 1
            if Score == 65:
                 self.queue_free() 
        if body.is_in_group("Killbox"): #If colliding with Killbox
            if Lives == 0: #checks if no lives remaining
	             self.queue_free() #Removes ball from scene
            Lives = Lives - 1 #Removes life
            self.global_position.x = 510 #Resets ball back to starting values
            self.global_position.y = 500
            self.linear_velocity.x = 200
            self.linear_velocity.y = -200
    if position.y > get_viewport_rect().end.y:
        queue_free()