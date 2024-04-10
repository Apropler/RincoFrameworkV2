extends RincoArchitecture

func _ready():
	# 注册信号
	signal_bus.register_signal([CountChangeSignal])
	
	# 注册flag
	flag_container.register_flag_pool("achievement")
	
	# 注册组件(模型)
	component_container.register_component(CounterAppModel, CounterAppModel.new())
	
	# 注册组件(系统)
	component_container.register_component(AchievementSystem, AchievementSystem.new())
	
	# 注册组件(工具)
	component_container.register_component(StorageUtil, StorageUtil.new())
