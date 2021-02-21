params ["_builder", "_title", "_values", "_labels"];

private _items = _builder select 1;
_items pushBack 
	[
		"COMBO",
		_title, 
		[
			_values,
			_labels apply { [_x, "", "", [1, 1, 1, 1]] },
			0
		]
	];

_builder