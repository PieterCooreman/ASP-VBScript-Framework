<%
'turn any text into a canvas image (PNG)
set form=aspl.form

set canvas = form.field("canvas")
canvas.add "id","servertext"
canvas.add "width","$('#sampleform27').width()"

if form.postback then
	canvas.add "height","70"
	text=aspl.getRequest("yourname")
else
	canvas.add "height","1"
	text="turn servertext into an image"
end if

set name = form.field ("text")
name.add "name","yourname"
name.add "required",true
name.add "class","form-control"
name.add "value",text
name.add "maxlength","40"

js=aspl.loadText("default/html/sampleform27.resx")
js=replace(js,"[name]",aspl.sanitizeJS(text),1,-1,1)
set script = form.field("script")
script.add "text",js

set submit = form.field("submit")
submit.add "value","Create PNG"
submit.add "class","btn btn-success"
submit.add "style","margin-top:5px"

form.build
%>