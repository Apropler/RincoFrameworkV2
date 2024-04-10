class_name DecreaseCountCommand extends RincoCommand

func execute():
	component_container.get_component(CounterAppModel).count -= 1
