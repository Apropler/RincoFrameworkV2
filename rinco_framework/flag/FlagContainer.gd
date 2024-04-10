class_name FlagContainer extends IOCContainer

func register_flag_pool(flag_pool_name: String):
	register(flag_pool_name, FlagPool.new(flag_pool_name))

func get_flag_pool(flag_pool_name: String):
	return get_instance(flag_pool_name)
