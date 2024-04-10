class_name SignalBus extends Node

var _signals = {}
	
# 实例化信号类
func register_signal(signal_classes: Array):
	for s in signal_classes:
		var new_signal = s.new()
		var key = str(new_signal.get_script())
		_signals[key] = new_signal

func connect_signal(signal_class, function: Callable):
	var key = str(signal_class)
	if key not in _signals:
		push_error("尝试连接未定义的信号.")
		return
	
	var target = _signals[key]
	target.connect_signal(function)
	
func disconnect_signal(signal_class, function: Callable):
	var key = str(signal_class)
	if key not in _signals:
		push_error("尝试断开未定义的信号.")
		return
	
	var target: RincoSignal = _signals[key]
	target.disconnect_signal(function)

func emit(signal_class, data := {}):
	var key = str(signal_class)
	if key not in _signals:
		push_error("尝试发送未定义的信号.")
		return
	
	var target: RincoSignal = _signals[key]
	target.emit_signal_with_data(data)
