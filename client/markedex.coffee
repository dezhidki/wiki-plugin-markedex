###
 * Federated Wiki : Marked w/ KaTeX Plugin
###

load = (callback) ->
	wiki.getScript '/plugins/markedex/katex.min.js', ->
		wiki.getScript '/plugins/markedex/contrib/auto-render.min.js', ->
			wiki.getScript '/plugins/markedex/marked.min.js', callback
	if (!$("link[href='/plugins/markedex/katex.min.css']").length)
    	$('<link href="/plugins/markedex/katex.min.css" rel="stylesheet" type="text/css">').appendTo("head")

textify = (text) ->
	return window.marked text, { sanitize: true, kaTex: katex }

emit = ($item, item) ->
	load -> 
		$item.append "#{textify(item.text)}"

bind = ($item, item) ->
	$item.dblclick -> wiki.textEditor $item, item

window.plugins.markedex = {bind, emit}