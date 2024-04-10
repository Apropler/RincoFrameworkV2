class_name FlagPool

var _pool_name: String
var _flags : Array = []

var config = ConfigFile.new()

func _init(pool_name: String):
	_pool_name = pool_name
	var err = config.load("user://flags.cfg")
	if err == OK:
		_flags = config.get_value("Flag", pool_name, [])
	
func append(flag: String):
	if not _flags.has(flag):
		_flags.append(flag)
		_save_flag(_flags)

func remove(flag: String):
	_flags.erase(flag)
	_save_flag(_flags)

func clear():
	_flags.clear()
	_save_flag(_flags)

func has(flag: String):
	return _flags.has(flag)

func _save_flag(value):
	config.set_value("Flag", _pool_name, value)
	config.save("user://flags.cfg")
