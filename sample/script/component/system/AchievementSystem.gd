class_name AchievementSystem extends RincoComponent

enum Achievement{
	ROOKIE,
	INITIATE,
	EXPERT,
}

var model: CounterAppModel
var achievement_flag: FlagPool

func _init_component():
	model = component_container.get_component(CounterAppModel)
	achievement_flag = flag_container.get_flag_pool("achievement")
	
	signal_bus.connect_signal(CountChangeSignal, 
		func(data):
			if model.count == 10:
				achievement_completed(Achievement.INITIATE)
			elif model.count == 20:
				achievement_completed(Achievement.EXPERT)
			elif model.count == -10:
				achievement_completed(Achievement.ROOKIE)
	)
	
	reset_achievement()
	
func achievement_completed(achievement: Achievement):
	if not save_achievement(achievement):
		return
	
	match achievement:
		Achievement.ROOKIE:
			print("点击菜鸟.")
		Achievement.INITIATE:
			print("点击学徒.")
		Achievement.EXPERT:
			print("点击专家.")
	
func save_achievement(achievement: Achievement) -> bool:
	# 成就未解锁则保存并返回true, 已解锁则返回false
	if achievement_flag.has(str(achievement)):
		print("成就已解锁.")
		return false
	achievement_flag.append(str(achievement))
	return true
	
func reset_achievement():
	achievement_flag.clear()
	
