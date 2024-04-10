class_name RincoCommand

var architecture: RincoArchitecture:
	get:
		if not architecture: 
			push_error(("Command未设置架构."))
			return null
		else: 
			return architecture
	set(value):
		architecture = value

var signal_bus: SignalBus: 
	get: return architecture.signal_bus
var command_manager: CommandManager:
	get: return architecture.command_manager
var component_container: ComponentContainer:
	get: return architecture.component_container

var data: Dictionary
var group: String

func _init(init_data := {}, init_group := "default"):
	data = init_data
	group = init_group

func execute():
	print("execute.")
	
func undo():
	print("undo.")
