extends MarginContainer


@onready var label = $MarginContainer/label
@onready var timer = $LetterDisplayTimer

const MAX_WIDTH = 256

var text=""
var letter_index=0

var letter_time = 0.03
var space_time = 0.06
var punctuation_time = 0.2

signal finish_displaying()





