
#!/usr/bin/env python

import os
from bottle import route, run, static_file, template, view
from bottle import get, post, request
import clips_terminal

@route('/css/<filename>')
def img_static(filename):
	return static_file(filename, root='./static/css')

@route('/img/<filename>')
def img_static(filename):
	return static_file(filename, root='./static/img')

@route('/js/<filename>')
def js_static(filename):
	return static_file(filename, root='./static/js')


clips_process = clips_terminal.start()

@route("/")
@view("web_connect")
def hello():
	while True:
		isQn,content = clips_terminal.getContent(clips_process)
		if isQn:
			if '(yes/no)' in content:
				return dict(title='Questions to User',user = 'Balu',question=content, opt1="yes", opt2="no", opt3=None)
			elif '(1/2)' in content:
				return dict(title='Questions to User',user = 'Balu',question=content, opt1="1", opt2="2", opt3=None)
			elif '(1/2/3)' in content:
				return dict(title='Questions to User',user = 'Balu',question=content, opt1="1", opt2="2",opt3="3")
		else:
			clips_terminal.giveSuggestion(clips_process,content)
			return suggest(content)

@route('/',method="POST")
def recFacts():
	answer =  request.forms.get('ques')
	clips_terminal.giveAnswer(clips_process,answer)
	return hello()

@route("/estimate")
@view("estimate")
def suggest(suggestion):
	clips_process.kill()
	print 'process killed'
	return dict(content=suggestion,user = 'Balu')

# -------------------MAIN START----------------------------
if __name__ == "__main__":
	port = int(os.environ.get("PORT", 5002))
	run(
	host='localhost',
	port=port,
	debug=True,
	reloader = True
	)
# -------------------MAIN END----------------------------
