class_name IOCContainer extends Node

var _instance_dict = {}

func register(key, value):
	_instance_dict[key] = value

func get_instance(key):
	if key not in _instance_dict:
		push_error("尝试从容器中获取未注册的实例.")
		return null
	return _instance_dict[key]
	
func get_all_instance():
	return _instance_dict.values()
