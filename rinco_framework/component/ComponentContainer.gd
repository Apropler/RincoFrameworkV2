class_name ComponentContainer extends IOCContainer

var _architecture: RincoArchitecture
func _init(architecture: RincoArchitecture):
	_architecture = architecture
	
func register_component(component_class, component: RincoComponent):
	var component_name = str(component_class)
	component.architecture = _architecture
	register(component_name, component)

func get_component(component_class):
	var component_name = str(component_class)
	return get_instance(component_name)
