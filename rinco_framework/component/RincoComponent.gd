class_name RincoComponent extends Node

var architecture: RincoArchitecture:
	get:
		if not architecture: 
			push_error(("Component未设置架构."))
			return null
		else: 
			return architecture
	set(value):
		architecture = value

var signal_bus: SignalBus: 
	get: return architecture.signal_bus
var flag_container: FlagContainer:
	get: return architecture.flag_container
var ui_stack: UIStack:
	get: return architecture.ui_stack
var command_manager: CommandManager:
	get: return architecture.command_manager
var component_container: ComponentContainer:
	get: return architecture.component_container
	
func _init_component():
	pass
