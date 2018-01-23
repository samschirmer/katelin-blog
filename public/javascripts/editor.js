var editor = ace.edit("editor");
editor.session.setMode("ace/mode/css");
if (document.getElementById('stylesheet_body') == null) {
	var textarea = document.getElementById('post_body');
} else {
	var textarea = document.getElementById('stylesheet_body');
}
editor.getSession().on("change", function () {
	textarea.value = editor.getValue();
});

