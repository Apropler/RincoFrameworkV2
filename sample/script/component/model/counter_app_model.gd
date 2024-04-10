class_name CounterAppModel extends RincoComponent

var storage: StorageUtil

var count = 0:
	get:
		return count
	set(value):
		if count != value:
			count = value
			storage.save_data("Default", "count", count)
			signal_bus.emit(CountChangeSignal)

func _init_component():
	storage = component_container.get_component(StorageUtil)
	count = storage.load_data("Default", "count", 0)
			

