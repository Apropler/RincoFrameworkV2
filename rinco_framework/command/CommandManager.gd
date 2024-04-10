class_name CommandManager

var undo_stacks := {}

var _architecture: RincoArchitecture
func _init(architecture: RincoArchitecture):
	_architecture = architecture

func execute(command: RincoCommand):
	command.architecture = _architecture
	command.execute()
	var group = command.group
	var group_stack := []
	if group in undo_stacks.keys():
		group_stack = undo_stacks[group]
	group_stack.push_back(command)
	
	undo_stacks[group] = group_stack
		
func undo(group: String):
	if not group in undo_stacks.keys():
		return
	var group_stack = undo_stacks[group]
	if group_stack:
		var command = group_stack.pop_back()
		command.undo()
	


