<%
option explicit  'include this line in all your code files - it ensures that you declare all variables you'll use.
asp.codebehind() 'include this line in all your code files - it ensures that this page does not load when called directly.

dim html,titletag,body
'resx files are never served to browsers, so they are safer to use
html=asp.ASP_loadfile("html/default.resx") 'html file (template)

titletag="Sample page"

'here you can typically add some sort of eventhandler

select case lcase(asp.getRequest("action"))
		
	case "clicklink"
		body="<p>Link was clicked</p>"
		'just for the fun of it... some stupid JavaScript in the header
		asp.js.addHEAD "window.onload=function(e){document.body.style.backgroundColor='#FAA'}"
		
		
	case "clickbutton"
		body="<p>Button was clicked</p>"
		asp.js.addHEAD "window.onload=function(e){document.body.style.backgroundColor='#FF0'}"

		
		'in this case, some javascript at the bottom too
		asp.js.addBODY "document.write ('JavaScript added right before the closing body-tag.')"
		
		
	case "loadclass"
	
		'CONDITIONAL load of an asp page/class
		asp.ASP_executeGlobal("code/class.asp")
		
		asp.js.addHEAD "window.onload=function(e){document.body.style.backgroundColor='#F5F'}"
		
		dim testObj
		set testObj=new cls_test
		body="<p>" & testObj.hello & "</p>"
		set testObj=nothing
		
	case "bootstrap"
	
		'override html file with a bootstrap starter template
		html=asp.ASP_loadfile("html/default_bootstrap.resx")
		
		dim i
		body=""
		for i=1 to 100
			'generate some random words with random lengths
			body=body & asp.randomtext(asp.randomnumber(5,20)) & " "
		next
		
	case else
	
		body="<p>No (known) action was detected. Initial load.</p>"
		
		'add some JavaScript code in the header of the page
		asp.js.addHEAD "window.onload=function(e){document.body.style.backgroundColor='#FFF'}"

end select


%>