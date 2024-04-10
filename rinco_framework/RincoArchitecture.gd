class_name RincoArchitecture extends Node

var signal_bus: SignalBus
var flag_container: FlagContainer
var ui_stack: UIStack
var command_manager: CommandManager
var component_container: ComponentContainer

func _init():
	signal_bus = SignalBus.new()
	flag_container = FlagContainer.new()
	ui_stack = UIStack.new()
	component_container = ComponentContainer.new(self)
	command_manager = CommandManager.new(self)

# 初始化component
func _notification(what):
	if what == NOTIFICATION_READY:
		var all_component = component_container.get_all_instance()
		for c in all_component:
			c._init_component()
