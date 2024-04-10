class_name StorageUtil extends RincoComponent

var config = ConfigFile.new()

func _init():
	var err = config.load("user://user_data.cfg")
	if err != OK:
		print("加载失败")

func save_data(section: String, key: String, value):
	config.set_value(section, key, value)
	config.save("user://user_data.cfg")

func load_data(section: String, key: String, default_value=0):
	var value = config.get_value(section, key, default_value)
	return value
