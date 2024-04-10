extends Node

@export var add_button: Button
@export var sub_button: Button
@export var count_text: Label

var model: RincoComponent

func _ready():
	model = CounterApp.component_container.get_component(CounterAppModel)
	
	CounterApp.signal_bus.connect_signal(CountChangeSignal, _update_view)
	
	add_button.pressed.connect(
		func(): CounterApp.command_manager.execute(IncreaseCountCommand.new())
	)
	sub_button.pressed.connect(
		func(): CounterApp.command_manager.execute(DecreaseCountCommand.new())
	)
	
	_update_view()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update_view(data:={}):
	count_text.text = str(model.count)
